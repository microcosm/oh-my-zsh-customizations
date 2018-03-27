alias wo='~/Working'
alias si='~/Working/sites'
alias pr='~/Working/projects'
alias sp='~/Working/sketchpad'
alias hhl='~/Working/sites/hardwarehacklab.io'
alias aah='~/Working/sites/artahack.io'
alias twa='~/Working/sites/thoughtworksarts.io'
alias jah='~/Working/sites/jahya.net'

alias z='~/.oh-my-zsh'
alias zc='~/.oh-my-zsh/custom'
alias zca='vi ~/.oh-my-zsh/custom/aliases.zsh'

alias bu="buw && bul && bum && bug"
alias buw="rsync -avzh /Volumes/Lizard\ Man/Working/* /Volumes/Meka\ Dragon/Working/"
alias bul="rsync -avzh /Volumes/Lizard\ Man/Libraries/* /Volumes/Meka\ Dragon/Libraries/"
alias bum="rsync -avzh /Volumes/Lizard\ Man/Media/* /Volumes/Meka\ Dragon/Media/"
alias bug="rsync -avzh /Volumes/Lizard\ Man/Games/* /Volumes/Meka\ Dragon/Games/"

alias grs='grunt serve'
alias grd='grunt deploy'
alias grb='grunt build:dist'
alias grdh='grunt build:dist && (cd ../webpreview_heroku/ && find . ! -path "./.git/*" ! -name .git ! -name config.ru ! -name Gemfile ! -name Gemfile.lock -delete) && cp -R dist/* ../webpreview_heroku && (cd ../webpreview_heroku/ && ls -la && git add --all && git commit -m "Deploying" && git push)'

alias p8='ping 8.8.8.8'
