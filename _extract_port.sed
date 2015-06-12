#!/bin/sed -rf

s/([[:digit:]]{1,3}\.){3}[[:digit:]]{1,3}:([[:digit:]]+).*/\2/
