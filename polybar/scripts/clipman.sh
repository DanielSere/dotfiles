#!/bin/bash

if [ -z "$(pgrep xfce4-cl)" ]; then
	eval $(xfce4-clipman &)
fi
