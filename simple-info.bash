# exit code, time, directory, git branch, $/#

# set the prompt command
PROMPT_COMMAND=__prompt_command

# yes
export PATH=$PATH:./

# set colors
CBlack="\[\e[30m\]"
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
CBCyan="\e[1;36m\]"
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
__test_color_prompt ()
{
    PS1=""
    PS1+="${CRed}red${CReset} "
    PS1+="${CGreen}green${CReset} "
    PS1+="${CYellow}yellow${CReset} "
    PS1+="${CBlue}blue${CReset} "
    PS1+="${CPurple}purple${CReset} "
    PS1+="${CCyan}cyan${CReset} "
}

# prompt command (sets up PS1)
__prompt_command ()
{
    local EXIT_STATUS=$?
    PS1=""

    if [ ${EXIT_STATUS} = 0 ]; then
        PS1+="${CGreen}"
    else
        PS1+="${CRed}"
    fi

    PS1+="${EXIT_STATUS}${CReset} "
    PS1+="${CBCyan}\t${CReset} "
    PS1+="${CBBlue}\W${CReset} "

    if [ "\$" == "$" ]; then
        PS1+="${CYellow}\$${CReset} "
    else
        PS1+="${CRed}\$${CReset} "
    fi
}

# \a bell
# \d date
# \e escape
# \h hostname
# \H hostname
# \j unknown
# \l console
# \n newline
# \r carriage return
# \s shell name
# \t time (24h)
# \t time (12h)
# \u user
# \v shell version
# \V full shell version
# \w full working directory
# \W current directory name
# \! command number
# \@ pretty time
# \$ $ or #
