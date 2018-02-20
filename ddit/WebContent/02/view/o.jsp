<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
	String blood = request.getParameter("blood");
	String name = request.getParameter("name");
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>O</h4>
	<%=name %>님의 혈액형은 <%=blood %>형 이네요.<br><br>
	
	O형의 장점 :D<br>
 활동적, 강한 리더십, 온화함, 원만함<br><br>
	O형의 단점 :(<br>
고지식함, 생각없어 보임, 지나친 털털함, 거칠게 보임
	
	
	
</body>
</html>