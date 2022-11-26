#!/bin/bash

ram_usage=$(free -h --si|grep M|awk '{print $3}')

echo "r:$ram_usage"
