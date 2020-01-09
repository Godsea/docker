#!/bin/bash
# 
# Centos7.4 最小化安装系统测试通过

# 卸载已安装的docker，非必须操作
sudo yum version
if [ $? == 0 ] 
then
	sudo yum remove -y docker \
					  docker-client \
					  docker-client-latest \
					  docker-common \
					  docker-latest \
					  docker-latest-logrotate \
					  docker-logrotate \
					  docker-engine
					  

	# yum-utils：管理repository及扩展包的工具，提供一个yum-config-manager单元
	# device-mapper-persistent-data lvm2：储存设备映射（devicemapper）必须的两个软件包
	sudo yum install -y yum-utils \
	  device-mapper-persistent-data \
	  lvm2
	  
	  
	# 配置一个稳定（stable）的仓库：/etc/yum.repos.d/docker-ce.repo  
	sudo yum-config-manager \
		--add-repo \
		https://download.docker.com/linux/centos/docker-ce.repo
		
		
	#启用nightly或test存储库 
	#sudo yum-config-manager --enable docker-ce-nightly
	#sudo yum-config-manager --enable docker-ce-test

	#禁用nightly或test存储库 
	#sudo yum-config-manager--disable--enable
	#sudo yum-config-manager --disable docker-ce-nightly


	sudo yum install -y docker-ce docker-ce-cli containerd.io

	# 列出所有版本，安装指定版本
	# yum list docker-ce --showduplicates | sort -r
	# sudo yum install docker-ce-<VERSION_STRING> docker-ce-cli-<VERSION_STRING> containerd.io


	# 启用

	sudo systemctl start docker
	sudo systemctl enable docker


	# 普通用户加入docker组，非必须操作
	sudo groupadd docker
	sudo gpasswd -a $USER docker
	newgrp docker

	docker version

	echo '安装完成'
fi