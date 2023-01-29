#!/bin/bash

#安装jdk
function install_mvn {
 #java jdk 自定义安装路径
 mvnDir=/KF-environment/maven
 
 if ! command -v mvn &> /dev/null; then
     echo "maven未安装，是否准备安装 maven1.6.3...（输入n不安装）"
		read key
		if [ ! "n" = "$key" ];then 	
		  
			if [ 0"$JAVA_HOME" = "0" ] ; then #判断环境变量JAVA_HOME 存在？
			#JAVA_HOME不存在 安装jdk
				echo "JAVA_HOME环境变量不存在 准备安装jdk..."
				./install_jdk.sh
			else
			#JAVA_HOME存在 安装maven
			
				#1.下载maven
				wget http://repo.huaweicloud.com/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz
				#2.解压
				#z ：表示 tar 包是被 gzip 压缩过的 (后缀是.tar.gz)，所以解压时需要用 gunzip 解压 (.tar不需要)
				#x ：表示 从 tar 包中把文件提取出来
				#v ：表示 显示打包过程详细信息
				#f ：指定被处理的文件是什么
				tar -zxvf apache-maven-3.6.3-bin.tar.gz
				#3.创建jdk安装文件夹 并移动重命名到这个新文件夹
				mkdir -p $mvnDir
				mv apache-maven-3.6.3 $mvnDir/maven3.6.3
				#4.配置环境变量
				echo "
#**********自定义配置maven开始*********
# set maven environment
MAVEN_HOME=$mvnDir/maven3.6.3
PATH=\$MAVEN_HOME/bin:\$PATH
export MAVEN_HOME PATH
#**********自定义配置maven结束**********
" >> /etc/profile
				#5.刷新配置
				source /etc/profile
				
				#6.修改maven配置 
				#6.1设置 maven远程镜像仓库地址
				#6.1.1下载setting文件 --华为官方
				#wget http://mirrors.huaweicloud.com/api/v1/configurations/maven
				#mv maven $mvnDir/maven3.6.3/config/settings.xml
				#6.1.2 下载setting文件 -- gitee部署的
				mv configs/maven/settings.xml $mvnDir/maven3.6.3/config/settings.xml
				#6.2 修改本地仓库存放地址 （暂不修改）
				echo "安装maven成功并已经配置好环境变量 安装路径：$mvnDir/maven3.6.3" 
			fi
		else
			echo "maven安装失败" 
		fi
else 
	
	echo "maven 已安装 是否进行卸载 （输入y进行卸载）"
		read remove
		if [ "y" = "$remove" ];then
			#删除 maven 在/etc/profile 中的环境变量的配置
			sed -i -e "/自定义配置maven开始/,/自定义配置maven结束/d" /etc/profile
			source /etc/profile
			echo "jdk环境变量删除成功"
			rm -r $mvnDir/maven3.6.3
			echo "maven 卸载成功 $mvnDir/maven3.6.3"
		fi
 fi
}
#######执行程序#######
install_mvn
