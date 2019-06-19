<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Scope를 이용하여 변수의 범위를 설정 (request까지 유효하도록 설정) -->
<c:set var="n1" value="${param.num01}" scope="request"></c:set>
<c:set var="n2" value="${param.num02}" scope="request"></c:set>
<c:choose>
	<c:when test="${n1}=='10'">
		<%
			System.out.println("True State!!");
		%>
	</c:when>
	<c:otherwise>
		<%
			System.out.println("False State!!");
		%>
	</c:otherwise>
</c:choose>
<jsp:forward page="result.jsp"></jsp:forward>