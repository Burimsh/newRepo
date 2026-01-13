#!/bin/bash

echo "Top CPU-consuming processes:"
ps -eo pid,ppid,cmd,%cpu,%mem --sort=-%cpu | head -n 10

echo
echo "Memory usage:"
free -h

echo
echo "System uptime:"
uptime
