<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/ddit/02/bloodTypeResult.jsp" name="bloodForm">
	이름: <input type=text name="name"><br>
	<select name="blood" id="">
		<option value="A">A</option>
		<option value="B">B</option>
		<option value="AB">AB</option>
		<option value="O">O</option>
	</select><input type="submit" value="전송" />
	</form>
	
	

<!-- 이름 -->
<!-- 셀렉트태그 -->
<!-- 옵션A -->
<!-- 옵션B -->
<!-- 옵션AB -->
<!-- 옵션O -->
<!-- 서브밋 -->

</body>
</html>