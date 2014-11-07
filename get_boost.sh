#!/bin/bash

my_loc="$(cd "$(dirname $0)" && pwd)"
source $my_loc/config.sh
source $my_loc/utils.sh

if [ $# != 1 ] || [ $1 == '-h' ] || [ $1 == '--help' ]; then
    echo "Usage: $0 prefix_path"
    echo "  example: $0 /home/user/my_workspace"
    exit 1
fi

cmd_exists git || die 'git was not found'

prefix=$(cd $1 && pwd)
URL=https://github.com/algron/Boost-for-Android.git

echo
echo -e '\e[34mGetting boost.\e[39m'
echo

git clone $URL $prefix/boost
cd $prefix/boost

./build-android.sh $ANDROID_NDK --boost=1.53.0
