eval "$(starship init zsh)"

function set_win_title(){
    echo -ne "\033]0; $(basename "$PWD") \007"
}

starship_precmd_user_func="set_win_title"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(zoxide init zsh)"
alias cd="z"
alias cls="clear"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias reload="source ~/.zshrc"
# Use eza as the default ls with icons and better formatting
alias ls='eza --icons --group-directories-first --time-style=long-iso'

# Common replacements with better defaults
alias ll='eza -l --icons --group-directories-first --time-style=long-iso'
alias la='eza -la --icons --group-directories-first --time-style=long-iso'
alias lt='eza -T --icons --group-directories-first --git-ignore'  # Tree view
alias lS='eza -l --icons --sort=size'  # Sort by size
alias lX='eza -l --icons --sort=extension'  # Sort by extension
alias lM='eza -l --icons --sort=modified'  # Sort by modified time
