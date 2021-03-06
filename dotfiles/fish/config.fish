# Disable greeting
set fish_greeting

# Git
alias g='git'
alias gadd='git add'
alias branch='git branch'
alias checkout='git checkout'
alias check='git checkout'
alias clone='git clone'
alias commit='git commit'
alias gdiff='git diff'
alias fetch='git fetch'
alias ginit='git init'
alias glog='git log'
alias merge='git merge'
alias pull='git pull'
alias push='git push'
alias gstatus='git status'

alias master='git checkout master'
alias tcommit-pacific='TZ=":America/Los_Angeles" tcommit'
alias tcommit-mountain='TZ=":America/Denver" tcommit'
alias tcommit-berlin='TZ=":Europe/Berlin" tcommit'

# Directory listings
if uname | grep -q Darwin
  # Enable ls color output
  # https://apple.stackexchange.com/questions/33677/how-can-i-configure-mac-terminal-to-have-color-ls-output
  set -x CLICOLOR 1
  # set -x LSCOLORS ExGxBxDxCxEgEdxbxgxcxd
  alias ls='ls -hF'
else
  alias ls='ls -hF --color=tty'
end
alias l='ls -CF'
alias la='ls -A'  # all but . and ..
alias ll='ls -lA'
alias l1='command ls -1'

# Misc
alias grep='grep --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias df='df -h'
alias du='du -h'
alias whence='type -a'

# Directory shortcuts
# ~ and .. are supported by default
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias dev='cd ~/dev'
alias godev='cd ~/go/src'

# Update credentials on every sudo
alias sudo='command sudo -v; command sudo'

# Code Search, show line numbers
command -q csearch && alias csearch='csearch -n'
command -q cgrep   && alias cgrep='cgrep -n'

command -q lynx && alias ddg='lynx https://duckduckgo.com/lite'
command -q curl && alias weather='curl wttr.in'

function rsyncclean
  set rsync_exclude Thumbs.db '$RECYCLE.BIN' 'System Volume Information' \
    .DS_Store .Spotlight-V100 .TemporaryItems .Trashes .fseventsd __MACOSX
  rsync -vzh {--exclude,$rsync_exclude} $argv
end

# rsync command for copying from an NTFS or exFAT drive.
#
# Preserves times and symlinks; strips permissions, owner, and group
# (same as --archive without -pogD).
function rsyncwin
  rsyncclean -rlt --chmod='Du=rwx,Dgo=rx,Fu=rw,Fgo=r' $argv
end

# protonchk checks availability of a ProtonMail address.
function protonchk -a username
  curl 'https://mail.protonmail.com/api/users/available?Name='$username -H 'x-pm-appversion: Web_3.16.33'
  echo
end

# getcrx fetches a Chrome extension crx from the Chrome Web Store.
function getcrx -a id
  set CHROME_VERSION '86.0.4240.183'
  wget --content-disposition --no-clobber "https://clients2.google.com/service/update2/crx?response=redirect&prodversion=$CHROME_VERSION&acceptformat=crx2,crx3&x=id%3D$id%26uc"
end

# 4-column ASCII table
command -q wspace && alias ascii4='wspace ~/go/src/github.com/andrewarchi/nebula/programs/ascii4.out.ws'

# Format history time as "2006-01-02 15:04:05  "
alias history='history --show-time="%Y-%m-%d %H:%M:%S  "'

# https://github.com/ungoogled-software/ungoogled-chromium-macos#setting-up-the-build-environment
# https://github.com/pyenv/pyenv#basic-github-checkout
command -q pyenv && pyenv init - | source

# opam configuration
if test -e ~/.opam/opam-init/init.fish
  source ~/.opam/opam-init/init.fish > /dev/null 2>&1
end

# Homebrew Command Not Found
# https://github.com/Homebrew/homebrew-command-not-found
if status is-interactive && command -q brew
  set handler (brew --prefix)'/Homebrew/Library/Taps/homebrew/homebrew-command-not-found/handler.fish'
  if test -f $handler
    source $handler
  end
end

# /etc/profile sets 022, removing write perms to group and others.
# Neither group nor others have any perms:
umask 077

# set -a CDPATH . ~/dev/github.com/andrewarchi ~/go/src/github.com/andrewarchi

if test -d ~/man
  set MANPATH ~/man $MANPATH
end
if test -d ~/info
  set INFOPATH ~/info $INFOPATH
end

# Load local configuration
if test -e ~/.config/fish/config_local.fish
  source ~/.config/fish/config_local.fish
end

# if status is-login && status is-interactive
#   command -q neofetch && neofetch
# end
