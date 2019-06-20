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
| :---: |
|![](https://github.com/juyonglee/JSP-Servlet-Study/blob/master/10.%20JSP%20Expression%20Language%20(2)/Images/Case1.png) |
| [예제코드](https://github.com/juyonglee/JSP-Servlet-Study/tree/master/10.%20JSP%20Expression%20Language%20(2)/Examples/Example01) |


## 2. 정적 메소드 호출
- **[Step01]** Class 및 정적 메소드 생성 **(Static 메소드로 생성해야 한다!)**
    ```Java
    package juyonglee;
    
    public class JUYONGLEE {
        public static String hello(String name) {
            return "Hello, " + name + "님!";
        }
    }
    ```
- **[Step02]** **taglib** 생성
    ```xml
    <?xml version="1.0" encoding="UTF-8"?>
    <taglib>
	    <tlib-version>1.0</tlib-version>
	    <jsp-version>2.2</jsp-version>
	    <short-name>my</short-name>
	    <function>
		    <name>greeting</name>
		    <function-class>juyonglee.JUYONGLEE</function-class>
		    <function-signature>java.lang.String hello(java.lang.String)</function-signature>
	    </function>
    </taglib>
    ```
- **[Step03]** **taglib** 사용 
    ```JSP
    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/WEB-INF/tlds/juyonglee.tld" prefix="jyl"%>
    <h2>사용자 정의 태그 라이브러리 (정적메소드)</h2>
    ${jyl:greeting("소주용")}
    ```

### 예제 2. 정적 메소드 사용 예

| [예제] JUYONGLEE.java, juyonglee.tld, index.jsp |
| :---: |
|![](https://github.com/juyonglee/JSP-Servlet-Study/blob/master/10.%20JSP%20Expression%20Language%20(2)/Images/Case2.png) |
| [예제코드](https://github.com/juyonglee/JSP-Servlet-Study/tree/master/10.%20JSP%20Expression%20Language%20(2)/Examples/Example02) |