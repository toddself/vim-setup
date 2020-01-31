PATH=~/bin:/usr/local/bin:$PATH
BLUE="\[\033[34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[0;32m\]"
MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[0;33m\]"
CYAN="\[\033[0;36m\]"
RED="\[\033[0;31m\]"
OFF="\[\033[0m\]"
VIRTUAL_ENV_DISABLE_PROMPT=true
EDITOR=vim
PS1="$YELLOW\w$OFF\$(git_prompt)\$(server_info)\n[$CYAN\D{%H:%M:%S}$OFF] \$ "
umask 002

#aliases
alias gs="git status"
alias gd="git diff"
alias gl="git lg"

function gp () {
    git push -u origin $(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p') $@
}

OSNAME=$(uname)
if [ "$OSNAME" = "Darwin" ]; then
  alias dir="ls -lGFht"
else 
  alias dir="ls -ltF --color=auto"
fi

function server_info {
  SERV_INFO=""
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]
  then SERV_INFO="$(hostname)@$(whoami)"
  else SERV_INFO="$(hostname)"
  fi
  echo -ne " on $SERV_INFO"
}

GIT=$(which git)

function git_prompt (){
    if ! $GIT rev-parse --git-dir > /dev/null 2>&1; then
        return 0
    fi

    #UNCOMMITTED=$($GIT status --porcelain --untracked-files=no)
    UNCOMMITED=$($GIT diff-index --quiet HEAD --)
    UNADDED=$($GIT ls-files --other --exclude-standard --directory --no-empty-directory)
    BRANCH=$($GIT branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
    GIT_PROMPT=$BRANCH
    PROMPT_COLOR="\033[0;32m"

    if [ -n "$UNCOMMITTED" ]
    then
        PROMPT_COLOR="\033[0;36m"
    fi

    if [ -n "$UNADDED" ]
    then
        PROMPT_COLOR="\033[0;31m"
    fi

    echo -e ":$PROMPT_COLOR$GIT_PROMPT\033[0m"
}

export PATH PS1 EDITOR TERMINAL

export GPG_TTY=$(tty)
eval `keychain --agents ssh,gpg --eval ~/.ssh/i*_ed25519'
