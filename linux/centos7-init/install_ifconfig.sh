#!/bin/bash

#安装ifconfig
function install_ifconfig {
 if ! command -v ifconfig &> /dev/null; then
  echo "ifconfig 命令不存在，是否准备安装 ifconfig...（输入n不安装）"
	read key
  	if [ ! "n" = "$key" ];then 
  	  yum -y install net-tools.x86_64
  	  echo "ifconfig 安装成功"
  	else
  	  echo "ifconfig 安装失败"
  	fi
 else 
    echo "ifconfig命令已存在"
 fi
}


install_ifconfig
