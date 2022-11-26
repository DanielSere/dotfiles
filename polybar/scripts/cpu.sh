#!/bin/bash

cpu_usage=$(mpstat 1 1|grep Av|awk '{print 100-$12}')

echo " $cpu_usage%"

