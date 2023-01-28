#!/bin/bash

#安装git
function install_git {
if ! command -v git &> /dev/null; then
  echo "git 命令不存在，是否准备安装 git...（输入n不安装）"
    read key
 	if [ ! "n" = "$key" ];then 
        yum -y install git
      	git config --global credential.helper store
		echo "git 安装成功"
    else
        echo "git 安装失败"
  	fi
else 
    echo "git命令已存在"
fi
}

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

#安装wget
function install_wget {
if ! command -v wget &> /dev/null; then
  echo "wget 命令不存在，是否准备安装 wget...（输入n不安装）"
    read key
 	  if [ ! "n" = "$key" ];then 
      	yum -y install wget
      	echo "wget 安装成功"
    	else
        echo "wget 安装失败"
  	fi
  else 
    echo "wget命令已存在"
 fi
}

#安装docker
function install_docker {
 if ! command -v docker &> /dev/null; then
    echo "docker 命令不存在，是否准备安装 docker...（输入n不安装）"
	
	
	
	
	echo "docker 安装成功"
 else 
    echo "docker命令已存在"
 fi
}


#######执行程序#######
install_git
install_ifconfig
install_vim
install_wget
install_docker