# Oh-my-zsh's config #
export ZSH=/Users/zhongyid/.oh-my-zsh
ZSH_THEME="lambda"
DISABLE_AUTO_UPDATE="true"
plugins=(git python pip django virtualenv virtualenvwrapper zsh-completions autojump brew)
autoload -U compinit && compinit

## Personal config #
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
eval `dircolors .dircolors`

# Shortcuts
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/projects"
alias g="git"
alias h="history"

# Autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

source $ZSH/oh-my-zsh.sh
