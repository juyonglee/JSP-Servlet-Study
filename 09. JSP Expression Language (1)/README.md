# 10. JSP Expression Language (1)
## 1. Expression Language 기초 문법
1. Expression은 `식 (값을 의미)`이라고 통상적으로 지칭한다. 즉, 식을 중심으로 코드를 기술하는 언어를 의미한다.
    ```JSP
    ${age+1}
    <%= age+1 %>
    ```
2. EL식에 표함된 데이터는 `getAttribute()`또는 `setArribute()` 형태로 이용한다.
    - 요청 페이지
        ```JSP
        request.setAttribute("age", 10);
        ```
    - **Expression**을 사용한 응답 페이지
        ```JSP
        <%= request.getAttribute("age") %>
        ```
    - **EL**을 사용한 응답 페이지
        ```JSP
        ${age}
        ```
3. EL을 처리하는 순서는 `Container가 값을 찾는 순서`를 의미한다.

    |       |  개요  |  의미  |
    | :---: | :---: | :---: | 
    | page    | (1) ${pageScope.age} | 현재 화면을 의미 |
    | request | (2) ${requestScope.age} | 요청이 유효한 페이지를 의미 (A라는 곳에서 B라는 곳으로 넘어가는 경우) |
    | session | (3) ${sessionScope.age} | 세션이 유효한 페이지를 의미 (유지해야할 데이터가 있는 경우) |
    | application | (4) ${applicationScope.age} | Web Container 전체를 의미 |

### EL의 장점
1. Data의 Type을 알아서 처리해준다. 
2. 표현이 간결하다.
3. null인 상황에서도 에러가 발생하지 않는다.

## 2. Expression Language의 내장 객체
    |                  |  의미  |
    | :--------------: | :---: |
    | pageScope        | page attribute의 집합 (현재 페이지)|
    | requestScope     | request attribute의 집합 (요청이 유효한 페이지) |
    | sessionScope     | session attribute의 집합 (세션이 유효한 페이지) |
    | applicationScope | application attribute의 집합 (전체 페이지) |
    | param            | 웹 브라우저로부터 입력된 데이터의 집합 (request.getParameter("num01") = params.num01로 접근 가능) |
    | paramValues      | 웹 브라우저로부터 입력된 여러 개의 데이터집합 (Ex> checkbox) |
    | header           | HTTP 요청 메시지에 있는 HTTP 헤더의 집합 |
    | headerValues     | HTTP 요청 메시지에 있는 HTTP 헤더의 집합 (동일한 헤더가 여러 개 존재하는 경우) |
    | cookie           | 웹 브라우저로부터 전송된 쿠키의 집합 (Browser) |
    | initParam        | 웹 어플리케이션의 초기화 파라미터의 집합 (Servlet or JSP에 설정한 값) |
    | pageContext      | JSP페이지 환경 정보 집합 (web.xml에 설정한 값) |