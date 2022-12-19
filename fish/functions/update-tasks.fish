function update-tasks --wraps='tasks && addc && git push' --description 'alias update-tasks=tasks && addc && git push'
  tasks && addc && git push $argv; 
end
