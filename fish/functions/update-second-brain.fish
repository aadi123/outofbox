function update-second-brain --wraps='second-brain && addc' --description 'alias update-second-brain=second-brain && addc'
  second-brain && addc $argv; 
end
