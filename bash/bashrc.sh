# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# disable bash warnings
export BASH_SILENCE_DEPRECATION_WARNING=1

# no duplicate entries in history
export HISTCONTROL=ignoredups:erasedups

# save all history into big file
export HISTSIZE=10000
export HISTFILESIZE=10000

# append to history don't overwrite it
shopt -s histappend

# set default editor to GNU nano
export VISUAL='code'
export EDITOR=/opt/homebrew/bin/nano

# default block size for ls, df, du
export BLOCKSIZE=1k

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so: sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# You may want to put all your additions into a separate file like
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# terminal aliases
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ls='eza'
alias ll='ls -all'
alias l='ll'
alias cat="echo -e "" && batcat -p"
alias curl="curl -s"
alias grep="grep --color=auto"
alias less='less -FSRXc'
alias tree='tree -h'
alias grep="grep --color=auto"
alias ns="sudo lsof -i -n -P | grep TCP"
alias search="grep -r -wine "
alias python="uv run python"
alias pip="uv pip"
alias kubectl='kubecolor'
alias k='kubectl'
alias kt='kubectl get all -A'
alias kw='watch -n1 -c -t kubectl get all -A'
alias kl='kubectl logs --max-log-requests=10 -l'
alias ffmpeg="ffmpeg -hide_banner"
alias ffplay="ffplay -hide_banner -autoexit -alwaysontop"
alias ffprobe="ffprobe -hide_banner"
alias claude="claude --verbose --dangerously-skip-permissions --permission-mode=plan"

# cleaning scripts
alias cleanDS="find . -type f -name '*.DS_Store' -ls -delete"
alias cleanVS="find . -name '.vscode' -type d -exec rm -vrf {} +"
alias cleanIDEA="find . -name '.idea' -type d -exec rm -vrf {} +"
alias cleanNPM="find . -name 'node_modules' -type d -exec rm -vrf {} + && find . -type f -name 'package-lock.json' -ls -delete"
alias cleanGIT="find . -name '.git' -type d -exec rm -vrf {} +"
alias cleanAll="cleanDS && cleanVS && cleanIDEA && cleanNPM"

# docker scripts
alias docker-compose-up='docker compose up --remove-orphans --build --watch'
alias docker-compose-down='docker compose down --remove-orphans -t 5 -v'
export DOCKER_PATH=$HOME/.docker
export PATH="$DOCKER_PATH/bin:$PATH"

# Kubernetes shortcuts
kcd() { kubectl create deployment $1 --image $1 --dry-run=client -o yaml; }

# local bash functions
mcd () { mkdir -p "$1" && cd "$1"; }
zipf () { zip -r "$1".zip "$1" ; }

# Git shortcuts
g() { git fetch --all --prune && git pull; }
tig() { git add -A && git commit -m "$1" && git push; }
gff() { git checkout main -b feat/"$1"; }
gfx() { git checkout main -b fix/"$1"; }
gdd() { git branch -D $1; }
gtt() { git reset --hard HEAD; }
grr() { git push origin --delete $1; }
ppr() { gh pr create --fill; }
gcr() { gh repo create "$1" --private --clone --disable-wiki; }
gdr() { gh repo delete --yes "$1"; }
tug() { BASE_REPO_URL=`git config --get remote.origin.url`; git filter-repo --mailmap ~/gitmailmap.txt && git remote add origin $BASE_REPO_URL && git push --force --branches --prune && git push --force --tags --prune && git emails; }

# run local scripts on terminal start
eval "$(starship init bash)"

# needed by uv package manager
# . "$HOME/.local/bin/env"

# declare the NVM folder
export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun aliases
alias bunx='bunx --silent'

# Gemini CLI
alias gg='gemini --approval-mode=yolo'
export GOOGLE_CLOUD_PROJECT=""
