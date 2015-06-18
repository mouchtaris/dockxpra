#!/bin/bash -x

mydir="$( cd "$(dirname "$0")" && /usr/bin/env pwd )"

true \
&& export PATH="/home/nikos/dockintelli:$PATH" \
&& _ssh_enable ide_intelli \
&& xpra attach ssh/nikos@$(<"$mydir"/../../_hagrid_address):$(ide:port)/$(ide:display) \
&& true
