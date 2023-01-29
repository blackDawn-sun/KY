1.只需要下载 install.start 这一个文件就可以实现起始环境的部署（无法读取远程的配置情况下只安装 ifconfig，vim，docker，wget）
2.使用方式：将 install.start 拷贝到 一个自定义目录，使用chmod 设置执行权限 （如chmod u+x install.start）
然后执行install.start文件
3.install_jdk.sh 是Linux系统（基于centeros 7）安装 jdk (这里使用8u202版本 --作为Oracle JDK的这个版本是最终的免费商用版)
jdk官网： https://www.oracle.com/java/technologies/downloads/#java8
jdk华为镜像地址： https://repo.huaweicloud.com/java/jdk/
jdk下载地址：https://repo.huaweicloud.com/java/jdk/8u202-b08/jdk-8u202-linux-x64.tar.gz
jdk Linux下载命令： wget http://repo.huaweicloud.com/java/jdk/8u202-b08/jdk-8u202-linux-x64.tar.gz
4.