# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

test -s ~/.alias && . ~/.alias || true

# ALIASES
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lg='lazygit'

alias dcs='docker ps | rg -v CONTAINER | fzf --multi --header "Choose one or more docker containers to stop" | awk '\''{print $1}'\'' | xargs -I {} docker stop {}'
alias dcd='docker ps -a | rg -v CONTAINER | fzf --multi --header "Choose one or more docker containers to delete" | awk '\''{print $1}'\'' | xargs -I {} docker rm {}'
alias did='docker images | rg -v IMAGE | fzf --multi --header "Choose one or more docker images to delete"'

# YAZI function
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Set up zoxide
eval "$(zoxide init bash)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
