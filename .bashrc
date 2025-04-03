#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls -lash --color=auto'
alias grep='grep --color=always'
alias less='less -R'
alias R='R --quiet --silent --no-save'
alias yeet='git push'
alias yolo='git push -f'
alias yoink='git pull'

# Configure colorgcc to wrap ccache, which in turn wraps gcc.
export PATH="/usr/lib/colorgcc/bin:${PATH}:${HOME}/.bin"

# Add .NET Core SDK tools
export PATH="$PATH:${HOME}/.dotnet/tools"

export CCACHE_PATH="/usr/bin"
WSU="${HOME}/work/wsu"
wsu="${WSU}"
todo="${WSU}/todo"
bugs="${HOME}/bugs"

# The standard editor.
export EDITOR=vim

# Custom Prompt

# setaf codes/info found in terminfo man page
BLACK="\[$(tput setaf 0)\]"
RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
BLUE="\[$(tput setaf 4)\]"
MAGENTA="\[$(tput setaf 5)\]"
CYAN="\[$(tput setaf 6)\]"
WHITE="\[$(tput setaf 7)\]" # more of a grey than a white
RESET="\[$(tput sgr0)\]"

# Dump a variable in a netcdf file, printing only the last line of output
# This is mainly useful for dumping variables with a single value
dumpvar() { ncdump -v "${1}" "${2}" | grep ' = ' | tail -1; }

# \u is the username of the current user
# \w is the current working directory, with $HOME abbreviated to ~
# for more escape codes which may be used here, see the PROMPTING section of the
# bash manual page.
PS1="${GREEN}\u${RESET}:${RED}\w${RESET} $ "

# Detailed information on IP address or host name in bash via https://ipinfo.io
ipif() {
    if grep -P "(([1-9]\d{0,2})\.){3}(?2)" <<< "$1"; then
	 curl ipinfo.io/"$1"
    else
	ipawk=($(host "$1" | awk '/address/ { print $NF }'))
	curl ipinfo.io/${ipawk[1]}
    fi
    echo
}

# Java options
#export JDK_JAVA_OPTIONS="-D<option 1> -D<option 2>..."
export JDK_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Djdk.gtk.version=3'
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# Unlimited bash history
export HISTFILESIZE=
export HISTSIZE=

