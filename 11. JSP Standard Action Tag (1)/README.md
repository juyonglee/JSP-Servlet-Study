# 11. JSP Standard Action Tag (1)
## 1. Action의 형태
`XML 기술`을 이용하여 기존의 **JSP 문법을 확장**하는 매커니즘을 제공한다.
1. 표준 액션 (Standard Action)
    표준 규격으로 바로 사용이 가능하다.
    ```JSP
    <jsp:include page="test.jsp">
    ```
2. 커스텀 액션 (Custom Action)
    Third Party의 개념으로 **별도의 라이브러리 설치** 후 사용 가능하다.  
    ```JSP
    <c:set var="age" value="30"/>
    ```
## 2. 페이지 모듈화 표준 액션
페이지 안에 다른 페이지를 삽입하는 Action
1. 표준 액션을 사용하는 경우 
JSP 페이지가 실행될 때 `동적`으로 웹 자원을 읽어서 포함시킨다. `(즉, n개의 Servlet Class가 필요하다!)`

    ```JSP
    <jsp:include page="test.jsp"/>
    ```
2. 지시자를 사용하는 경우
JSP 페이지가 Servlet Class로 변환될 때 `정적`으로 해당 웹 자원을 읽어서 Servlet Class의 일부로 만든다. `(해당 요소를 전부 가져와서 한개의 Servlet으로 생성한다.)`
    
    ```JSP
    <%@include file="test.jsp">
    ```
3. RequestDispatcher를 사용하는 경우
    ```Java
    RequestDispatcher rd = request.getRequestDispatcher("content.jsp");
    rd.include(request, response);
    ```
    
    가장 먼저 출력되는 문제가 존재한다. 이를 해결하기 위해 `out.flush()`를 이용하여 해결한다. 하지만 가급적 사용하지 않는다.

## 3. 페이지 제어권 이동
다른 JSP 페이지로 제어를 넘길 때 사용

```JSP
<jsp:forward page="test.jsp"/>
```