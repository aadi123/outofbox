function update-dotfiles --wraps='dotfiles && addc' --description 'alias update-dotfiles=dotfiles && addc'
  dotfiles && addc $argv; 
end
