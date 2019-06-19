<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num01 = (int) request.getAttribute("NUM01");
	int num02 = (int) request.getAttribute("NUM02");
	int sum = (int) request.getAttribute("SUM");
	String agent = request.getHeader("user-agent");
%>
<h3>Expression을 이용한 경우</h3>
<%=num01%> + <%=num02%>의 결과는 <%=sum%>입니다.

<h3>EL을 이용한 경우</h3>
${NUM01} + ${NUM02}의 결과는 ${SUM}입니다.

<h3>EL의 내장 객체를 이용한 경우</h3>
${param.num01} + ${param.num02}의 결과는 ${SUM}입니다.

<h3>EL 내장 객체를 이용하여 Header 정보 추출</h3>
${header}
<br>
<hr>
User Agent 정보: <%= agent %>