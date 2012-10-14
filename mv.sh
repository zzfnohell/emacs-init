#!/bin/bash
for i in *.econf;
do
    mv $i ${i%.econf}.el
done;
