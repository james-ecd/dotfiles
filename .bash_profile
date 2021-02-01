
# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

export PATH=$PATH:.
# export PATH=$PATH:/usr/bin

# Bash
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx # dark background
alias ls='ls -laghFG'
alias ll='ls -laghFG'
alias l='ls -laghFG'
alias xcode='open -a xcode'
alias text='open -a TextEdit'
alias pre='open -a Preview'
alias cd..='cd ..'

# Commom Mac programs
alias reload='source ~/.bash_profile'
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias text='open -a TextEdit'
alias pre='open -a Preview'
alias pwdfailed='syslog -k Time ge -24h | egrep -e "sshd|ftpd|afp|vnc"'

# Grep
alias grep='grep -n'
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;35;40'

# Git
export PS1="\[\033[38m\]\u\[\033[32m\] \w \[\033[31m\]\`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\033[37m\]$\[\033[00m\] "
# export PS1="\[\033[38m\]\u\[\033[32m\] \w \[\033[31m\]\`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first $"
git config --global color.ui true
git config --global format.pretty oneline
git config --global core.autocrl input
git config --global core.fileMode true
git config --global alias.log "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias push='git pull origin master && git push origin master'
alias pull='git pull origin master'
alias clone='git clone $1'

# git tab completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# git alias
alias git-delete-all-branches="git branch | grep -v "master" | xargs git branch -D"
alias gc="git commit -asv"

function gcb() {
    git checkout -b $@ 
    git push -u origin $@
}

# github create dev-new pr alias
alias ghpr="gh pr create -B dev -w"

# Finder: show hiddeh files
defaults write com.apple.finder AppleShowAllFiles TRUE

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH
export PATH=$PATH:$HOME/bin

# Setting PATH for Python 3.8
export PATH="/usr/local/opt/python@3.8/bin:$PATH"

# kube
alias token-dev="aws eks get-token --cluster-name eks-vsuite-dev | jq -r '.status.token'"
alias token-prod="aws eks get-token --cluster-name eks-vsuite-prod | jq -r '.status.token'"
alias kube-dev="kubectl proxy"
alias kube-prod="kubectl --kubeconfig=/Users/james.davis/.kube/eksctl/clusters/eks-vsuite-prod proxy --port 8001"
alias script-container="kubectl exec --stdin --tty -n scripts $(kubectl get pod -n scripts -l app=vsuite-script -o jsonpath="{.items[0].metadata.name}") -- /bin/bash"
alias script-output="kubectl cp -n scripts $(kubectl get pod -n scripts -l app=vsuite-script -o jsonpath="{.items[0].metadata.name}"):/app/vsuite-backend/scripts/output/"

# poetry
export PATH="$HOME/.poetry/bin:$PATH"
alias pr="poetry run"
alias prs="poetry run python manage.py runserver"
alias prt="poetry run pytest -n auto"

# hack for psycopg2 pip install - links to brews openssl install
export PATH="/usr/local/opt/openssl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/curl/lib -L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/curl/include -I/user/local/opt/openssl/include"

# flake8 alias ignoring debug.py files
alias f8="pr flake8 --exclude debug.py"
