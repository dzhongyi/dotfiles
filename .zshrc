# Oh-my-zsh's config #
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="lambda"
DISABLE_AUTO_UPDATE="true"
plugins=(git python pip django virtualenv virtualenvwrapper zsh-completions autojump brew)
autoload -U compinit && compinit

# Personal config
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

# Load config files, for example .aliases, .exports...
for file in .{aliases,exports}; do
  [ -f "$file" ] && source "$file"
done

# Autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

source "$ZSH/oh-my-zsh.sh"
