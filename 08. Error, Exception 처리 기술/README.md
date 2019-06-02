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
![](https://github.com/juyonglee/JSP-Servlet-Study/blob/master/08.%20Error%2C%20Exception%20처리%20기술/Images/Case1.gif)

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
![](https://github.com/juyonglee/JSP-Servlet-Study/blob/master/08.%20Error%2C%20Exception%20처리%20기술/Images/Case2.gif)

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
![](https://github.com/juyonglee/JSP-Servlet-Study/blob/master/08.%20Error%2C%20Exception%20처리%20기술/Images/Case3.gif)

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
    `isErrorPage`를 true로 설정한다. 편리하긴 하지만 각각의 에러에 대한 상세한 처리가 불가능하다.
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
    ![](https://github.com/juyonglee/JSP-Servlet-Study/blob/master/08.%20Error%2C%20Exception%20처리%20기술/Images/Case4.gif)






