<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	
	Cookie[] cookies = request.getCookies();
	for(Cookie cookie : cookies){
		if("mem_id".intern()==cookie.getName().intern()){
			//쿠키갱신
			Cookie idCookie = new Cookie("mem_id","b001");
			idCookie.setPath("/");
			//유효시간설정 : default -1(브라우저 종료시 해당 쿠키 삭제)
			//				초단위설정
			//				0(즉시삭제)
			idCookie.setMaxAge(0);
			response.addCookie(idCookie);
		}
	}
	
%>       
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
쿠키가 삭제되었습니다 o_O
</body>
</html>