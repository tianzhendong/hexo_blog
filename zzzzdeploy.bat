@echo off
cd C:\Blog\hexo_blog
git add .
git commit -m "Auto commit."
git push origin master
git push github master

hexo cl && hexo d

pause