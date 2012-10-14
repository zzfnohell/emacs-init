#!/bin/bash
for i in *.el;
do
    l=`grep -c \.econf $i`
    if [ $l -ge 1 ] ;
    then
        echo $i;
    fi
done;
