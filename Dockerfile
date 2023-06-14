# 以Node16镜像为基础
FROM node:16-alpine AS BUILD_IMAGE

# 构建者的基本信息
LABEL maintainer="easybui.com"

# --env-file env.list 
# 设置环境变量 获取用 $NODE_ENV
# NODE_ENV: editor 编辑器模式（无需账号权限）｜ production 个人开发模式（要登录权限）｜ online 在线多人模式（要登录权限）
# USERNAME_ENV: 用户名，默认 easybui
# PROJECT_ENV: 项目名，默认 bui
# PLATFORM_ENV: 项目的平台模式 默认 webapp | link | bingotouch | cordova | weixinapp
# DEV_ENV: 开发模式 默认 spa | mpa 分别不同的工程模式，预览也会采用不同的方式
# TEMPLATE_ENV: 模板，默认 empty 空白 | tab-foot 底部选项卡 | tab-head 顶部选项卡 | tab-side 侧边选项卡 | main-sidebar 侧划栏 | main-login 登录页 | main-form 表单页 | main-list 列表分页加载
# PORT_ENV: 端口，默认编辑模式 8000，个人开发模式是9000
# WORKSPACE_ENV: 项目存储的路径
# FROM_ENV: 项目及模板工程来源，如果没有，则从远程构建
ENV NODE_ENV=editor USERNAME_ENV=easybui PROJECT_ENV=bui PLATFORM_ENV=webapp TEMPLATE_ENV=empty DEV_ENV=spa PORT_ENV=8000 WORKSPACE_ENV=/home/Baida FROM_ENV=/home/Baida/.baida/release/bui

# 工作目录
WORKDIR /home/Baida

# 安装git，环境更新要等很久
# RUN apt-get update && apt-get install -y git
#
# RUN git clone https://github.com/imouou/BUI-Template.git
# ADD https://github.com/imouou/BUI-Template/archive/refs/tags/1.8.21.zip .

# 拷贝本地文件到镜像里的工作空间, 运行一次就会覆盖一次
# COPY ./bui-template ./Baida/.baida/relese/bui

# 在build这个镜像时执行的操作
RUN npm install baida -g --registry=https://registry.npmmirror.com

# 运行命令，支持指定不同路径
CMD ["baida", "create"]