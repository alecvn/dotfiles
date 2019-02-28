# desktop-environment
Latest desktop environment configuration

## 1. Install Kubuntu 18.04

## 2. Install i3-gaps
 https://github.com/Airblader/i3

## 3. Follow guide to configure i3-gaps sitting on top of Plasma
   https://github.com/avivace/dotfiles
 - Copy i3 config
 - Copy plasma-workspace bash file
 - install compton
 - install wmctrl
 - sudo mv /usr/bin/ksplashqml /usr/bin/ksplashqml.old
 - double check plasma-workspace wm.sh file to see that it's invoking i3 from the correct path:  /usr/bin/i3 not /usr/local/bin/i3
 - install feh and put a background image at ~/Pictures/wallpaper.jpg (or change this in the i3 config)

## 3. Install emacs

## 4. Clone dotfiles repo and symlink
    ln -s ~/dotfiles/bash_aliases ~/.bash_aliases
    ln -s ~/dotfiles/emacs ~/.emacs.d/init.el
    ln -s ~/dotfiles/i3_config ~/.config/i3/config

## 5. Install lastfm scrobbler
   https://github.com/lastfm/lastfm-desktop

## 6. Install Mellow Player
   https://colinduquesnoy.gitlab.io/MellowPlayer/
