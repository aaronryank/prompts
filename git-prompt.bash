# set the prompt command
PROMPT_COMMAND=__prompt_command

# yes
export PATH=$PATH:./
alias ..='cd ..'

# set colors
CBlack="\[\e[30m\]"
CBBlack="\[\e[1;30m\]"
CRed="\[\e[31m\]"
CBRed="\[\e[1;31m\]"
CGreen="\[\e[32m\]"
CBGreen="\[\e[1;32m\]"
CYellow="\[\e[33m\]"
CBYellow="\[\e[1;33m\]"
CBlue="\[\e[34m\]"
CBBlue="\[\e[1;34m\]"
CPurple="\[\e[35m\]"
CBPurple="\[\e[1;35m\]"
CCyan="\[\e[36m\]"
CBCyan="\e[\1;36m\]"
CReset="\[\e[0m\]"

BGRed="\[\e[41m\]"
BGBRed="\[\e[1;41m\]"
BGGreen="\[\e[42m\]"
BGBGreen="\[\e[1;42m\]"
BGYellow="\[\e[43m\]"
BGBYellow="\[\e[1;43m\]"
BGBlue="\[\e[44m\]"
BGBBlue="\[\e[1;44m\]"
BGPurple="\[\e[45m\]"
BGBPurple="\[\e[1;45m\]"
BGCyan="\[\e[46m\]"
BGBCyan="\e[\1;46m\]"

# test color setup (pretty)
__test_colors_prompt ()
{
    PS1=""
    PS1+="${CRed}red${CReset} "
    PS1+="${CGreen}green${CReset} "
    PS1+="${CYellow}yellow${CReset} "
    PS1+="${CBlue}blue${CReset} "
    PS1+="${CPurple}purple${CReset} "
    PS1+="${CCyan}cyan${CReset} "
}

# set up PS1
__prompt_command ()
{
    PS1="\n"

    local isgit=$(git rev-parse --git-dir --is-inside-git-dir --is-bare-repository --is-inside-work-tree --short HEAD 2>/dev/null)
    local gitdir=$(git rev-parse --git-dir 2>/dev/null)

    if [ -z "$isgit" ] 2>/dev/null; then
        PS1+="${CRed}nogit${CReset} ${CBBlue}\w${CReset}"
    else
        local fileschanged=$(git status -s | grep -c '')
        local reponame=$(basename $(git rev-parse --show-toplevel))      # get repository name

        PS1+="${CGreen}${reponame}${CReset}${CPurple}@${CReset}";        # repo@
        PS1+="${CBBlack}$(__git_ps1 '%s')${CReset} "                     # branch

        if [ -d .git ]; then                                             # if in base of repository
            false;
        else
            PS1+="${CBlue}\W${CReset} "                                  # @cwd if not in base
        fi
        PS1+="${CBYellow}($(git show-ref -s12 | tail -n1)${CReset} "     # (sha1)

        if [ "${fileschanged}" != 0 ]; then
            PS1+="${CBRed}${fileschanged}${CReset}"                      # files-changed
        else
            PS1+="${CBGreen}clean${CReset}"
        fi

        PS1+="${CBYellow})${CReset}"
    fi

    PS1+="\n$ "
}
