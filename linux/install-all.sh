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
      	echo "是否拉取远程配置脚本...（输入n不拉取）"
			read ispull
			if [ ! "n" = "$ispull" ];then
				#Git项目下载部分文件或文件夹 --开头
				#1.创建文件夹 并初始化git
				mkdir -p ~/git/config
				cd ~/git/config
				git init 
				#2.连接要下载的库的地址
				git remote add -f origin https://gitee.com/bg-stray/KY.git
				#3.启用过滤功能
				git config core.sparsecheckout true
				#4.将install-all这个关键字加入过滤列表（要加/*），如果有其他关键字可以多次运行该命令，关键字是文件夹或文件皆可
				echo linux/install-all.sh >> .git/info/sparse-checkout
				#5.拉取代码
				git pull origin master
				#6.给与install-all.sh 权限
				chmod u+x linux/install-all.sh
				#Git项目下载部分文件或文件夹 --结尾
				echo "远程配置脚本拉取成功！位置 ~/git/config/linux/install-all.sh"	
				
					echo "是否执行远程脚本...（输入n不执行）"
					read doInstallAll
					if [ ! "n" = "$doInstallAll" ];then
						cd ~/git/config/linux				
						./install-all.sh
					else
					fi								
			fi      	      
    else
        echo "wget 安装失败"
  	fi
else 
    echo "git命令已存在"
fi
}
install_git

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
install_vim

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
install_wget



#安装docker
function install_docker {
 if ! command -v docker &> /dev/null; then
    echo "docker 命令不存在，是否准备安装 docker...（输入n不安装）"
	
	
	
	
	echo "docker 安装成功"
 else 
    echo "docker命令已存在"
 fi
}
install_docker
