# docker-django-demo

使用 docker 部署django 的实例模板

### 实例1：直接使用 Dockerfile 构建镜像来运行django

分支：[dockerfile-for-mac](https://github.com/pylixm/docker-django-demo/tree/dockerfile-for-mac)

- 先构建镜像：

```bash
docker build -t docker-django-demo:v1 -f Dockerfile .
```

> -t ：构建镜像的名称和标签
>
> -f ：构建镜像的dockerfile文件
>
>  .  ：以本目录为`COPY`或`ADD`的相对目录。

- 运行容器：

```bash
docker run -d -p 80:80  -v /Users/pylixm/myprojects/_Docker/docker_django_demo:/code/ docker-django-demo:v1
```

> -d： 以后台形式运行。
>
> -p：hostPort:containerPort : 映射容器端口到主机端口，前面是主机端口，后边是容器端口；
>
> -v：主机目录:容器内目录 ：挂载主机目录作为容器的持久化数据卷。主机目录必须是`绝对路径`；



### 实例2：使用 docker-compose 构建镜像：django + mysql



分支：[docker-compose](https://github.com/pylixm/docker-django-demo/tree/docker-compose)

- 编写好docker-compose 配置文件后，执行如下命令启动：

  ```bash
  docker-compose -f local.yml up -d
  ```

  > -f：指定 docker-compose 的配置文件名，默认为`docker-compose.yml`，当为默认时，可省略此参数。
  >
  > -d：以后台方式运行。

- 查看compose所有容器的日志

  ```bash
  docker-compose -f local.yml logs -f
  ```

  > -f : 以追加的形式

- 我们将mysql端口映射到本地端口，方便我们访问：

  ```ports:  - "127.0.0.1:3307:3306"
  ports:
        - "127.0.0.1:3307:3306"
  ```

  ​

### 实例3：使用docker-compose 部署django+mysql+gunicorn+nginx

分支：[docker-compose]()