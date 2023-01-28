#!/bin/bash


#安装vim
function install_vim {
if ! command -v vim &> /dev/null; then
  echo "vim 命令不存在，是否准备安装 vim...（输入n不安装）"
    read key
  	if [ ! "n" = "$key" ];then 
      	yum -y install vim
      	echo "vim 安装成功"
    	else
        echo "vim 安装失败"
  	fi
 else 
    echo "vim命令已存在"
 fi
}



#######执行程序#######
install_vim
