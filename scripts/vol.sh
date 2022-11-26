#!/bin/sh

vol=$(pamixer --get-volume-human)

if [ "$vol" = "muted" ] ; then vol="off" ; fi

echo "v:$vol"
