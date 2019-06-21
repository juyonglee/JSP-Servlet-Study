# 19. MySQL을 이용한 JDBC 연결
## 1. MySQL 설치 및 JDBC를 통한 연결
### Docker를 이용하여 MySQL 이용
우리는 MySQL을 PC에 직접 설치하지 않고 Docker를 이용하여 MySQL을 이용한다. :heart_eyes:

1. MySQL Image를 Docker Hub에서 다운로드

    [MySQL Dockerhub](https://hub.docker.com/_/mysql)

2. MySQL Image를 Docker에서 실행하기
    ```docker
    docker run --name MySql -v /Users/sojuyong/Database/MySQL/:/var/lib/mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=****** -d mysql
    ```