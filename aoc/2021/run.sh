#!/bin/bash

# set -x

DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
TEMPLATE_DEPTH=8192

if ! [[ $1 =~ [0-9][0-9] ]]; then
    echo "Invalid argument [$1]"
    exit -1
fi

if [[ $2 =~ d|debug ]]; then
    g++ -c -I $DIR -I $DIR/$1 -ftemplate-depth=$TEMPLATE_DEPTH $DIR/$1/main.cc
    exit $?
fi

g++ -c -I $DIR -I $DIR/$1 -ftemplate-depth=$TEMPLATE_DEPTH $DIR/$1/main.cc 2>&1 \
    | grep "invalid conversion" \
    | sed -E 's/^.*?\)\[([0-9]*)\].*$/\1/'
