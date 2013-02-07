alias be='bundle exec'
alias gst='git status -s'
alias ga='git add'
alias gc='git commit -m'
alias gca='git commit -a -m'
alias gull='git pull'
alias gush='git push'
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PS1='\[\e[0:37m⌘\e[m \w/ `git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\/`: '
