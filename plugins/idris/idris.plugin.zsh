# ------------------------------------------------------------------------------
#          FILE:  idris.plugin.zsh
#   DESCRIPTION:  oh-my-zsh plugin file.
#        AUTHOR:  doofin
#       VERSION:  0.1
# ------------------------------------------------------------------------------
autoload bashcompinit
bashcompinit

_idris()
{
    local CMDLINE
    local IFS=$'\n'
    CMDLINE=(--bash-completion-index $COMP_CWORD)

    for arg in ${COMP_WORDS[@]}; do
        CMDLINE=(${CMDLINE[@]} --bash-completion-word $arg)
    done

    COMPREPLY=( $(/usr/bin/idris "${CMDLINE[@]}") )
}

# complete -o filenames -F _idris idris

alias idr='idris'
alias idrb='idris --build'
alias idri='idris --install'
alias idrlspkg='idris --listlibs'
