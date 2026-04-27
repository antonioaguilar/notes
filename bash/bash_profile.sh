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

# homebrew configuration
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_INSTALL_CLEANUP=1
export HOMEBREW_PATH="/opt/homebrew/opt"
export HOMEBREW_BIN="$(which brew)"

# application variable exports
export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"
export GOROOT="/usr/local/go"
export GOPROXY=https://proxy.golang.org
export BAT_THEME="Monokai Extended Bright"
export GST_PLUGIN_PATH=""

# application aliases
alias webstorm='open -a /Applications/WebStorm.app'
alias goland='open -na "GoLand.app" --args'

# terminal aliases
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ls='eza'
alias ll='ls -all'
alias l='ll'
alias cat="echo -e "" && bat -p"
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

# special macos aliases
alias ic='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'

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

# Kubernetes shortcuts
kcd() { kubectl create deployment $1 --image $1 --dry-run=client -o yaml; }

# local bash functions
mcd () { mkdir -p "$1" && cd "$1"; }
zipf () { zip -r "$1".zip "$1" ; }

# Git shortcuts
g() { git fetch --all --prune && git pull; }
ppr() { gh pr create --fill; }
gcr() { gh repo create "$1" --private --clone --disable-wiki; }
tig() { git add -A && git commit -m "$1" && git push; }
tug() { BASE_REPO_URL=`git config --get remote.origin.url`; git filter-repo --mailmap ~/gitmailmap.txt && git remote add origin $BASE_REPO_URL && git push --force --branches --prune && git push --force --tags --prune && git emails; }

# export global path variable
export PATH="$HOMEBREW_PATH/libpq/bin:$HOMEBREW_PATH/gnu-sed/libexec/gnubin:$HOMEBREW_PATH/grep/libexec/gnubin:$HOMEBREW_PATH/curl/bin:$HOMEBREW_PATH/zip/bin:$GOBIN:$PATH:$HOME/.local/bin:$HOMEBREW_PATH/mysql-client@8.4/bin"

# run local scripts on terminal start
eval "$($HOMEBREW_BIN shellenv)"
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

# brew install bat
# brew install eza
# brew install rg
# brew install kubecolor
# brew install starship
# brew install gnu-sed
# brew install git-delta
