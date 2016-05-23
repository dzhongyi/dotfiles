# Make hard links
for file in .{vimrc,zshrc,aliases,exports}; do
  target=~/$file
  if [[ -f $target ]]; then
    mv $target "$target.backup"
  fi
  ln $file $target
done
