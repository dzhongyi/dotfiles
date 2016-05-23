# Make hard links
for file in .{vimrc,zshrc,bashrc,bash_profile,bash_prompt,aliases,exports,dircolors,gitconfig,tmux.conf,ssh/config}; do
  target=~/$file
  if [[ -f $target ]]; then
    rm -rf $target
  fi
  ln $file $target
done
