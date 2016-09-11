# GCC Cross Compiler for OSDev
export PREFIX="$HOME/opt/cross"
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"

# Aliases
alias h="cd ~/"
alias ls="ls -lG"
alias sl="ls"
alias rm="rm -i"
alias brewupdate="brew update && brew upgrade"
alias bashrc="vim ~/.bashrc && source ~/.bashrc"
alias vimrc="vim ~/.vimrc"
alias getprivateip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2'
alias getpublicip="curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'"
alias copyip='getip | pbcopy'
alias train='sl'

# Set terminal promptname: hostname:directory$
# export PS1="\h:\w$ "

# Environment variable for cheat.
export EDITOR="vim"

complete -C aws_completer aws

# Go workspace
export GOPATH=$HOME/gocode

source ~/.profile
# Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# tmux fix
# export EVENT_NOKQUEUE=1

# Ruby Environment 
#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

. ~/.git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_DESCRIBE_STYLE='describe'
export PS1='[\u:\w$(__git_ps1 " (%s)")]\$ '
# Select git info displayed, see /usr/lib/git-core/git-sh-prompt for more
export GIT_PS1_SHOWDIRTYSTATE=1           # '*'=unstaged, '+'=staged
export GIT_PS1_SHOWSTASHSTATE=1           # '$'=stashed
export GIT_PS1_SHOWUNTRACKEDFILES=1       # '%'=untracked
export GIT_PS1_SHOWUPSTREAM="verbose"     # 'u='=no difference, 'u+1'=ahead by 1 commit
export GIT_PS1_STATESEPARATOR=''          # No space between branch and index status
export GIT_PS1_DESCRIBE_STYLE="describe"  # detached HEAD style:
#  contains      relative to newer annotated tag (v1.6.3.2~35)
#  branch        relative to newer tag or branch (master~4)
#  describe      relative to older annotated tag (v1.6.3.1-13-gdd42c2f)
#  default       exactly eatching tag

# Check if we support colours
__colour_enabled() {
    local -i colors=$(tput colors 2>/dev/null)
    [[ $? -eq 0 ]] && [[ $colors -gt 2 ]]
}
unset __colourise_prompt && __colour_enabled && __colourise_prompt=1

__set_bash_prompt()
{
    local exit="$?" # Save the exit status of the last command

    # PS1 is made from $PreGitPS1 + <git-status> + $PostGitPS1
    local PreGitPS1="${debian_chroot:+($debian_chroot)}"
    local PostGitPS1=""

    if [[ $__colourise_prompt ]]; then
        export GIT_PS1_SHOWCOLORHINTS=1

        # Wrap the colour codes between \[ and \], so that
        # bash counts the correct number of characters for line wrapping:
        local Red='\[\e[0;31m\]'; local BRed='\[\e[1;31m\]'
        local Gre='\[\e[0;32m\]'; local BGre='\[\e[1;32m\]'
        local Yel='\[\e[0;33m\]'; local BYel='\[\e[1;33m\]'
        local Blu='\[\e[0;34m\]'; local BBlu='\[\e[1;34m\]'
        local Mag='\[\e[0;35m\]'; local BMag='\[\e[1;35m\]'
        local Cya='\[\e[0;36m\]'; local BCya='\[\e[1;36m\]'
        local Whi='\[\e[0;37m\]'; local BWhi='\[\e[1;37m\]'
        local None='\[\e[0m\]' # Return to default colour

        # No username and bright colour if root
        if [[ ${EUID} == 0 ]]; then
            PreGitPS1+="\h "
        else
            PreGitPS1+="\u:"
        fi

        PreGitPS1+="\w"
    else # No colour
        # Sets prompt like: ravi@boxy:~/prj/sample_app
        unset GIT_PS1_SHOWCOLORHINTS
        PreGitPS1="${debian_chroot:+($debian_chroot)}\u@\h:\w"
    fi

    # Now build the part after git's status

    # Highlight non-standard exit codes
    if [[ $exit != 0 ]]; then
        PostGitPS1="$Red[$exit]"
    fi

    # Change colour of prompt if root
    if [[ ${EUID} == 0 ]]; then
        PostGitPS1+="$BRed"'\$ '"$None"
    else
        PostGitPS1+="$None"'\$ '"$None"
    fi

    # Set PS1 from $PreGitPS1 + <git-status> + $PostGitPS1
    __git_ps1 "$PreGitPS1" "$PostGitPS1" '(%s)'

    # echo '$PS1='"$PS1" # debug    
    # defaut Linux Mint 17.2 user prompt:
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[00m\] $(__git_ps1 "(%s)") \$ '
}

# This tells bash to reinterpret PS1 after every command, which we
# need because __git_ps1 will return different text and colors
PROMPT_COMMAND=__set_bash_prompt
