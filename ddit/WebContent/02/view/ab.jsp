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
	<h4>AB</h4>
	<%=name %>님의 혈액형은 <%=blood %>형 이네요.<br><br>
	
	AB형의 장점 :D<br>
	장점	냉철함, 예리함, 합리적<br><br>
	AB형의 단점 :(<br>
	4차원적, 정신이상자로 보임, 변태 같아 보임
	
	

	
</body>
</html>