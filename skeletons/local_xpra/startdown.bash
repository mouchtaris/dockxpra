#!/bin/bash -x

mydir="$( cd "$(dirname "$0")" && /usr/bin/env pwd )"
export PATH="$mydir":"$PATH"

true \
&& export PATH="/home/nikos/dockintelli:$PATH" \
&& _ssh_enable ide_intelli \
&& xpra attach ssh/nikos@$(resolv:hagrid):$(resolv_port:ide)/$(ide:display) --ssh=_ssh_nocheck \
&& true
