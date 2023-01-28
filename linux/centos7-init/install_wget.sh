#!/bin/bash


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




#######执行程序#######

install_wget
