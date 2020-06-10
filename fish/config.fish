set fish_greeting

# Git
alias g='git'
alias branch='git branch'
alias checkout='git checkout'
alias check='git checkout'
alias clone='git clone'
alias commit='git commit'
alias gdiff='git diff'
alias fetch='git fetch'
alias glog='git log'
alias pull='git pull'
alias push='git push'

alias master='git checkout master'

# Directory listings
alias ls='ls -hF --color=tty'  # classify files in color
alias ll='ls -l'               # long list
alias la='ls -A'               # all but . and ..
alias l='ls -CF'
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'

# Misc
alias grep='grep --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias df='df -h'        # human readable figures
alias du='du -h'        # human readable figures
alias whence='type -a'  # where, of a sort

# Code Search
alias csearch="csearch -n"  # show line numbers
alias cgrep="cgrep -n"      # show line numbers

alias ddg="lynx https://duckduckgo.com/lite"
alias weather="curl wttr.in"

set PATH $PATH /usr/local/go/bin
