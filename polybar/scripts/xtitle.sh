#!/bin/bash

XTITLE=$(xtitle | sed 's/.* //')

if [ -z $XTITLE ]; then
	XTITLE="Desktop"
fi

echo $XTITLE
