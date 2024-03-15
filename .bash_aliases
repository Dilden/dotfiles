# shortcuts
alias lh='ls -lha'
alias plz='sudo $(history -p \!\!)'
alias codecept="php vendor/bin/codecept"

# Change directories aliases
alias cdot='cd ~/.dotfiles';
alias cdtox='cd ~/Dev/projects/toxichatbot';
alias cdhack='cd ~/Dev/vvv/www/hack/public_html/wp-content'
alias cdintra='cd ~/Dev/projects/kalix';
alias cdvvv='cd ~/Dev/vvv';
alias cdans='cd ~/Dev/ans';

# Apps
alias postman='/usr/bin/PostmanCanary'

# Compress JPGs into directory
alias compress='mkdir compressed;for photos in *.jpg;do convert -verbose "$photos" -quality 85% -resize 1920x1080 ./compressed/"$photos"; done'

# connect to a8c
alias connecta8c='ssh -N -D 8080 dylanhildenbrand@proxy.automattic.com'

# YouTube Download
alias ytdownload='youtube-dl --ignore-errors --format bestaudio --extract-audio --audio-format mp3 --audio-quality 160K --output "%(title)s.%(ext)s" --yes-playlist https://www.youtube.com/playlist?list='
