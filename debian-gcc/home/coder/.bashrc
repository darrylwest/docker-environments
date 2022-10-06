#
# darryl.west 
# 2017-06-21 13:21:26
#

set -o vi
export EDITOR=vi

PS1='\033[01;34mmachine? \033[01;32mc++ coder:\033[00m🪲  '

alias hi='history'
alias rm='/bin/rm -i'
alias lc='/bin/ls -c'
alias l='/bin/ls -la'
alias lh='/bin/ls -lt | head -50'

alias ut='exit'

#################################################################################
# git aliases
alias gst='git status'
alias gbr='git branch -a'
alias gco='git checkout'
alias gcom='git commit'
alias gac='git add . ; git commit -v'
alias gpull='git pull'
alias gpush='git push'

fgrep password: ~/.config/code-server/config.yaml

cat ~/.motd
