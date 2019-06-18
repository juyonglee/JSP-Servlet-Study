# 13. JSTL 정의 및 라이브러리
## 1. 정의
- **J**SP **S**tandard **T**ag **L**ibrary의 약어
- 공통으로 사용되는 코드 집합
## 2. 특징
- `Java`를 몰라도 간단한 프로그램 로직 구현이 가능하다.
- 다른 JSP 호출이 가능하다.
- 날짜, 시간, 숫자 포멧팅을 지원한다.
- JSP 페이지 하나를 이용하여 다양한 언어 `(XML, JSON)`의 웹 페이지 구성이 가능하다.
- Database의 입력, 수정, 삭제, 조회 처리가 가능하다.
- 문자열을 처리하는 함수를 제공한다.

## Library
|    요소     |  개요                                      |
| :--------: | :---: |
| Core       | `변수 선언`, 실행 흐름 제어, JSP 페이지간 이동 지원|
| Formatting | 숫자, 날짜, 시간 포멧팅 제공 및 다국어 지원 기능 제공|
| Database   | 데이터베이스 입력/수정/삭제/조회 기능 제공         |
| XML Parsing| XML 문서 처리 |
| function   | 문자열 처리 함수 제공 |
### 사용법
```JSP
<% @taglib prefix="c" uri="...." %>
```

## 2. JSTL 설치 및 구동 테스트
1. `Maven` 변환
    ```
    Project > Configure > Convert to Maven Project
    ```
2. [MavenRepository](https://mvnrepository.com)에 접속
3. JSTL 검색 후 아래 내용을 Library를 관리하는 `pom.xml`에 추가
    ```xml
    <!-- https://mvnrepository.com/artifact/javax.servlet/jstl -->
    <dependency>
        <groupId>javax.servlet</groupId>
        <artifactId>jstl</artifactId>
        <version>1.2</version>
    </dependency>
    ```
    
    **pom.xml**
    ```xml
    <project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
        <modelVersion>4.0.0</modelVersion>
        <groupId>JSTLExample01</groupId>
        <artifactId>JSTLExample01</artifactId>
        <version>0.0.1-SNAPSHOT</version>
        <packaging>war</packaging>
        <build>
            <sourceDirectory>src</sourceDirectory>
            <plugins>
                <plugin>
                    <artifactId>maven-compiler-plugin</artifactId>
                    <version>3.8.0</version>
                    <configuration>
                    <release>10</release>
                    </configuration>
                </plugin>
                <plugin>
                    <artifactId>maven-war-plugin</artifactId>
                    <version>3.2.1</version>
                    <configuration>
                    <warSourceDirectory>WebContent</warSourceDirectory>
                    </configuration>
                </plugin>
            </plugins>
        </build>
        <dependencies>
            <!-- 외부 라이브러리 추가 -->
            <dependency>
                <groupId>javax.servlet</groupId>
                <artifactId>jstl</artifactId>
                <version>1.2</version>
            </dependency>
        </dependencies>
    </project>
    ```
4. 라이브러리 사용 설정
    ```JSP
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!-- JSTL의 Core 라이브러리 세팅 -->
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    ```