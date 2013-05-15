#!/bin/sh
#
# replace code meta-data fields in EOMF library
#

find . -path */EIFGENs/* -prune  -o -name *.e  -print | while read fn
do
	if [ ! -f $fn.bak ]; then
		cp $fn $fn.bak
	fi
	echo "....DOING sed $fn.bak > $fn"
	sed -e 's/\(component:[ 	]*\)"[^"]*"/\1"Eiffel Object Modelling Framework Project"/' \
	    -e 's/get_msg \?("\([^"]\+\)"/get_msg (ec_\1/' $fn.bak > $fn
done
