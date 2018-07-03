alias re='~/Repos'
alias si='~/Repos/sites'
alias pr='~/Repos/projects'
alias sp='~/Repos/sketchpad'
alias hhl='~/Repos/sites/hardwarehacklab.io'
alias aah='~/Repos/sites/artahack.io'
alias twa='~/Repos/sites/thoughtworksarts.io'
alias jah='~/Repos/sites/jahya.net'

alias z='~/.oh-my-zsh'
alias zc='~/.oh-my-zsh/custom'
alias zca='vi ~/.oh-my-zsh/custom/aliases.zsh'

alias bu="buw && bul && bum && bug"
alias buw="rsync -avzh /Volumes/Lizard\ Man/Working/* /Volumes/Meka\ Dragon/folder-backups/Working/"
alias bul="rsync -avzh /Volumes/Lizard\ Man/Libraries/* /Volumes/Meka\ Dragon/folder-backups/Libraries/"
alias bum="rsync -avzh /Volumes/Lizard\ Man/Media/* /Volumes/Meka\ Dragon/folder-backups/Media/"
alias bug="rsync -avzh /Volumes/Lizard\ Man/Games/* /Volumes/Meka\ Dragon/folder-backups/Games/"

alias grs='grunt serve'
alias grd='grunt deploy'
alias grb='grunt build:dist'
alias grdh='grunt build:dist && (cd ../webpreview_heroku/ && find . ! -path "./.git/*" ! -name .git ! -name config.ru ! -name Gemfile ! -name Gemfile.lock -delete) && cp -R dist/* ../webpreview_heroku && (cd ../webpreview_heroku/ && ls -la && git add --all && git commit -m "Deploying" && git push)'

alias p8='ping 8.8.8.8'
