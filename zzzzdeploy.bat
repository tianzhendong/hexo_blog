@echo off
cd C:\Blog\hexo_blog
git add .
git commit -m "Auto commit."
git push origin master

hexo cl && hexo d

pause