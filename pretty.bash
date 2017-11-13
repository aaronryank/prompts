# set the prompt command
PROMPT_COMMAND=__prompt_command

# yes
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
BGBCyan="\e[1;46m\]"

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

__prompt_command ()
{
    local EXIT_CODE="$?"
    PS1=""

    if [ $EXIT_CODE = 0 ]; then
        PS1+="${CBGreen}:)${CReset} "
    else
        PS1+="${CRed}:(${CReset} "
    fi

    local TIME=$(date +%T | tr -d ':')

    if [ $TIME -gt 000000 ] && [ $TIME -lt 060000 ]; then
        PS1+="${BGBlue}${CBBlack}"
    elif [ $TIME -gt 060000 ] && [ $TIME -lt 120000 ]; then
        PS1+="${BGRed}${CBYellow}"
    elif [ $TIME -gt 120000 ] && [ $TIME -lt 170000 ]; then
        PS1+="${BGBlue}${CBGreen}"
    elif [ $TIME -gt 170000 ] && [ $TIME -lt 200000 ]; then
        PS1+="${CBPurple}"
    elif [ $TIME -gt 200000 ] && [ $TIME -lt 235959 ]; then
        PS1+="${CBlue}"
    fi

    PS1+="\@${CReset} "

    PS1+="${CBCyan}\w${CReset} "

    if [ $UID = 0 ]; then
        PS1+="${BGRed}${CBBlack}"
    else
        PS1+="${CYellow}"
    fi

    PS1+="\$${CReset} "
}
