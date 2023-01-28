#!/bin/bash

#安装docker
function install_mysql {
 if ! command -v docker &> /dev/null; then
    echo "docker不存在，进行安装docker"
	./install_docker.sh
	./install_mysql.sh
 else 
	echo "检查mysql镜像和容器"
    docker images |grep mysql
	docker ps -a |grep mysql 
 
		echo "是否安装 默认的 mysql镜像并启动mysql服务...（输入n不安装）"
		read key
		if [ ! "n" = "$key" ];then 		
			cd ./git-config/linux/centos7-init/docker/mysql 
			docker-compose up -d
			echo "mysql 启动成功 起始位置 ："
			pwd
		else
			echo "默认的 mysql 安装失败"
		fi	
 fi
}

#######执行程序#######
install_mysql
