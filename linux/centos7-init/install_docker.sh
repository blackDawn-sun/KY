#!/bin/bash

#安装docker
function install_docker {
 if ! command -v docker &> /dev/null; then
    echo "docker 命令不存在，是否准备安装 docker...（输入n不安装）"
		read key
		if [ ! "n" = "$key" ];then 		
			#1.环境
			yum -y install gcc
			yum -y install gcc-c++
			#2.卸载旧版本
			yum remove docker \ docker-client \ docker-client-latest \ docker-common \ docker-latest \ dock-latest-logrotate \ docker-logrotate \ docker-selinux \ docker-engine-selinux \ docker-engine
			#3.安装依赖包
			yum install -y yum-utils device-mapper-persistent-data lvm2
			#4.设置stable镜像仓库
			yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
			#5.更新yum软件包索引
			yum makecache fast
			#6.安装最新docker
			yum -y install docker-ce
			#7.启动docker
			systemctl enable docker   #开机自启
			systemctl start docker					
			echo "docker 安装成功"		
		else
			echo "docker 安装失败"
		fi
 else 
    echo "docker命令已存在"
 fi
}

function install_compose {
 if ! command -v docker-compose &> /dev/null; then
    echo "docker-compose 命令不存在，是否准备安装 docker-compose...（输入n不安装）"
		read key
		if [ ! "n" = "$key" ];then 		
			mv ./git-config/linux/centos7-init/docker/docker-compose-1.26.2 /usr/local/bin/docker-compose
			chmod 777 /usr/local/bin/docker-compose
			docker-compose version
			echo "docker-compose 安装成功"		
		else
			echo "docker-compose 安装失败"
		fi
 else 
    echo "docker-compose已安装成功"
 fi
}


#######执行程序#######
install_docker
install_compose
