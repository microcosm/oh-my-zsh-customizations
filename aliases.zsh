alias aah='~/Repos/artahack.io'
alias ja='~/Repos/jahya.net'
alias re='~/Repos/'

alias dp='git checkout source && git checkout -b deploy && git push -f --set-upstream origin deploy && git checkout source && git branch --delete deploy'

alias zc="~/.oh-my-zsh/custom"
alias sz=". ~/.zshrc"

alias p8='ping 8.8.8.8'

# https://github.com/BretFisher/jekyll-serve
alias dc='open -a Docker'
alias dck="pkill -SIGHUP -f /Applications/Docker.app 'docker serve'"
alias js='docker-compose up'
alias jcli='docker run -v $(pwd):/site -it --entrypoint bash bretfisher/jekyll'

alias cmd='cat ~/.oh-my-zsh/custom/aliases.zsh | grep -v "^$" | sed \$d'
