#!/usr/bin/env bash
#	default color: 178984
oldglyph=#95702b
newglyph=#95702b

#	Front
#	default color: 36d7b7
oldfront=#e1a940
newfront=#e1a940

#	Back
#	default color: 1ba39c
oldback=#ad8232
newback=#ad8232

sed -i "s/#524954/$oldglyph/g" $1
sed -i "s/#9b8aa0/$oldfront/g" $1
sed -i "s/#716475/$oldback/g" $1
sed -i "s/$oldglyph;/$newglyph;/g" $1
sed -i "s/$oldfront;/$newfront;/g" $1
sed -i "s/$oldback;/$newback;/g" $1
