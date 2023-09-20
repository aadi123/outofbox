#! /home/aaditya/.pyenv/versions/langchain/bin/python3

import openai
import os
from langchain.document_loaders import TextLoader
from langchain.text_splitter import (
    MarkdownHeaderTextSplitter,
    RecursiveCharacterTextSplitter,
)

openai.api_key = os.environ["OPENAI_API_KEY"]

loader = TextLoader(file_path="/home/aaditya/llms.md")
docs = loader.load()
txt = " ".join([d.page_content for d in docs])

headers_to_split_on = [
    ("#", "Header 1"),
    ("##", "Header 2"),
]
markdown_splitter = MarkdownHeaderTextSplitter(headers_to_split_on=headers_to_split_on)
r_splitter = RecursiveCharacterTextSplitter(
    chunk_size=150, chunk_overlap=10, separators=["\n\n", "\n", "(?<=\. )", " ", ""]
)

trans_docs = r_splitter.split_documents(markdown_splitter.split_text(txt))
print(trans_docs)

from langchain.embeddings.openai import OpenAIEmbeddings
from langchain.vectorstores import Chroma

embedding = OpenAIEmbeddings(client=None)
persist_dir = "docs/chroma"
vectordb = Chroma.from_documents(
    documents=trans_docs, embedding=embedding, persist_directory=persist_dir
)
from langchain.retrievers.self_query.base import SelfQueryRetriever
from langchain.chains.query_constructor.schema import AttributeInfo

metadata_field_info = [
    AttributeInfo(
        name="Header 1",
        description="The main top-level header for the content",
        type="string",
    ),
    AttributeInfo(
        name="Header 2",
        description="The secondary header for the content",
        type="string",
    ),
]

from langchain.chat_models import ChatOpenAI
from langchain.chains import RetrievalQA

llm = ChatOpenAI(model="gpt-3.5-turbo-16k", temperature=0)
document_content_description = "5 year goals"
retriever = SelfQueryRetriever.from_llm(
    llm, vectordb, document_content_description, metadata_field_info, verbose=True
)
qa_chain = RetrievalQA.from_chain_type(llm, retriever=retriever)
while True:
    question = input()
    result = qa_chain({"query": question})
    print(result["result"])
