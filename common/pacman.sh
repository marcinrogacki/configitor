#!/bin/sh

echo -e "\e[32mINSTALL STOW SOFTWARES FOR: COMMON\e[0m"
pacman -S synergy xscreensaver libnotify dunst the_silver_searcher ctags

if [ -f ./pacman-env.sh ]; then
    echo -e "\e[32mINSTALL STOW SOFTWARES FOR: ENV\e[0m"
    sh ./pacman-env.sh
fi
