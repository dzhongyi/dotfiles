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
# Install oh-my-zsh.
msg "Start install oh-my-zsh..."
if [[ -d $HOME/.oh-my-zsh ]]; then
  cd $HOME/.oh-my-zsh && git pull && cd -
  success "Update oh-my-zsh."
else
  # TODO: Exec it open a new shell zsh and the script stop here, must input `exit` to continue this script.
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  success "Install oh-my-zsh."
fi
# Download dracula theme of zsh.
if [[ ! -f $HOME/.oh-my-zsh/themes/dracula.zsh-theme ]]; then
  wget https://raw.githubusercontent.com/zenorocha/dracula-theme/master/zsh/dracula.zsh-theme -O $HOME/.oh-my-zsh/themes/dracula.zsh-theme
  success "Downloaded zsh dracula theme."
fi

# Create hard links, for example .vimrc => ~/.vimrc.
msg "\nStart create hard links..."
files=".vimrc .zshrc .bashrc .bash_profile .bash_prompt .aliases .exports .dircolors .gitconfig .tmux.conf .ssh/config"
for file in $files; do
  target=$HOME/$file
  if [[ -f $target ]]; then
    rm -rf $target
    success "Deleted old $target."
  fi
  ln $file $target
done
unset target
success "Created hard links:"
for file in $files; do
  printf "    %-30s  ==>  %s\n" "$HOME/$file" "./$file" >&2
done
unset file
unset files


# Install vim plugins.
# 1. Install vim plugins manage Vundle.vim
msg "\nStart install vim plugins..."
vundle_path="$HOME/.vim/bundle/Vundle.vim"
if [[ -d $vundle_path ]]; then
  cd $vundle_path && git pull && cd -
  success "1. Update $vundle_path"
else
  git clone https://github.com/VundleVim/Vundle.vim.git $vundle_path
  success "1. Clone $vundle_path"
fi
unset vundle_path
# 2. Use Vundle install vim plugins.
vim +PluginInstall +qall
success "2. Installed vim plugins. To see more at ~/.vimrc."
# 3. Build YCM.
brew install cmake node go
cd "$HOME/.vim/bundle/YouCompleteMe" && ./install.py --system-libclang --clang-completer --gocode-completer --tern-completer
success "3. Build YCM done."
