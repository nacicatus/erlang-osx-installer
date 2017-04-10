#!/bin/sh

#  EnsurePATH.sh
#  ErlangInstaller
#
#  Created by Sergio Abraham on 4/3/17.
#  Copyright © 2017 Erlang Solutions. All rights reserved.

if [ $# -lt 2 ]
then
echo "No arguments supplied."
echo "Usage:\n$0 originalPath newPath"
exit 1
fi

if [ -z "$1" ]
then
echo "First argument empty."
exit 2
fi

if [ -z "$1" ]
then
echo "First argument empty."
exit 4
fi


cd ~
ERLANG_OLD_PATH=$1
ERLANG_DEFAULT_PATH=$2 # "~/.erlangInstaller/default/bin"
if [ -f .bash_profile ]; then CONFIG_FILE=".bash_profile";
else
CONFIG_FILE=".profile";
fi
if ! grep -q $ERLANG_OLD_PATH $CONFIG_FILE; then
printf "\n#ErlangInstaller\nexport PATH=\"$ERLANG_DEFAULT_PATH:\$PATH\"" >> $CONFIG_FILE
echo "Done."
else
echo "Replacing old path $ERLANG_OLD_PATH with new path $ERLANG_DEFAULT_PATH."
sed -i -e "s/${ERLANG_OLD_PATH}/${ERLANG_DEFAULT_PATH}/g" $CONFIG_FILE
fi
