#!/bin/bash

dir=/KF-project/gitee/spring-cloud/

cd $dir
git pull origin master
echo "列出所有的服务"
ls -l |awk '{print $9}'

echo "选择项目："
read projectName
if [ ! -d "$projectName" ];then
  echo "目录不存在"
  exit
fi

#编译导包
cd "$projectName"
git pull origin master
mvn package -Dmaven.test.skip=true