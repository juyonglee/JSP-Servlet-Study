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
### 예제 1. 예외 처리를 하지 않은 경우
```JSP
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_age = request.getParameter("user_age");
	// NumberFormatException 예외가 발생 시 에러에 대응할 수 없다.
	int age = Integer.parseInt(user_age);	
	out.print("사용자의 나이는 " + age + "살입니다.");
%>
```
| [예제] index.jsp, result01.jsp |
| --- |
| ![](https://github.com/juyonglee/JSP-Servlet-Study/blob/master/08.%20Error%2C%20Exception%20처리%20기술/Images/Case1.gif)  |


### 예제 2. 예외 처리를 적용한 경우 (Try-Catch)
```JSP
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	try {
		String user_age = request.getParameter("user_age");
		int age = Integer.parseInt(user_age);
		out.print("사용자의 나이는 " + age + "살입니다.");
	} catch(Exception e) {
		out.print("숫자만 입력가능합니다.");
	}
%>
```
| [예제] index.jsp, result02.jsp |
| --- |
| ![](https://github.com/juyonglee/JSP-Servlet-Study/blob/master/08.%20Error%2C%20Exception%20처리%20기술/Images/Case2.gif)  |


### 예제 3. 예외 처리를 적용한 경우 (RequestDispatcher)
`RequestDispatcher`는 클라이언트로의 최초 요청을 JSP/Servlet 내에서 원하는 자원으로 요청을 넘기는 역할을 수행하거나, 특정 자원에 처리를 요청하고 처리 결과를 얻어오는 기능을 수행하는 클래스이다.
```JSP
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	try {
		String user_age = request.getParameter("user_age");
		int age = Integer.parseInt(user_age);
		out.print("사용자의 나이는 " + age + "살입니다.");
	} catch(Exception e) {
		RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
		dispatcher.forward(request, response);
	}
%>
```
| [예제] index.jsp, result03.jsp, error.jsp |
| --- |
| ![](https://github.com/juyonglee/JSP-Servlet-Study/blob/master/08.%20Error%2C%20Exception%20처리%20기술/Images/Case3.gif)  |

### 예제 4. 예외 처리를 적용한 경우 (간결한 에러 처리 방식)
 - JSP Page Directive 설정: errorPage 설정
    에러가 발생할 경우 이동할 페이지를 `errorPage`에 설정한다.
    ```JSP
    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/error02.jsp"%>
    <%
	    String user_age = request.getParameter("user_age");
	    int age = Integer.parseInt(user_age);
	    out.print("사용자의 나이는 " + age + "살입니다.");
    %>
    ```
- 에러 상세 내용 출력
    `isErrorPage`를 true로 설정한다. 편리하긴 하지만 각각의 에러에 대한 상세한 처리가 불가능하다. 또한 Console 창에 에러가 출력되므로 서버 성능의 저하를 가져올 수도 있다.
    ```JSP
    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isErrorPage="true"%>
    <%
	    System.out.println("Error Message: " + exception.getMessage());
    %>
    <script>
	    alert("숫자만 입력가능합니다.");
	    history.back();
    </script>
    ```
    | [예제] index.jsp, result04.jsp, error02.jsp |
    | --- |
    | ![](https://github.com/juyonglee/JSP-Servlet-Study/blob/master/08.%20Error%2C%20Exception%20처리%20기술/Images/Case4.gif)  |

## 2. web.xml 파일에 에러 페이지 등록 및 처리
### Exception Type별로 에러 페이지 등록
웹 전체에 등록하는 방식이다.
- **[Step1]** 예외 처리를 코드를 추가하지 않고 단순히 동작하는 페이지를 생성한다.
    ```JSP
    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
        String user_age = request.getParameter("user_age");
        int age = Integer.parseInt(user_age);
        out.print("사용자의 나이는 " + age + "살입니다.");
    %>
    ```
- **[Step2]** web.xml에 `<error-page>`에 처리한 exception을 `<exception-type>`에 추가하고 에러를 처리할 페이지를 `location`에 추가한다.
    ```xml
   <?xml version="1.0" encoding="UTF-8"?>
    <web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd" id="WebApp_ID" version="4.0">
    <display-name>Error Handling Example</display-name>
    <welcome-file-list>
        <welcome-file>index.html</welcome-file>
        <welcome-file>index.htm</welcome-file>
        <welcome-file>index.jsp</welcome-file>
        <welcome-file>default.html</welcome-file>
        <welcome-file>default.htm</welcome-file>
        <welcome-file>default.jsp</welcome-file>
    </welcome-file-list>
    <error-page>
        <exception-type>java.lang.NumberFormatException</exception-type>
        <location>/numberError.jsp</location>
    </error-page>
    </web-app>
    ```
- **[Step3]** Error를 처리할 페이지 생성 후 `isErrorPage`를 true로 설정한다.
    ```JSP
    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
    <%
        response.setStatus(200);
    %>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>Error Page:NumberFormationExcription</title>
    </head>
    <body>
        <%= exception.getMessage() %>
    </body>
    </html>
    ```
    | [예제] index.jsp, result05.jsp, numberError.jsp, web.xml |
    | --- |
    | ![](https://github.com/juyonglee/JSP-Servlet-Study/blob/master/08.%20Error%2C%20Exception%20처리%20기술/Images/Case5.gif) |

## 3. HTTP 상태 코드별 에러 페이지 등록 및 처리
- **[Step1]** web.xml에 `<error-page>`에 처리한 exception을 `<exception-type>`에 추가하고 에러를 처리할 페이지를 `location`에 추가한다.
    ```xml
  <?xml version="1.0" encoding="UTF-8"?>
    <web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd" id="WebApp_ID" version="4.0">
    <display-name>Error Handling Example</display-name>
    <welcome-file-list>
        <welcome-file>index.html</welcome-file>
        <welcome-file>index.htm</welcome-file>
        <welcome-file>index.jsp</welcome-file>
        <welcome-file>default.html</welcome-file>
        <welcome-file>default.htm</welcome-file>
        <welcome-file>default.jsp</welcome-file>
    </welcome-file-list>
    <error-page>
        <exception-type>java.lang.NumberFormatException</exception-type>
        <location>/numberError.jsp</location>
    </error-page>
    <!-- 요청 페이지가 존재하지 않는 경우 -->
    <error-page>
        <error-code>404</error-code>
        <location>/pageNotFound.jsp</location>
    </error-page>
    </web-app>
    ```
- **[Step2]** Error를 처리할 페이지 생성 후 `isErrorPage`를 true로 설정한다.
    ```JSP
  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
    <%
        response.setStatus(404);
    %>
    <!DOCTYPE html>
    <html>
    <head>
    <meta charset="UTF-8">
    <title>Error Page:pageNotFound</title>
    </head>
    <body>
        <h3>페이지가 존재하지 않습니다.</h3>
    </body>
    </html>
    ```
- **[Step3]** 존재하지 않는 경로로 파일을 요청한다.
    | [예제] index.jsp, pageNotFound.jsp, web.xml |
    | --- |
    | ![](https://github.com/juyonglee/JSP-Servlet-Study/blob/master/08.%20Error%2C%20Exception%20처리%20기술/Images/Case6.gif) 
