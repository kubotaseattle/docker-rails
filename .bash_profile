PS1_COLOR_BEGIN="\[\e[1;31m\]"
PS1_COLOR_END="\[\e[m\]"
PS1_HOST_NAME="MyUbuntu"
export PS1="${PS1_COLOR_BEGIN}[\u@\${PS1_HOST_NAME} \W]${PS1_COLOR_END}\\$ "
