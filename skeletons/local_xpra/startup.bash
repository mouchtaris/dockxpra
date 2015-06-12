#!/bin/bash -x

true \
&& export PATH="/home/nikos/dockintelli:$PATH" \
&& _ssh_enable ide_intelli \
&& xpra start ssh/nikos@$(_hagrid_address):$(ide:port)/$(ide:display) --no-pulseaudio --start-child /home/nikos/xterm \
&& true
