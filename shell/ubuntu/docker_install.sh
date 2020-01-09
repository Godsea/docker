sudo apt -v
if [ $? == 0 ] 
then
	# 满足新装18.0.4，16.04（安装慢）， 非新装可能会有软件冲突 
	# overlay2，aufs和btrfs存储驱动程序，btrfs仅在SLES上受支持
	# 对于Linux内核版本4和更高版本上的新安装，overlay2 受支持，并且优于aufs

	# 卸载已安装的docker，非必须操作
	sudo apt-get remove docker docker-engine docker.io containerd runc -y

	#sudo apt-key adv --keyserver keyserver.ubuntu.com  --recv-key 7EA0A9C3F273FCD8

	sudo apt-get update -y

	sudo apt-get -y install \
		apt-transport-https \
		ca-certificates \
		curl \
		gnupg-agent \
		software-properties-common 
		
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

	sudo add-apt-repository \
	   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	   $(lsb_release -cs) \
	   stable"

	sudo apt-get update -y   
	sudo apt-get install docker-ce docker-ce-cli containerd.io  --allow-unauthenticated -y

	# 列出所有版本，安装指定版本
	# apt-cache madison docker-ce
	# sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io


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