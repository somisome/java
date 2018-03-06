<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//로그아웃시에 실행되어야 하는 비지니스 로직
	session.invalidate();
	String message = URLEncoder.encode("로그아웃 되었습니다.","UTF-8");
	response.sendRedirect(request.getContextPath()+"/05/loginForm.jsp?message="+message);
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>