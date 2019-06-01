<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String user_age = request.getParameter("user_age");
	// NumberFormatException 예외가 발생 시 에러에 대응할 수 없다.
	int age = Integer.parseInt(user_age);	
	out.print("사용자의 나이는 " + age + "살입니다.");
%>