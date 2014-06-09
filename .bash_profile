alias be='bundle exec'
alias brails='bundle exec rails'
alias brake='bundle exec rake'
alias gst='git status -s'
alias ga='git add'
alias gc='git commit -m'
alias gca='git commit -a -m'
alias gull='git pull'
alias gush='git push'
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'
alias pr='fs gh p'
alias gh='fs gh'

if [ -f $(brew --prefix)/etc/bash_completion.d/git-completion.bash ]; then
  source $(brew --prefix)/etc/bash_completion.d/git-completion.bash
  __git_complete gco _git_checkout
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PATH="/usr/local/heroku/bin:$PATH"
export PS1='\[\e[0:37m⌘\e[m \w/ `git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\/`: \]'
