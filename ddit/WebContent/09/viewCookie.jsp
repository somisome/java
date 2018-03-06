<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//클라이언트의 쿠키저장소에 저장된 쿠키는 해당 쿠키의 도메인, 경로 설정에 따라
	//클라이언트의 서버요청시 동반 전송.
	
	Cookie[] cookies = request.getCookies();
	for(Cookie cookie : cookies){
		out.println("쿠키 name: "+cookie.getName()+" | value: "+URLDecoder.decode(cookie.getValue(),"UTF-8"));
		out.print("<br>");
	}
	
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