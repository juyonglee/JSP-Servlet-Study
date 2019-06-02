<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/error02.jsp"%>
<%
	String user_age = request.getParameter("user_age");
	int age = Integer.parseInt(user_age);
	out.print("사용자의 나이는 " + age + "살입니다.");
%>