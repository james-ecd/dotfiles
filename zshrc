 # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/james.davis/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
plugins=(django)

source $ZSH/oh-my-zsh.sh

# Commands
defaults write com.apple.finder AppleShowAllFiles TRUE

# pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi


# hack for psycopg2 pip install - links to brews openssl install
export PATH="/usr/local/opt/openssl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/curl/lib -L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/curl/include -I/user/local/opt/openssl/include"


########
# Alias
########

# Bash
alias ls='ls -laghFG'
alias ll='ls -laghFG'
alias l='ls -laghFG'
alias text='open -a TextEdit'
alias cd..='cd ..'
alias reload='source ~/.zshrc'

# Grep
alias grep='grep -n'
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;35;40'

# Gitub
alias ghpr="gh pr create -B dev -w"
alias git-delete-all-branches="git branch | grep -v "master" | xargs git branch -D"
alias gc="git commit -asv"
alias gitnuke="!sh -c 'git branch -D $1 && git push origin :$1' -"
function gcb() {
    git checkout -b $@ 
    git push -u origin $@
}

# kube
alias token-dev="aws eks get-token --cluster-name eks-vsuite-dev | jq -r '.status.token'"
alias token-prod="aws eks get-token --cluster-name eks-vsuite-prod | jq -r '.status.token'"
alias kube-dev="kubectl proxy"
alias kube-prod="kubectl --kubeconfig=/Users/james.davis/.kube/eksctl/clusters/eks-vsuite-prod proxy --port 8001"
alias script-container="kubectl exec --stdin --tty -n scripts $(kubectl get pod -n scripts -l app=vsuite-script -o jsonpath="{.items[0].metadata.name}") -- /bin/bash"
alias script-output="kubectl cp -n scripts $(kubectl get pod -n scripts -l app=vsuite-script -o jsonpath="{.items[0].metadata.name}"):/app/vsuite-backend/scripts/output/"

# poetry / django
export PATH="$HOME/.poetry/bin:$PATH"
alias pr="poetry run"
alias prs="poetry run python manage.py runserver"
alias prt="poetry run pytest -n auto"
alias prdq="poetry run python manage.py qcluster"

# flake8 alias ignoring debug.py files
alias f8="pr flake8 --exclude debug.py"

# vsuite
alias cdvs="cd ~/Documents/python/repos/vsuite-backend" 

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
