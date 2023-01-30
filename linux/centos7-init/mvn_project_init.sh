#!/bin/bash

dir=/KF-project/gitee/spring-cloud/

#创建目录
mkdir -p $dir
cd $dir
git init 
git config --global user.name "linux01-bg"  #名称
git config --global user.email linux01@bg.com   #邮箱
git remote add origin https://gitee.com/bg-stray/spring-cloud.git #连接远程仓库
git pull origin master
git clean -f -d -x
