### CUSTOM SCRIPTS
export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it

# Set Paths
export PATH="/usr/local/git/bin:/sw/bin/:/usr/local/bin:/usr/local/sbin:$PATH"

# insecure ssh
alias issh='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'

alias webstorm='open -a /Applications/WebStorm.app'

# Front-end development tools and shortcuts
alias chrome-webrtc='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --argsocode --use-fake-device-for-media-stream'
alias chrome-memory='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --enable-precise-memory-info --disable-extensions --enable-memory-benchmarking --full-memory-crash-report'
alias chrome-insecure='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --enable-precise-memory-info --disable-extensions --enable-memory-benchmarking --full-memory-crash-report --allow-running-insecure-content'
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'
alias chrome-cors='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --disable-features=CrossSiteDocumentBlockingAlways,CrossSiteDocumentBlockingIfIsolating'
alias brave='/Applications/Brave\ Browser.app/Contents/MacOS/Brave\ Browser --args --disable-web-security --user-data-dir=~/.brave'

#   Set Default Editor (change 'Nano' to the editor of your choice)
export EDITOR=/usr/bin/nano

#   Set default blocksize for ls, df, du
#   from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
export BLOCKSIZE=1k

#   Add color to terminal
#   (this is all commented out as I use Mac Terminal Profiles)
#   from http://osxdaily.com/2012/02/21/add-color-to-the-terminal-in-mac-os-x/
#export CLICOLOR=1
#export LSCOLORS=ExFxBxDxCxegedabagacad

alias ds='docker stats $(docker ps --format {{.Names}})'

alias fl='du -hsx * | sort | head -50'      # Find largest files recursively
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias l='ll'
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive

mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

# JSON utils, underscore-cli
alias json='underscore print --color'
alias ccat='pygmentize -g'
alias grep='grep --color=auto'
alias ns='sudo lsof -i -n -P | grep TCP'
alias dev-server='browser-sync --port 8080 --no-open --no-ui -f'

# Curl and WGET utils
alias curl='curl -s'

# lr:  Full Recursive Directory Listing
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

# mans:   Search manpage given in agument '1' for term given in argument '2' (case insensitive)
#         displays paginated result with colored search terms and two lines surrounding each hit.
mans () {
  man $1 | grep -iC2 --color=always $2 | less
}

# showa: to remind yourself of an alias (given some part of it)
showa () { /usr/bin/grep --color=always -i -a1 $@ ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc ; }

zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder

alias qfind="find . -name "                 # qfind:    Quickly search for file
ff () { /usr/bin/find . -name "$@" ; }      # ff:       Find file under the current directory
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string

# spotlight: Search for a file using MacOS Spotlight's metadata
spotlight () { mdfind "kMDItemDisplayName == '$@'wc"; }


# findPid: find out the pid of a specified process
findPid () { lsof -t -c "$@" ; }

# my_ps: List processes owned by my user:
my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command ; }

alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs
alias netstat='netstat -lunt'
alias m='multipass'

ii() {
  echo -e "\nYou are logged on ${RED}$HOST"
  echo -e "\nAdditionnal information:$NC " ; uname -a
  echo -e "\n${RED}Users logged on:$NC " ; w -h
  echo -e "\n${RED}Current date :$NC " ; date
  echo -e "\n${RED}Machine stats :$NC " ; uptime
  echo -e "\n${RED}Current network location :$NC " ; scselect
  echo
}

alias cleanDS="find . -type f -name '*.DS_Store' -ls -delete"
alias cleanIDEA="find . -name '.idea' -type d -exec rm -vrf {} +"
alias cleanNPM="find . -name 'node_modules' -type d -exec rm -vrf {} +"
alias cleanGIT="find . -name '.git' -type d -exec rm -vrf {} +"

gif() {
  git fetch --all --prune
}

tig() {
  git add -A && git commit -m "$1" && git push
}

export PATH="/usr/local/opt/ruby/bin:$PATH"

export BASH_SILENCE_DEPRECATION_WARNING=1

# set the VirtualBox VMs folder to something else
#vboxmanage setproperty machinefolder $HOME/vms

export GOPATH="$HOME/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

export PATH="/usr/local/opt/openssl/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# . $(pack completion)

export PATH="/usr/local/opt/libpq/bin:$PATH"
PATH=$(pyenv root)/shims:$PATH

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export HOMEBREW_NO_ENV_HINTS=1
export HOMEBREW_NO_INSTALL_CLEANUP=1

eval "$(direnv hook bash)"
