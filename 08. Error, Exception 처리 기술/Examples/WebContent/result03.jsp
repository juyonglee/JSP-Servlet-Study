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