<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		width: 100%;
		text-align: center;
	}
	.title {
		width: 100px;
	}
</style>
</head>
<body>
	<table border="1">
		<thead>
			<tr>
				<td class="title">연산자</td>
				<td>예시</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>+</td>
				<!-- \을 사용하면 EL을 확인할수 있다! -->
				<td>\${10+3} = ${10+3}</td>
			</tr>
			<tr>
				<td>-</td>
				<td>\${10-3} = ${10-3}</td>
			</tr>
			<tr>
				<td>*</td>
				<td>\${10*3} = ${10*3}</td>
			</tr>
			<tr>
				<td>/</td>
				<td>\${10/3} = ${10/3}</td>
			</tr>
			<tr>
				<td>%</td>
				<td>\${10%3} = ${10%3}</td>
			</tr>
			<tr>
				<td>&lt</td>
				<td>\${10<3} = ${10<3}</td>
			</tr>
			<tr>
				<td>==</td>
				<td>\${10 == 3} = ${10 == 3}</td>
			</tr>
			<tr>
				<td>&&</td>
				<td>\${(10<100) && (20<100)} = ${(10<100) && (20<100)}</td>
			</tr>
			<tr>
				<td>?:</td>
				<td>\${10>3? "10이 3보다 크다." : "10이 3보다 작다."} = ${10>3? "10이 3보다 크다." : "10이 3보다 작다."}</td>
			</tr>
		</tbody>
	</table>
</body>
</html>