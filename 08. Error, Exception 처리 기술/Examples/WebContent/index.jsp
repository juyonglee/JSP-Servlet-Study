<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 처리</title>
</head>
<body>
	<div>
		<h3>나이 입력 [예외 처리 X]</h3>
		<form action="/Error_Handling_Example/result01.jsp" method="get">
			<input type="text" name="user_age" placeholder="나이를 입력해 주세요.">
			<input type="submit" value="전송">
		</form>
	</div>
	<div>
		<h3>나이 입력 [예외 처리 적용]</h3>
		<form action="/Error_Handling_Example/result02.jsp" method="get">
			<input type="text" name="user_age" placeholder="나이를 입력해 주세요.">
			<input type="submit" value="전송">
		</form>
	</div>
	<div>
		<h3>나이 입력 [예외 처리 적용 - RequestDispatcher]</h3>
		<form action="/Error_Handling_Example/result03.jsp" method="get">
			<input type="text" name="user_age" placeholder="나이를 입력해 주세요.">
			<input type="submit" value="전송">
		</form>
	</div>
	<div>
		<h3>나이 입력 [예외 처리 적용 - errorPage]</h3>
		<form action="/Error_Handling_Example/result04.jsp" method="get">
			<input type="text" name="user_age" placeholder="나이를 입력해 주세요.">
			<input type="submit" value="전송">
		</form>
	</div>
</body>
</html>