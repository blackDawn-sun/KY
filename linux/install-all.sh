#!/bin/sh


#安装ifconfig
function install_ifconfig {
 if ! command -v ifconfig &> /dev/null; then
    echo "ifconfig 命令不存在，准备安装 ifconfig..."
	yum -y install net-tools.x86_64
	
	echo "ifconfig 安装成功"
 else 
    echo "ifconfig命令已存在"
 fi
}
install_ifconfig

#安装vim
function install_vim {
 if ! command -v vim &> /dev/null; then
    echo "vim 命令不存在，准备安装 vim..."
	yum -y install vim
	echo "vim 安装成功"
 else 
    echo "vim命令已存在"
 fi
}
install_vim

#安装git
function install_git {
 if ! command -v git &> /dev/null; then
    echo "git 命令不存在，准备安装 git..."
	yum -y install git
	git config --global credential.helper store
	echo "git 安装成功"
 else 
    echo "git命令已存在"
 fi
}
install_git






#安装docker
function install_docker {
 if ! command -v docker &> /dev/null; then
    echo "docker 命令不存在，准备安装 docker..."
	
	
	
	
	echo "docker 安装成功"
 else 
    echo "docker命令已存在"
 fi
}
install_docker