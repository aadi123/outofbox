function addc --wraps=git\ add\ -A\ \&\&\ git\ commit\ -m\ \"Second\ Brain\ Update\ on\ `date\ +\'\%Y-\%m-\%d\ \%H:\%M:\%S\'`\" --wraps='git add -A && git commit -m "Update"' --wraps='git add -A && git commit -m "Update" && git push' --description 'alias addc=git add -A && git commit -m "Update" && git push'
  git add -A && git commit -m "Update" && git push $argv; 
end
