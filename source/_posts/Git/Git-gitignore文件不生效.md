---
title: Git-.gitignore文件不生效-转载
author: TianZD
top: true
cover: true
toc: true
mathjax: false
summary: >-
  .gitignore中已经标明忽略的文件目录下的文件，git push的时候还会出现在push的目录中，或者用git
  status查看状态，想要忽略的文件还是显示被追踪状态。
tags:
  - Git
categories:
  - Git
reprintPolicy: cc_by
abbrlink: 88176b53
date: 2022-04-29 10:39:56
coverImg:
img:
password:
---

## 原因
在git忽略目录中，新建的文件在git中会有缓存，如果某些文件已经被纳入了版本管理中，就算是在.gitignore中已经声明了忽略路径也是不起作用的，这时候我们就应该先把本地缓存删除，然后再进行git的提交，这样就不会出现忽略的文件了。

需要特别注意的是：
1）.gitignore只能忽略那些原来没有被track的文件，如果某些文件已经被纳入了版本管理中，则修改.gitignore是无效的。
2）想要.gitignore起作用，必须要在这些文件不在暂存区中才可以，.gitignore文件只是忽略没有被staged(cached)文件，
对于已经被staged文件，加入ignore文件时一定要先从staged移除，才可以忽略。

## 解决
首先清楚本地缓存，将其变为untrack状态，然后提交
```bash
git rm -r --cached .
git add .
git commit -m 'update .gitignore'
git push -u origin master
```