<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num01 = (int) request.getAttribute("NUM01");
	int num02 = (int) request.getAttribute("NUM02");
	int sum = (int) request.getAttribute("SUM");
%>
<%=num01%>+<%=num02%>의 결과는 <%=sum%>입니다.

<h3>EL로 변경한 경우</h3>
<!-- EL의 장점: Type을 알아서 맞춰준다. 표현이 간결, Null인 상황에서도 에러가 없다! -->
${NUM01} + ${NUM02}의 결과는 ${SUM}입니다.

<!-- EL은 식을 대변! -->
<!-- 식이라는 건 결국 값이다. -->
<!-- View 표현할 때는 강력하지만 연산을 수행할 경우 EL 자체만으로는 한계가 존재한다. -->
<h3>EL의 내장 객체를 이용하는 경우</h3>
${param.num01} + ${param.num02}의 결과는 ${SUM} 