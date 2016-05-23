############################  BASIC FUNCTIONS
msg() {
  printf '%b\n' "$1" >&2
}

success() {
    msg "\33[32m[✔]\33[0m ${1}${2}"
}

error() {
  msg "\33[31m[✘]\33[0m ${1}${2}"
  exit 1
}

############################  MAIN
# Create hard links, for example .vimrc => ~/.vimrc.
msg "Start create hard links..."
files=".vimrc .zshrc .bashrc .bash_profile .bash_prompt .aliases .exports .dircolors .gitconfig .tmux.conf .ssh/config"
for file in $files; do
  target=$HOME/$file
  if [[ -f $target ]]; then
    rm -rf $target
  fi
  ln $file $target
done
unset target
success "Created hard links:"
for file in $files; do
  printf "        %-30s  ==>  %s\n" "$HOME/$file" "./$file" >&2
done
unset file
unset files


# Install vim plugins.
# 1. Install vim plugins manage Vundle.vim
# 2. Use Vundle install vim plugins.
msg "\nStart install vim plugins..."
vundle_path="$HOME/.vim/bundle/Vundle.vim"
if [[ -d $vundle_path ]]; then
  cd $vundle_path && git pull
  success "1. Update $vundle_path"
else
  git clone https://github.com/VundleVim/Vundle.vim.git $vundle_path
  success "1. Clone $vundle_path"
fi
unset vundle_path
vim +PluginInstall +qall
success "2. Installed vim plugins. To see more at ~/.vimrc."
