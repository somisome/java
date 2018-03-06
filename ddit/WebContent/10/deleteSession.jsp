<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
//	* 세션은 설정된 만료시간(Apache Tomcat 서버 : default 30분) 내 클라이언트로부터 요청이 전무하면 해당 세션이 삭제
//	* session.invalidate()코드를 통해서 해당 세션이 삭제(될 수 있다.) 
//	* session.setMaxInactiveInterval(0 또는 음수) : 즉시 삭제 
// 	session.setMaxInactiveInterval(0);	

// 	MemberVO memberInfo = (MemberVO)session.getAttribute("LOGIN_MEMBERINFO");
	//세션은 유지되고, 세션내에 저장된 값만 삭제
// 	session.removeAttribute("LOGIN_MEMBERINFO");
	
	//클라이언트 ---> logout.jsp 요청할 때 
	//				session.invalidate(); 해줌
	session.invalidate();	

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