<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.service.member.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.service.member.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String mem_id = request.getParameter("mem_id");
	String mem_pass = request.getParameter("mem_pass");
	
	Map<String, String> params = new HashMap<String,String>();
	params.put("mem_id",mem_id);	
	params.put("mem_pass",mem_pass);
	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.getMemberInfo(params);
	
	if(memberInfo==null){
		String msg = URLEncoder.encode("없는 회원입니다.","UTF-8");
		response.sendRedirect(request.getContextPath()+"/07/loginForm.jsp?msg="+msg);
	}else{
		response.sendRedirect(request.getContextPath()+"/07/main.jsp");
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