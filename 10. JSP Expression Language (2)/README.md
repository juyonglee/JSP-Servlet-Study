# 10. JSP Expression Language (2)
## 1. Expression 연산자
|       |  개요  |  의미  |
| :---: | :---: | :---: | 
| 산술연산자 | +, -, *, /, % | 덧셈, 뺄셈, 곱셈, 나눗셈, 나머지 |
| 비교연산자 | <, >, <=, >=, ==, != | 크기비교 연산 |
| 논리연산자 | && (and), \|\| (or), ! (not) | 논리적인 연산 |
| 조건연산자 | ?: | 조건에 따라 두 값 중 하나를 선택 |
| empty 연산자 | empty | 데이터의 존재 유무 여부 |
| `대괄호`와 `마침표` 연산자 | [], . | 집합 데이터에 있는 한 항목을 선택 |
| 괄호연산자 | () | 연산자의 우선순위 지정 |
### 예제 1. Expression 연사자 사용 예 (index.jsp)
```html
<!-- \을 사용하면 EL을 확인할수 있다! -->
<tbody>
    <tr>
        <td>+</td>
		<td>\${10+3} = ${10+3}</td>
	</tr>
	<tr>
		<td>-</td>
		<td>\${10-3} = ${10-3}</td>
	</tr>		
	<tr>
		<td>&lt</td>
		<td>\${10<3} = ${10<3}</td>
	</tr>		
	<tr>
		<td>?:</td>
		<td>\${10>3? "10이 3보다 크다." : "10이 3보다 작다."} = ${10>3? "10이 3보다 크다." : "10이 3보다 작다."}</td>
	</tr>
</tbody>
```

| [예제] index.jsp |
| --- |
|![](https://github.com/juyonglee/JSP-Servlet-Study/blob/master/10.%20JSP%20Expression%20Language%20(2)/Images/Case1.png) |
| [예제코드](https://github.com/juyonglee/JSP-Servlet-Study/tree/master/10.%20JSP%20Expression%20Language%20(2)/Examples/Example01) |