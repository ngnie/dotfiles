# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"
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
plugins=(git z fzf)

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

source $ZSH/oh-my-zsh.sh


HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
setopt autocd
bindkey -v
zstyle :compinstall filename '/home/nikolaj/.zshrc'
autoload -Uz compinit
compinit

bindkey Esc vi-cmd-mode
set -o vi        

yanktoclipboard(){
  echo $BUFFER | tr -d '\n' | xsel -i -b
}

pastefromclipboard(){
  RBUFFER=$(xsel -o -b </dev/null)$RBUFFER
}

zle -N yanktoclipboard
zle -N pastefromclipboard
bindkey -a 'yy' yanktoclipboard
bindkey -a 'p' pastefromclipboard

# below used by tmux
alias pbcopy='xclip -selection clipboard'       # copy to clipboard: ctrl+c, ctrl+shift+c
alias pbpaste='xclip -selection clipboard -o'   # paste from clipboard: ctrl+v, ctrl+shift+v
alias pbselect='xclip -selection primary -o'   # paste from highlight: middle click, shift+insert

export DISABLE_FZF_AUTO_COMPLETION="false"
export DISABLE_FZF_KEY_BINDINGS="false"
#export FZF_DEFAULT_COMMAND='find . -type f ! -path "*git*" ! -path "*cache*"'
#export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
#
# Trying out fd with fzf: https://github.com/junegunn/fzf/issues/1398
#
export FD_OPTIONS="--follow --exclude .git --exclude target --exclude node_modules --exclude .settings --exclude .classpath --exclude .project --exclude cache "
export FZF_DEFAULT_COMMAND="fd --type f --type l --strip-cwd-prefix --hidden $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
#
#export FZF_DEFAULT_OPTS="--height=80% --layout=reverse --info=inline --preview 'bat -n --color=always {}'"
export FZF_DEFAULT_OPTS="
  --layout=reverse
  --height=90%
  --info=inline
  --multi
  --preview 'bat -n --color=always {}'
  --prompt='∼ ' --pointer='▶' --marker='✓'
  --bind 'ctrl-a:select-all'
  --bind 'ctrl-y:execute-silent(cat {+f} | xclip -selection clipboard)'
  --bind 'ctrl-e:execute(echo {+} | xargs -o $EDITOR)'
"

export REPOS_HOME=/home/nikolaj/ngr/engineer/repos
export DOTFILES_HOME=$REPOS_HOME/dotfiles
export NOTES_HOME=$REPOS_HOME/notes
export TODO_HOME=/home/nikolaj/ngr/todo
export EDITOR=/usr/bin/nvim
export WAVELY_HOME=/home/nikolaj/ngr/work/customer/greenwave
export WAVELY_REPOS=$WAVELY_HOME/repos/wavely
export WAVELY_REACT_REPOS=$WAVELY_HOME/repos/wavely-web-react
export POSTMAN_HOME=/opt/postman 
export PATH=$PATH:$POSTMAN_HOME

source $DOTFILES_HOME/bin/lfcd.sh

alias cmd='print -z $(cat $DOTFILES_HOME/commands.txt | fzf)'
alias lf='lfcd'
alias pdf='zathura'
alias lg='lazygit'

alias make_package='mvn package -DskipTests'
alias make_test='mvn test'
alias make_install='mvn install -DskipTests'
alias make_dependency_tree='mvn dependency:tree'
alias make_effective_pom='mvn help:effective-pom -Dverbose=true'
alias make_dependency_tree_includes='mvn dependency:tree -Dincludes=org.postgresql:postgresql'
alias lfsplit='tmux split -h lf; lf'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# [[ ! -f ~/.sdkmanrc ]] || source ~/.sdkmanrc

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
