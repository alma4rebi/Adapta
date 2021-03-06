#! /bin/bash
#
# This file is part of adapta-gtk-theme
#
# Copyright (C) 2016 Tista <tista.gma500@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#

INKSCAPE="`which inkscape`"

SRC_DIR="../assets-xfwm"
ASSETS_DIR="../../xfwm4"
INDEX="assets-xfwm-title.txt"
KEY_FILE="../../../sass/common/_key_colors.scss"

# Renderer
render-non-scale() {
    $INKSCAPE --export-png=$ASSETS_DIR/$i.png $SRC_DIR/$i.svg >/dev/null #\
}

# Generate PNG files
for i in $(<$INDEX)
do 
    if [ -f $ASSETS_DIR/$i.png ] && \
        [ $KEY_FILE -ot $ASSETS_DIR/$i.png ]; then
        echo $ASSETS_DIR/$i.png exists.
    elif [ -f $ASSETS_DIR/$i.png ] && \
        [ $KEY_FILE -nt $ASSETS_DIR/$i.png ]; then
        echo Re-rendering $ASSETS_DIR/$i.png
        rm -f $ASSETS_DIR/$i.png
        render-non-scale
    else
        echo Rendering $ASSETS_DIR/$i.png
        render-non-scale
    fi
done
