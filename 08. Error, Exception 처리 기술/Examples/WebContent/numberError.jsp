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