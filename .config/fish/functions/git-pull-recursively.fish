function git-pull-recursively --wraps=find\ .\ -name\ .git\ -type\ d\ -prune\ \|\ sed\ \'s,/\*\[^/\]\\+/\*\$,,\'\ \|\ xargs\ -P4\ -I\{\}\ bash\ -c\ \'cd\ \{\}\ \&\&\ git\ pull\' --wraps=find\ .\ -name\ .git\ -type\ d\ -prune\ \|\ sed\ \'s,/\*\[^/\]\\+/\*\$,,\'\ \|\ xargs\ -P8\ -I\{\}\ bash\ -c\ \'cd\ \{\}\ \&\&\ git\ pull\' --description alias\ git-pull-recursively\ find\ .\ -name\ .git\ -type\ d\ -prune\ \|\ sed\ \'s,/\*\[^/\]\\+/\*\$,,\'\ \|\ xargs\ -P8\ -I\{\}\ bash\ -c\ \'cd\ \{\}\ \&\&\ git\ pull\'
  find . -name .git -type d -prune | sed 's,/*[^/]\+/*$,,' | xargs -P8 -I{} bash -c 'cd {} && git pull' $argv; 
end
