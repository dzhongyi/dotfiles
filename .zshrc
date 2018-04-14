# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

## Alias
alias em="emacs -nw "
alias sz="source $HOME/.zshrc"
alias d="cd $HOME/Dropbox/ && clear"
alias dl="cd $HOME/Downloads/ && clear"
alias p="cd /Volumes/Projects/ && clear"
alias t="cd $HOME/Projects/tests && clear"
alias e='emacsclient -t'
alias ec='emacsclient -c'
alias ls='ls --color'


## Set python virtual env
## `mkvirtualenv` and `mkvirtualenv3` use python 3.6 to create python virtual env,
## `mkvirtualenv2` use python 2.7 to do it.
# export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python3"
# export WORKON_HOME="$HOME/.virtualenvs"
# export PROJECT_HOME="$HOME/Projects"
# export VIRTUALENVWRAPPER_SCRIPT="/usr/local/bin/virtualenvwrapper.sh"
# source "/usr/local/bin/virtualenvwrapper_lazy.sh"
# alias mkvirtualenv2="mkvirtualenv -p /usr/local/bin/python2"
# alias mkvirtualenv3="mkvirtualenv -p /usr/local/bin/python3"


## Set some command default use proxy, if you don't want to use a proxy please use _cmd.
DEFAULT_PROXY_CMD=(
    "wget"
    "curl"
    "brew"
    "youtube-dl"
    "git"
)
for cmd in ${DEFAULT_PROXY_CMD}; do
    proxy_cmd="proxychains4 -q ${cmd}"
    alias "_${cmd}"="${proxy_cmd}"
done

eval $(thefuck --alias)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

