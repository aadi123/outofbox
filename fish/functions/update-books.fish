function update-books --wraps='books && addc && git push' --description 'alias update-books=books && addc && git push'
  books && addc && git push $argv; 
end
