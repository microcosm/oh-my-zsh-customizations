alias re='~/Repos'
alias en='~/Repos/envs'
alias si='~/Repos/sites'
alias pr='~/Repos/projects'
alias hhl='~/Repos/sites/hardwarehacklab.io'
alias aah='~/Repos/sites/artahack.io'
alias twa='~/Repos/sites/thoughtworksarts.io'
alias jah='~/Repos/sites/jahya.net'

alias z='~/.oh-my-zsh'
alias zc='~/.oh-my-zsh/custom'
alias zca='vi ~/.oh-my-zsh/custom/aliases.zsh'

alias grs='grunt serve'
alias grd='grunt deploy'
alias grb='grunt build:dist'
alias grdh='grunt build:dist && (cd ../webpreview_heroku/ && find . ! -path "./.git/*" ! -name .git ! -name config.ru ! -name Gemfile ! -name Gemfile.lock -delete) && cp -R dist/* ../webpreview_heroku && (cd ../webpreview_heroku/ && ls -la && git add --all && git commit -m "Deploying" && git push)'

alias p8='ping 8.8.8.8'
