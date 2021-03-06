#!/bin/bash -x

mydir="$( cd "$(dirname "$0")" && /usr/bin/env pwd )"
export PATH="$mydir":"$PATH"

true \
&& export PATH="/home/nikos/dockintelli:$PATH" \
&& _ssh_enable ide_intelli \
&& xpra start ssh/nikos@$(resolv:hagrid):$(resolv_port:ide)/$(ide:display) --no-mdns --no-pulseaudio --start-child /home/nikos/xterm --ssh=_ssh_nocheck \
&& true
