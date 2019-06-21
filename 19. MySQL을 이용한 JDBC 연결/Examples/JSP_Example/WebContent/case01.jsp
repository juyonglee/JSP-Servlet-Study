<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	Connection con = null;

	public void jspInit() {
		try {
			String serverUrl = "jdbc:mysql://localhost:3306/world?useSSL=false";
			String userID = "juyonglee";
			String userPW = "1234";
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(serverUrl, userID, userPW);
			System.out.println("연결 성공!");
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("연결 실패!");
		}
	}

	public void jspDestory() {
		if(con != null) {
			try {
				con.close();
				System.out.println("연결 종료 성공!");
			} catch(Exception e) {
				e.printStackTrace();
				System.out.println("연결 종료 실패!");
			}
		}
	}
%>

JSP를 이용한 MySQL 연결 예제