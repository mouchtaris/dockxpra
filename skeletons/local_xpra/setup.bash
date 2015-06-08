#!/bin/bash

mydir="$( cd "$(dirname "$0")" && /usr/bin/env pwd )"

true \
&& mkdir -pv ~/.ssh \
&& ln -sv "$mydir"/startup.bash ~ \
&& true
