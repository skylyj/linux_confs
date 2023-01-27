# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
export PATH=$PATH:/Users/mobvista/opt/anaconda3/bin/:/Users/mobvista/.cargo/bin/

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/mobvista/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/mobvista/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/mobvista/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/mobvista/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
export SPARK_HOME="/opt/homebrew/Cellar/apache-spark/3.2.1/libexec/"
export PATH="$SPARK_HOME/bin/:$PATH"
# <<< conda initialize <<<

#alias ctags="`brew --prefix`/bin/ctags"
ip255="107.21.178.255"
ip81="39.105.24.81"
cndev="39.105.208.2"
#alias updatedb="/usr/libexec/locate.updatedb"
#
#alias updatedb="gupdatedb --localpaths='/Users/mobvista' --output='/Users/mobvista/tmp/locatedb'"
#alias locate="glocate"
#export LOCATE_PATH="~/tmp/locatedb"
#
#export GTAGSLABEL=pygments
#export GTAGSLABEL=ctags
#
#for ggtags
#export PATH=~/local/bin:$PATH
#export GTAGSCONF=~/local/share/gtags/gtags.conf
#alias ctags=~/local/bin/ctags
#export GTAGSLABEL=ctags
#export GTAGSLABEL=pygments

alias ctags=/opt/homebrew/opt/ctags/bin/ctags
#spark
export PATH=$SPARK_HOME/bin:$PATH
#/usr/libexec/java_home
#export JAVA_HOME=/Users/mobvista/Library/Java/JavaVirtualMachines/openjdk-18.0.2/Contents/Home
#export PYSPARK_PYTHON=python3
#export PATH=$JAVA_HOME/bin:$PATH
# new
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JRE_HOME=/Library/java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/jre/
export SPARK_HOME=/opt/homebrew/opt/apache-spark/libexec/
export PATH=/opt/homebrew/opt/apache-spark/libexec/bin/:$PATH
export PYSPARK_PYTHON=/Users/mobvista/miniforge3/envs/tf26/bin/
#export PYSPARK_PYTHON=/opt/homebrew/opt/apache-spark/libexec/bin/
export PATH=$PATH:~/bin
export PATH="$PATH:/Users/mobvista/Library/Application Support/Coursier/bin"
export PATH="/opt/homebrew/opt/scala@2.12/bin:$PATH"

alias proxy="export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890"
alias unproxy='unset all_proxy http_proxy https_proxy'
#function proxy() {
#    export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
#}
#function unproxy() {
#    unset https_proxy
#    unset http_proxy
#    unset all_proxy
#}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH=/Users/mobvista/.rbenv/shims:$PATH
#export PATH="$PATH:$HOME/.rvm/bin"
eval "$(rbenv init -)"
#rbenv shell 3.0.5
___MY_VMOPTIONS_SHELL_FILE="${HOME}/.jetbrains.vmoptions.sh"; if [ -f "${___MY_VMOPTIONS_SHELL_FILE}" ]; then . "${___MY_VMOPTIONS_SHELL_FILE}"; fi
alias emacs_debug="/Applications/Emacs\ 2.app/Contents/MacOS/Emacs --debug-init"
export PATH=/Users/mobvista/Library/Application\ Support/Coursier/bin/:$PATH
alias emacs_client="/Applications/Emacs\ 2.app/Contents/MacOS/bin/emacsclient"

# for vterm
vterm_printf() {
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ]); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

vterm_prompt_end() {
    vterm_printf "51;A$(whoami)@$(hostname):$(pwd)"
}
setopt PROMPT_SUBST
PROMPT=$PROMPT'%{$(vterm_prompt_end)%}'

vterm_cmd() {
    local vterm_elisp
    vterm_elisp=""
    while [ $# -gt 0 ]; do
        vterm_elisp="$vterm_elisp""$(printf '"%s" ' "$(printf "%s" "$1" | sed -e 's|\\|\\\\|g' -e 's|"|\\"|g')")"
        shift
    done
    vterm_printf "51;E$vterm_elisp"
}

find_file() {
    vterm_cmd find-file "$(realpath "${@:-.}")"
}

say() {
    vterm_cmd message "%s" "$*"
}
