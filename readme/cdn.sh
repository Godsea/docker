#!/bin/bash
# 

# 阿里云镜像加速 ubuntu/centos

# 针对Docker客户端版本大于 1.10.0 的用户
 
# 您可以通过修改daemon配置文件/etc/docker/daemon.json来使用加速器

sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://9phao0xv.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker