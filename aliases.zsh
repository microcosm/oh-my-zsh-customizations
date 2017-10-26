alias wo='~/Working'
alias si='~/Working/sites'
alias pr='~/Working/projects'
alias sp='~/Working/sketchpad'
alias hhl='~/Working/sites/hardwarehacklab.io'
alias aah='~/Working/sites/artahack.io'
alias twa='~/Working/sites/thoughtworksarts.io'
alias jah='~/Working/sites/jahya.net'

alias grs='grunt serve'
alias grd='grunt deploy'
alias grb='grunt build:dist'
alias grdh='grunt build:dist && (cd ../webpreview_heroku/ && find . ! -path "./.git/*" ! -name .git ! -name config.ru ! -name Gemfile ! -name Gemfile.lock -delete) && cp -R dist/* ../webpreview_heroku && (cd ../webpreview_heroku/ && ls -la && git add --all && git commit -m "Deploying" && git push)'