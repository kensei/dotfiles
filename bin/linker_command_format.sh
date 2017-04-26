#!/bin/bash

function print_help() {
  echo "Usage $0 [ld command path]"
}

if [ $# -ne 1 ]; then
    print_help >&2
    exit 1
fi

LD_FILE_PATH=$1

if [ ! -e $LD_FILE_PATH ]; then
    echo "ld command file is nothing. $LD_FILE_PATH"
    print_help >&2
    exit 1
fi

LF=$(printf '\\\012_')
LF=${LF%_}

cat $LD_FILE_PATH | sed -e "s/ -L\//$LF -L\//g" | sed -e "s/ -F\//$LF -F\//g" | sed -e "s/ -filelist/$LF -filelist/g" | sed -e "s/ -Xlinker/$LF -Xlinker/g" | sed -e "s/ -weak_framework/$LF -weak_framework/g" | sed -e "s/ -framework/$LF -framework/g" | sed -e "s/ -o /$LF -o /g" | sed -e "s/ -weak-/$LF -weak-/g" | sed -e "s/ -miphoneos-version-min/$LF -miphoneos-version-min/g"
