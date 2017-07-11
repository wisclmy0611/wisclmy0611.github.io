#!/bin/sh

cd ~/Documents/gitBlog
hexo generate
git add --all
git commit -m "`date +%F` `date +%T` updated"
git push origin source

cd public
git add --all
git commit -m "`date +%F` `date +%T` updated"
git push origin master

