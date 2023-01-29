#!/bin/bash

#安装jdk
function install_java {
 #java jdk 自定义安装路径
 jdkDir=/KF-environment/jdk
 if ! command -v java &> /dev/null; then
     echo "jdk未安装，是否准备安装 jdk1.8...（输入n不安装）"
		read key
		if [ ! "n" = "$key" ];then 	
		  
			#1.下载jdk
			wget http://repo.huaweicloud.com/java/jdk/8u202-b08/jdk-8u202-linux-x64.tar.gz
			#2.解压
			#z ：表示 tar 包是被 gzip 压缩过的 (后缀是.tar.gz)，所以解压时需要用 gunzip 解压 (.tar不需要)
			#x ：表示 从 tar 包中把文件提取出来
			#v ：表示 显示打包过程详细信息
			#f ：指定被处理的文件是什么
			tar -zxvf jdk-8u202-linux-x64.tar.gz
			#3.创建jdk安装文件夹 并移动重命名到这个新文件夹
			mkdir -p $jdkDir
			mv jdk1.8.0_202 $jdkDir/jdk1.8
			#4.配置环境变量
			echo "
#**********自定义配置jdk开始*********
# set java environment
JAVA_HOME=${jdkDir}/jdk1.8
PATH=\$JAVA_HOME/bin:\$PATH
export JAVA_HOME PATH
#**********自定义配置jdk结束**********
" >> /etc/profile
			#5.刷新配置
			source /etc/profile
			echo "安装jdk成功并已经配置好环境变量 安装路径：$jdkDir/jdk1.8" 
		else
			echo "jdk安装失败" 
		fi
else 
	
	echo "jdk 已安装 是否进行卸载 （输入y进行卸载）"
		read remove
		if [ "y" = "$remove" ];then
			#删除 jdk 在/etc/profile 中的环境变量的配置
			sed -i -e "/自定义配置jdk开始/,/自定义配置jdk结束/d" /etc/profile
			source /etc/profile			
			unset JAVA_HOME #删除环境变量
			echo "jdk环境变量删除成功"
			rm -r $jdkDir/jdk1.8
			echo "jdk 卸载成功 $jdkDir/jdk1.8"
		fi
 fi
}
#######执行程序#######
install_java
source /etc/profile