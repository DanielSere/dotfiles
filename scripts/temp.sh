#!/bin/bash

temp=$(sensors|grep id|awk '{print $4}')

echo t: $temp
