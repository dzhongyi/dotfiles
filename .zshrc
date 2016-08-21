# Oh-my-zsh's config #
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="dracula"
DISABLE_AUTO_UPDATE="true"
plugins=(git zsh-completions autojump brew)
autoload -U compinit && compinit

# Load config files, for example .aliases, .exports...
for file in .{exports,aliases}; do
  [ -f "$file" ] && source "$file"
done

# Autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

source "$ZSH/oh-my-zsh.sh"
