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
    - Expression을 사용한 응답 페이지
        ```JSP
        <%= request.getAttribute("age") %>
        ```
    - EL을 사용한 응답 페이지
        ```JSP
        ${age}
        ```
3. EL을 처리하는 순서는 `Container가 값을 찾는 순서`를 의미한다.
    |       |  개요  |  의미  |
    | :---: | :---: | :---: | 
    | page    | (1) ${pageScope.age} | 현재 화면을 의미 |
    | request | (2) ${requestScope.age} | 요청이 유효한 페이지를 의미 (A라는 곳에서 B라는 곳으로 넘어가는 경우) |
    | session | (3) ${sessionScope.age} | 세현이 유효한 페이지를 의미 (유지해야할 데이터가 있는 경우) |
    | application | (4) ${applicationScope.age} | Web Container 전체를 의미 |