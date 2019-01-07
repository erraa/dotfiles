if [ "$color_prompt" = yes ]; then
    PS1="\\[\e[0;31m\\]\A \${PWD##*/}\\[\e[0;32m\\]\$(parse_git_branch)\\[\e[0;31m\\]$‌​\\[\e[m\\] "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
export LC_ALL=en_US.UTF-8
export LANG=en_us.UTF-8
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
export VISUAL=vim
export EDITOR="$VISUAL"
