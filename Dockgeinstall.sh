#!/bin/bash

# 更新系统
apt update && apt upgrade -y

# 安装 Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
rm get-docker.sh

# 安装 Docker Compose
curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# 创建目录
mkdir -p /opt/stacks /opt/dockge

# 切换到目标目录
cd /opt/dockge

# 下载 Docker Compose 配置文件
curl https://raw.githubusercontent.com/louislam/dockge/master/compose.yaml --output compose.yaml

# 使用 Docker Compose 启动容器
docker compose up -d