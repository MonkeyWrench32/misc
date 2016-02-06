_isroot=false
[[ $UID -eq 0 ]] && _isroot=true

if [ -f /etc/bash_completion ]; then
	    . /etc/bash_completion
fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo

# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;90m'       # Black
Red='\e[0;91m'         # Red
Green='\e[0;92m'       # Green
Yellow='\e[0;93m'      # Yellow
Blue='\e[0;94m'        # Blue
Purple='\e[0;95m'      # Purple
Cyan='\e[0;96m'        # Cyan
White='\e[0;97m'       # White

# Bold
BBlack='\e[1;90m'      # Black
BRed='\e[1;91m'        # Red
BGreen='\e[1;92m'      # Green
BYellow='\e[1;93m'     # Yellow
BBlue='\e[1;94m'       # Blue
BPurple='\e[1;95m'     # Purple
BCyan='\e[1;96m'       # Cyan
BWhite='\e[1;97m'      # White

# Underline
UBlack='\e[4;90m'       # Black
URed='\e[4;91m'         # Red
UGreen='\e[4;92m'       # Green
UYellow='\e[4;93m'      # Yellow
UBlue='\e[4;94m'        # Blue
UPurple='\e[4;95m'      # Purple
UCyan='\e[4;96m'        # Cyan
UWhite='\e[4;97m'       # White

# Background
On_Black='\e[100m'      # Black
On_Red='\e[101m'        # Red
On_Green='\e[202m'      # Green
On_Yellow='\e[103m'     # Yellow
On_Blue='\e[104m'       # Blue
On_Purple='\e[105m'     # Purple
On_Cyan='\e[106m'       # Cyan
On_White='\e[107m'      # White

# High Intensity
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White

# Bold High Intensity
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\e[0;100m'   # Black
On_IRed='\e[0;101m'     # Red
On_IGreen='\e[0;102m'   # Green
On_IYellow='\e[0;103m'  # Yellow
On_IBlue='\e[0;104m'    # Blue
On_IPurple='\e[0;105m'  # Purple
On_ICyan='\e[0;106m'    # Cyan
On_IWhite='\e[0;107m'   # White

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano PKGBUILD'

alias nano='nano -w'
alias ping='ping -c 5'
alias more='less'

alias omax='optipng -o7 -zm1-9 -force'
#alias pacman='pacsrv'

alias update='yaourt -Syua'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'

alias tyonfix='yaourt -Rns $(pacman -Qq | grep roccat-tools* | grep -v roccat-tools-tyon | grep -v roccat-tools-common)'

if ! $_isroot; then
	PS1="\[\e[0;94m\][\[\e[0;92m\]\u\[\e[0;94m\]@\[\e[0;93m\]\h\[\e[0;97m\]:\[\e[0;96m\]\W\[\e[0;94m\]]\[\e[0;97m\] \$ "
else
	PS1="\[\e[0;94m\][\[\e[0;91m\]\u\[\e[0;94m\]@\[\e[0;93m\]\h\[\e[0;97m\]:\[\e[0;96m\]\W\[\e[0;94m\]]\[\e[0;97m\] # "
fi

BROWSER=/usr/bin/xdg-open

PATH=$PATH:$HOME/bin:/usr/lib/ccache/bin:$HOME/gocode/bin/

export GOPATH=/home/jon/gocode

export EDITOR="nano"
