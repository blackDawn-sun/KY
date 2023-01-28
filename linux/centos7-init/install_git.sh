#!/bin/bash

#安装git
function install_git {
if ! command -v git &> /dev/null; then
  echo "git 命令不存在，是否准备安装 git...（输入n不安装）"
    read key
 	if [ ! "n" = "$key" ];then 
        yum -y install git
      	git config --global credential.helper store #用户密码自动保存
		echo "git 安装成功"
    else
        echo "git 安装失败"
  	fi
else 
    echo "git命令已存在"
fi
}
#######执行程序#######
install_git
	