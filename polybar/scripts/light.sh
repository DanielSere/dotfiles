#!/bin/bash

lightness=$(xbacklight -get|cut -d'.' -f1)

echo "l:$lightness%"
