# Noisy - 为中华人民共和国境内网络添加支援

Noisy for usage in mainland china, a fork of [1tay/noisy]([https://github.com/1tayH/noisy) .

来自[1tay的noisy](https://github.com/1tayH/noisy)项目的[fork](https://github.com/ZhaoKunqi/noisy-for-mainland-china), 添加了中华人民共和国墙内网络支援.

## 这是什么?

一个简单的Python脚本, 在前台或后台生成随机的HTTP/DNS流量, 模拟你的日常网页浏览.

## 这能给你带来什么好处?

通过生成噪音的方式在某种程度上增加网络安全威胁者的实施成本.比如攻击者在你的网关上部署流量监控. 使用这个脚本前攻击者会获得比较清晰的浏览来识别你的网页浏览记录, 使用以后将会提升攻击者准确识别你浏览记录的难度和成本.

## 兼容性:

#### 理论上只需要Python 2或3, 安装了PyPI中requests库, 即可运行.

###### 此Fork测试过的平台:

- [x] RHEL and RHEL的下游发行版
  
  - [x] Rocky Linux 8.X with Python 3.6
    
  - [x] Rocky Linux 9.X with Python 3.9 **(推荐使用)**

## 开始使用

你可以尝试执行一系列简单的指示来在你的本地局域网中来执行

这一系列简单的指示是基于Rocky Linux 9.0操作系统的最小化安装, 通常情况下也适用于其他RHEL下游操作系统的, 比如其他的el8发行版和el9发行版.

#### 获取软件的依赖关系库

因为Rocky Linux 9没有内置对应的`pip`,你需要使用`dnf`来安装`pip`.

`dnf` 和软件源在通常情况下是默认配置好的,不需要额外操作.

先安装`pip`, 再使用`pip`安装 依赖库`requests` :

```
dnf install python3-pip -y
pip3 install requests
```

#### 获取软件的副本

Rocky Linux 9内置`git`, 如果你的RHEL下游发行版没有内置,你需要使用`dnf`来安装`git`.

```
dnf install git -y
```

在这之后, 你可以通过`git`来获取软件的副本了

```
git clone https://github.com/ZhaoKunqi/noisy-for-mainland-china.git
```

现在, 进入到工作目录 `noisy-for-mainland-china`

```
cd noisy-for-mainland-china
```

执行脚本

```
python noisy.py --config config_mainland_china_general_purpose.json
```

这个脚本接受这些启动选项:

```
$ python noisy.py --help
使用方法: noisy.py [-h] [--log -l] --config -c [--timeout -t]

可选项:
  -h, --help    展示当前帮助消息
  --log -l      选择日志等级
  --config -c   指定配置文件
  --timeout -t  爬虫访问一个页面的超时时间
```

以上选项中只有--config配置文件是必须指定的

#### 容器化使用

镜像仓库: https://quay.io/repository/zhao_kunqi/noisy-for-mainland-china?tab=tags

##### 快速使用指南:

//注：使用Podman是因为它比Docker更简单易用，如果你更喜欢Docker并且想用Docker来运行，那也没有任何问题，只要支持标准容器的容器引擎都可以正常运行的。

```
#适用环境:
#    操作系统: Rocky Linux 9 Minimal
#    额外安装软件 podman

dnf install podman -y
# 如果系统没有安装Podman, 使用dnf安装podman容器引擎

podman pull quay.io/zhao_kunqi/noisy-for-mainland-china:latest
# 获取镜像

podman run -itd --name=noisy-01 quay.io/zhao_kunqi/noisy-for-mainland-china:latest
# 使用刚才获得的镜像,在后台创建启动一个名为noisy-01的容器.
# 此操作成功执行后, 脚本会开始运作.

podman generate systemd noisy-01 > /etc/systemd/system/noisy-01.service
# 给刚才创建启动的noisy-01容器生成systemd文件
# 放在/etc/systemd/system/目录下

systemctl daemon-reload
# 让systemd重载.

systemctl enable noisy-01.service --now
# 在systemd中给刚才创建的noisy-01容器设置开机自启

systemctl status noisy-01.service
#检查容器状态
```

如果你只需要一个后台运行开机自启的噪音制造源,那么上面的这些操作就可以了.

##### 如果你觉得一个不够,可以创建多个容器同时运行制造更大的噪音:

```
podman run -itd --name=noisy-02 quay.io/zhao_kunqi/noisy-for-mainland-china:latest
# 创建启动一个名为noisy-02的容器

podman generate systemd noisy-02 > /etc/systemd/system/noisy-02.service
# 给刚才创建启动的noisy-02容器生成systemd文件 noisy-02.service
# 放在/etc/systemd/system/目录下

systemctl daemon-reload
# 让systemd重载.

systemctl enable noisy-02.service --now
# 在systemd中给刚才创建的noisy-02容器设置开机自启

systemctl status noisy-02.service
#检查容器状态
```

还可以把以上示例中的02换成03,04,05,06等来创建更多噪音源,模拟更多的人同时浏览网页.

## 多个可用的配置文件可选

1. config_mainland_china_general_purpose.json - 通用, 包含了一些常用网站.
  
2. config_mainland_china_programmer.json 程序员包, 包含一些编程课程类网站.

## Acknowledgments

This project has been inspired by
- [1tay/noisy](https://github.com/1tayH/noisy)
- [RandomNoise](http://www.randomnoise.us)
- [web-traffic-generator](https://github.com/ecapuano/web-traffic-generator)
