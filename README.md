# docker-django-demo
使用 docker 部署django 的实例模板


## 直接使用 Dockerfile 构建镜像，适用于开发环境

分支：[master]()

- 先构建镜像：
```bash
docker build -t docker-django-demo:v1 -f Dockerfile .
```
- 运行容器：
```bash
docker run -it -d -p 80:80  -v /Users/pylixm/myprojects/_Docker/docker_django_demo:/code/ docker-django-demo:v1
```
说明：
- 此方法使用docker 的卷，将开发代码映射到容器内部，在容器内启动web服务。同时暴露容器的80端口到本机的80端口，即可使用 `localhost:80`
来访问服务了。
- 当不配置端口映射时，需要配置docker的网络，让宿主机和docker容器通信。
- 卷的设置，主机路径必须使用绝对路径。

## 使用 docker-compose 构建开发环境

分支：






