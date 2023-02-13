remove.txt ---卸载功能未完善待补充
## 描述

基于CentOS 7 系统环境

CentOS 7 起始安装时选择最小安装 不会安装很多基础软件，本项目可自动化安装这些基础软件如wget，ifconfig。。等

## 脚本归类说明

- 起始脚本: 

  install.start

- 基础环境脚本: 

  install_git.sh 

  install_ifconfig.sh 

  install_wget.sh 

  install_vim.sh 

  install_docker.sh

- 基于docker环境的脚本: 

  install_mysql.sh

- 基于wget软件的脚本: 

  install_jdk.sh 

  install_maven.sh（**基于git 拉取配置**）

- 基于jdk,maven，git环境的脚本: 

  mvn_project_init.sh  (**项目部署 初始化git脚本**)

  mvn_project.sh(未编写完成)

## 脚本编写规则

1. 文件命名规则

   - 自动化软件安装命名（安装这种命名启动脚本可以自动执行）： install_*.sh

   - 项目部署命名 mvn_*.sh

2. 脚本编写规则

   1. cd使用
      - 启动脚本install.start 的内容是基于相对位置的 执行远程脚本会进入 项目执行路径（/linux/centos7-init）
      - 执行脚本install_*.sh 最后必须返回到 项目执行路径（/linux/centos7-init）

## 脚本内容说明

### 启动

只需要下载 install.start 这一个文件就可以实现起始环境的部署（无法读取远程的配置情况下只安装 ifconfig，vim，docker，wget）
自动启动KY 项目下  \linux\centos7-init 里 install_*.sh 脚本进行部署

### 使用方式

将 install.start 拷贝到 一个自定义目录，使用chmod 设置执行权限 （如chmod u+x install.start）
然后执行install.start文件

### 脚本介绍

#### install_jdk.sh 

> 是Linux系统（基于CentOS 7）安装 jdk (这里使用8u202版本 --作为Oracle JDK的这个版本是最终的免费商用版)的启动脚本

jdk官网： https://www.oracle.com/java/technologies/downloads/#java8

jdk华为镜像地址： https://repo.huaweicloud.com/java/jdk/

jdk下载地址：https://repo.huaweicloud.com/java/jdk/8u202-b08/jdk-8u202-linux-x64.tar.gz

jdk Linux下载命令： wget http://repo.huaweicloud.com/java/jdk/8u202-b08/jdk-8u202-linux-x64.tar.gz

#### install_maven.sh 

> 是Linux（基于CentOS 7） 安装maven（以3.6.3为例） 的启动脚本

maven 官网地址：https://maven.apache.org/download.cgi

maven 华为镜像加速地址：https://repo.huaweicloud.com/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz

maven Linux下载命令： wget http://repo.huaweicloud.com/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz

## 问题

1. 安装jdk和maven 后 java mvn 命令无法使用问题

   > 解决方案： 使用 source /etc/profile 重新刷新配置（原因：脚本执行不会影响到当前的shell窗口）
   > 或者 使用 source install.start 执行启动脚本(未测试）

