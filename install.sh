# Make hard links
for file in .{vimrc,zshrc,bashrc,aliases,exports,dircolors,gitconfig,tmux.conf,ssh/config}; do
  target=~/$file
  if [[ -f $target ]]; then
    rm $target "$target.backup"
  fi
  ln $file $target
done
