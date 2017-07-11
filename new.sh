#!/bin/sh

echo Enter the Title
read TITLE
hexo new $TITLE    
open source/_posts?$TITLE.md
exit 0
