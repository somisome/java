<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>pageContext Scope로부터 값 취득</h4>
<% 
 	MemberVO pageMemberInfo = (MemberVO)pageContext.getAttribute("pageMemberInfo");
	if(pageMemberInfo!=null){
%>
아이디: <%=pageMemberInfo.getMem_id() %><br>
패스워드: <%=pageMemberInfo.getMem_pass() %><br>
이름: <%=pageMemberInfo.getMem_name() %><br>
<%} %>

	<h4>request Scope로부터 값 취득</h4>
<% 
 	MemberVO reqMemberInfo = (MemberVO)pageContext.getAttribute("reqMemberInfo");
	if(reqMemberInfo!=null){
%>	
아이디: <%=reqMemberInfo.getMem_id() %><br>
패스워드: <%=reqMemberInfo.getMem_pass() %><br>
이름: <%=reqMemberInfo.getMem_name() %><br>
<%} %>
	
	<h4>session Scope로부터 값 취득</h4>
<% 
 	MemberVO sesMemberInfo = (MemberVO)session.getAttribute("sesMemberInfo");
%>	
아이디: <%=sesMemberInfo.getMem_id() %><br>
패스워드: <%=sesMemberInfo.getMem_pass() %><br>
이름: <%=sesMemberInfo.getMem_name() %><br>


	
	<h4>application Scope로부터 값 취득</h4>
<% 
 	MemberVO appMemberInfo = (MemberVO)application.getAttribute("appMemberInfo");
%>	
아이디: <%=appMemberInfo.getMem_id() %><br>
패스워드: <%=appMemberInfo.getMem_pass() %><br>
이름: <%=appMemberInfo.getMem_name() %><br>
	
</body>
</html>