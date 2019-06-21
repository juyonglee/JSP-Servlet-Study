# 19. MySQL을 이용한 JDBC 연결
## 1. MySQL 설치 및 JDBC를 통한 연결
### Docker를 이용하여 MySQL 이용
우리는 MySQL을 PC에 직접 설치하지 않고 Docker를 이용하여 MySQL을 이용한다. :heart_eyes:

1. MySQL Image를 Docker Hub에서 다운로드

    [MySQL Dockerhub](https://hub.docker.com/_/mysql)

2. MySQL Image를 Docker에서 실행하기
    ```docker
    docker run --name MySQL -v /Users/sojuyong/Database/MySQL/:/var/lib/mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=****** -d mysql
    ```
### 라이브러리 설정
JDBC 사용을 위해 [MySQL Connector/J](https://mvnrepository.com/artifact/mysql/mysql-connector-java/6.0.6)를 프로젝트에 추가
```xml
<dependency>
    <groupId>mysql</groupId>
    <artifactId>mysql-connector-java</artifactId>
    <version>6.0.6</version>
</dependency>
```

### 연결 및 해제
```Java
// 데이터베이스명을 포함한 URL 기술 (Exception 방지를 위해 useSSL을 false로 설정)
String url = "jdbc:mysql://localhost:3306/dbName?useSSL=false";
// 사용자 계정
String userID = "root"; 
// 사용자 계정의 패스워드
String userPW = "****";
// Class.forName()을 이용해서 JDBC 드라이버 로드
Class.forName("com.mysql.cj.jdbc.Driver");
// 연결 객체 얻기
Connection conn = DriverManager.getConnection(url, userID, userPW);
// 연결 종료
conn.close();
```
