---
title: gcc、make、cmake、qmake、make install
date: 2022年4月28日
author: TianZD
top: true
cover: true
toc: true
mathjax: false
summary: gcc、make、cmake、qmake、make install这么多的make都干了什么【转载】
tags:
  - make
  - 编程
categories:
  - 转载
abbrlink: 84b47928
reprintPolicy: cc_by
coverImg:
img:
password:
---
[toc]

# gcc、make、cmake、qmake、make install这么多的make都干了什么【转载】

[www.jianshu.com](https://www.jianshu.com/p/758549cc274d)

## 前言

cmake是一种跨平台的编译工具，比make更为高级，使用起来要方便的多。cmake主要是编写了cmakelists.txt文件，然后用cmake命令将cmakelists.txt文件转化成make所需要的makefile文件，最后用make命令编译源码生成可执行程序或者共享库（so（shared object））。它的作用和qt的qmake是相似的。

可以如下图理解：

configure（配置编译环境）

cmake=qmake（生成makefile）

make（从makefile中读取指令，然后编译）

make install（从makefile中读取指令，安装程序）

* * *

## 那gcc/g++在这个过程中干了什么呢

我们知道编译和链接阶段是靠g++和gcc编辑器来完成，但是如果编译和链接的阶段如果源文件太多，一个一个编译时就会特别麻烦，于是人们想到，为什么不设计一种类似批处理的程序，来批处理编译源文件呢，于是就有了make工具，它是一个自动化编译工具，你可以使用一条命令实现完全编译。但是你需要编写一个规则文件，make依据它来批处理编译，这个文件就是makefile。

\---------------------

## 详细过程

1.gcc是GNU Compiler Collection（就是GNU编译器套件），也可以简单认为是编译器，它可以编译很多种编程语言（括C、C++、Objective-C、Fortran、Java等等）。

2.当你的程序只有一个源文件时，直接就可以用gcc命令编译它。

3.但是当你的程序包含很多个源文件时，用gcc命令逐个去编译时，你就很容易混乱而且工作量大

4.所以出现了make工具

make工具可以看成是一个智能的批处理工具，它本身并没有编译和链接的功能，而是用类似于批处理的方式—通过调用makefile文件中用户指定的命令来进行编译和链接的。

5.makefile是什么？简单的说就像一首歌的乐谱，make工具就像指挥家，指挥家根据乐谱指挥整个乐团怎么样演奏，make工具就根据makefile中的命令进行编译和链接的。

6.makefile命令中就包含了调用gcc（也可以是别的编译器）去编译某个源文件的命令。

7.makefile在一些简单的工程完全可以人工手下，但是当工程非常大的时候，手写makefile也是非常麻烦的，如果换了个平台makefile又要重新修改。

8.这时候就出现了Cmake这个工具，cmake就可以更加简单的生成makefile文件给上面那个make用。当然cmake还有其他功能，就是可以跨平台生成对应平台能用的makefile，你不用再自己去修改了。

9.可是cmake根据什么生成makefile呢？它又要根据一个叫CMakeLists.txt文件（学名：组态档）去生成makefile。

10.到最后CMakeLists.txt文件谁写啊？亲，是你自己手写的。

11.当然如果你用IDE，类似VS这些一般它都能帮你弄好了，你只需要按一下那个三角形

12.cmake是make maker，生成各种可以直接控制编译过程的控制器的配置文件，比如makefile、各种IDE的配置文件。

13.make是一个简单的通过文件时间戳控制自动过程、处理依赖关系的软件，这个自动过程可以是编译一个项目。

## linux平台下的编译流程

　　文本程序到可执行文件生成无论在什么平台大致分为以下几个部分：

　　1.用编辑器编写源代码，如.c文件。

　　2.用编译器编译代码生成目标文件，如.o。

　　3.用链接器连接目标代码生成可执行文件，如.exe。

　　Linux平台下，.o文件一般是通过编译的但还未链接的目标文件，.out文件一般都是经过相应的链接产生的可执行文件（linux下）。当然这是一般情况下人们这么设置，而真正的，在linux中 .o通常保存的是可执行代码 ，至于可执行文件则没有规定扩展名，用的是文件属性位来决定的是否可执行。在chmod中设置。

　　我们知道编译和链接阶段是靠g++和gcc编辑器来完成，这两个编译阶段是相同的，但是链接阶段g++默认链接c++库，所以一般情况下用gcc编译c文件，而g++编译cpp文件。当然g++也可以编译c文件，而gcc编译cpp文件则需要在后面加上参数-lstdc++，作用就是链接c++库。

　　但是如果编译和链接的阶段如果源文件太多，一个一个编译时就会特别麻烦，于是人们想到，为什么不设计一种类似批处理的程序，来批处理编译源文件呢，于是就有了make工具，它是一个自动化编译工具，你可以使用一条命令实现完全编译。但是你需要编写一个规则文件，make依据它来批处理编译，这个文件就是makefile，所以编写makefile文件也是一个程序员所必备的技能。

　　对于一个大工程，编写makefile实在是件复杂的事，于是人们又想，为什么不设计一个工具，读入所有源文件之后，自动生成makefile呢，于是就出现了cmake工具，它能够输出各种各样的makefile或者project文件,从而帮助程序员减轻负担。但是随之而来也就是编写cmakelist文件，它是cmake所依据的规则。所以在编程的世界里没有捷径可走，还是要脚踏实地的。

　　原文件—cmakelist —cmake —makefile —make —生成可执行文件（make中则包含了多条链接以及gcc/g++编译语句）。

[查看原网页: www.jianshu.com](https://www.jianshu.com/p/758549cc274d)