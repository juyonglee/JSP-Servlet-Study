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