[阿里云官方仓库配置](https://cr.console.aliyun.com/repository/cn-shanghai/cowa/test/details)

### 1. 登录阿里云Docker Registry
> $ sudo docker login --username=17839553275 registry.cn-shanghai.aliyuncs.com

用于登录的用户名为阿里云账号全名，密码为开通服务时设置的密码。

您可以在访问凭证页面修改凭证密码。

### 2. 从Registry中拉取镜像
> $ sudo docker pull registry.cn-shanghai.aliyuncs.com/cowa/test:[镜像版本号]

3. 将镜像推送到Registry
> $ sudo docker login --username=17839553275 registry.cn-shanghai.aliyuncs.com
> 
> $ sudo docker tag [ImageId] registry.cn-shanghai.aliyuncs.com/cowa/test:[镜像版本号]
> 
> $ sudo docker push registry.cn-shanghai.aliyuncs.com/cowa/test:[镜像版本号]

请根据实际镜像信息替换示例中的[ImageId]和[镜像版本号]参数。

### 4. 选择合适的镜像仓库地址
从ECS推送镜像时，可以选择使用镜像仓库内网地址。推送速度将得到提升并且将不会损耗您的公网流量。

如果您使用的机器位于VPC网络，请使用 registry-vpc.cn-shanghai.aliyuncs.com 作为Registry的域名登录，并作为镜像命名空间前缀。
### 5. 示例
使用"docker tag"命令重命名镜像，并将它通过专有网络地址推送至Registry。
```
$ sudo docker images
REPOSITORY                                                         TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
registry.aliyuncs.com/acs/agent                                    0.7-dfb6816         37bb9c63c8b2        7 days ago          37.89 MB
$ sudo docker tag 37bb9c63c8b2 registry-vpc.cn-shanghai.aliyuncs.com/acs/agent:0.7-dfb6816
使用"docker images"命令找到镜像，将该镜像名称中的域名部分变更为Registry专有网络地址。

$ sudo docker push registry-vpc.cn-shanghai.aliyuncs.com/acs/agent:0.7-dfb6816
```