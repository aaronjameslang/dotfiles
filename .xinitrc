#! /bin/sh -eu

. $HOME/.xprofile
xrdb ~/.Xresources
exec sh /etc/X11/xinit/xinitrc
