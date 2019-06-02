# 8. Error, Exception 처리 기술

## 1. Web Component 상에서 발생하는 예외 처리
우리가 작성하는 Web에서 개발자가 에러를 직접적으로 처리하는 방법.

```Java
try {
    // 정상적 코드 실행 Block
} eatch(Exception e) {
    // 오류 발생 시 실행되는 Block
    RequestDispatcher rd = request.getRequestDispatcher("error.jsp"); 
    rd.forward(req, res);
}
// 응답 내용
```

`RequestDispatcher`는 클라이언트로의 최초 요청을 JSP/Servlet 내에서 원하는 자원으로 요청을 넘기는 역할을 수행하거나, 특정 자원에 처리를 요청하고 처리 결과를 얻어오는 기능을 수행하는 클래스이다.

### 간결한 에러 처리 방식
 - JSP Page Directive 설정
    ```JAVA
    <%@ page errorPage="error.jsp" %>
    ```

- 에러 상세 내용 출력 ex) error.jsp
    ```JAVA
    <%@ page isErrorPage=“true” %>
    <%= exception.getMessage() %>
    ```

### 예제 1. 예외 처리를 하지 않은 경우
![](https://github.com/juyonglee/JSP-Servlet-Study/blob/master/08.%20Error%2C%20Exception%20처리%20기술/Images/Case1.gif)


### 예제 2. 예외 처리를 적용한 경우 (Try-Catch)
![](https://github.com/juyonglee/JSP-Servlet-Study/blob/master/08.%20Error%2C%20Exception%20처리%20기술/Images/Case2.gif)

### 예제 3. 예외 처리를 적용한 경우 (RequestDispatcher)
![](https://github.com/juyonglee/JSP-Servlet-Study/blob/master/08.%20Error%2C%20Exception%20처리%20기술/Images/Case3.gif)
상세 처리가 불가능하다 (errorPage)