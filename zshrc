# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.pyenv/bin:$HOME/.npm/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/home/kalak/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="pygmalion-virtualenv"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose fzf virtualenv virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

# User configuration
# Enable control-s and control-q
stty start undef
stty stop undef
setopt noflowcontrol

# External softwares
# ag
agvim () {
  CHOICE=$(ag --color $* | fzf -0 -1 --ansi)
  if [ ! -z "$CHOICE" ]
  then
    vim $( echo "$CHOICE" | awk 'BEGIN { FS=":" } { printf "+%d %s\n", $2, $1 } ')
  fi
}
# Virtualenvwrapper things
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Documents/projects/
source $HOME/.local/bin/virtualenvwrapper.sh
# fzf things
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP
stty -ixon

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

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
alias MAJ="pamac upgrade -a"
alias clear_apt="sudo apt autoclean && sudo apt clean && sudo apt autoremove -y"
alias empty_trash="rm -rf $HOME/.local/share/Trash/**/*"
alias clear_thumbnails="find $HOME/.cache/thumbnails -type f -atime +7 -delete"
alias clear_history="echo -n '' > $HOME/.*_history"
alias clear_vim="rm -rf $HOME/.vim/tmp_dirs/undodir/*"
alias extract="python $HOME/Documents/projects/personal/archives_extractor/archives_extractor.py -f"
alias reduce_pdf="python $HOME/Documents/projects/personal/reduce_pdf_size/reduce_pdf_size.py"
alias scale_spotify="bash $HOME/Documents/projects/personal/setup_fresh_installation_os/scripts/scale_spotify.sh"
alias replace='f() { ag -0 -l $1 | xargs -0 sed -i "s%$1%$2%g" };f'

alias personal="cd $HOME/Documents/projects/personal"
alias unifai="cd $HOME/Documents/projects/professional/unifai"
alias intersport="unifai && cd intersport && cd frontend"
alias click-and-care="unifai && cd click-and-care && cd frontend"
alias the-agent="unifai && cd the-agent && cd frontend"
alias self-service="unifai && cd self-service && cd frontend"

alias wikit="wikit -b --lang fr"

alias -s vue=vim
alias -s js=vim

# Common Mistakes
alias ct='cat'
alias im='vim'
alias s='ls'
alias gi='git'
alias pip='pip3'

# Fix scaling Spotify
alias spotify="spotify --force-device-scale-factor=1.5"
