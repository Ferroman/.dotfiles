function cdfzf --wraps=cd --wraps='cd (fdfind --type directory | fzf)' --description 'alias cdfzf cd (fdfind --type directory | fzf)'
  cd (fdfind --type directory | fzf) $argv; 
end
