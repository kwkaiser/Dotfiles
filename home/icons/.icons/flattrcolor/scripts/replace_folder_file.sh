#!/usr/bin/env bash
#	default color: 178984
oldglyph=#484768
newglyph=#666870

#	Front
#	default color: 36d7b7
oldfront=#7c7bb2
newfront=#aaaeba

#	Back
#	default color: 1ba39c
oldback=#55547a
newback=#757780

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
