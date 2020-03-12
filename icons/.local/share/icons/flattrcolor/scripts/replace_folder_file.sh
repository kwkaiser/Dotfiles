#!/usr/bin/env bash
#	default color: 178984
oldglyph=#774d3b
newglyph=#774d3b

#	Front
#	default color: 36d7b7
oldfront=#cb8564
newfront=#cb8564

#	Back
#	default color: 1ba39c
oldback=#8c5b45
newback=#8c5b45

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
