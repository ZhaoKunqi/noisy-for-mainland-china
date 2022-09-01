# currently working in progress, codes and documents incomplete.

# Noisy - 为中华人民共和国境内网络添加支援

Noisy for usage in mainland china, a fork of [1tay/noisy]([https://github.com/1tayH/noisy) .

来自[1tay的noisy](https://github.com/1tayH/noisy)项目的[fork](https://github.com/ZhaoKunqi/noisy-for-mainland-china), 添加了中华人民共和国墙内网络支援.

## 这是什么?

一个简单的Python脚本, 在前台或后台生成随机的HTTP/DNS流量, 模拟你的日常网页浏览.

## 这能给你带来什么好处?

通过生成噪音的方式在某种程度上增加网络安全威胁者的实施成本.比如攻击者在你的网关上部署流量监控. 使用这个脚本前攻击者会获得比较清晰的浏览来识别你的网页浏览记录, 使用以后将会提升攻击者准确识别你浏览记录的难度和成本.

## 兼容性:

#### 理论上只需要Python 2或3, 安装了PyPI中requests库, 即可运行.

###### 原作者测试过的平台:

- [x] MacOS High Sierra/Ubuntu 16.04/Raspbian Stretch with Python 2.7 and 3.6

###### 此Fork测试过的平台:

- [x] RHEL and RHEL的下游发行版
  
  - [x] Rocky Linux 8.X with Python 3.6
    
  - [x] Rocky Linux 9.X with Python 3.9 **(推荐使用)**
    
- [x] Windows 10 with Python 3.X
  

## 开始使用

你可以尝试执行一系列简单的指示来在你的本地局域网中来执行

这一系列简单的指示是基于Rocky Linux 9.0操作系统的最小化安装, 通常情况下也适用于其他RHEL下游操作系统的, 比如其他的el8发行版和el9发行版.

#### 获取软件的依赖关系库

因为Rocky Linux 9没有内置对应的`pip`,你需要使用`dnf`来安装`pip`.

`dnf` 和软件源在通常情况下是默认配置好的,不需要额外操作.

先安装`pip`, 再使用`pip`安装 依赖库`requests` :

```
dnf install python3-pip -y
pip install requests
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
working in progress.

