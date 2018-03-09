<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	session.invalidate();
// 	String message = URLEncoder.encode("로그아웃 되었습니다.","UTF-8");
// 	response.sendRedirect(request.getContextPath()+"/12/main.jsp?message=로그아웃 되었습니다.");
// core 쓰면 따로 설정 안해줘도 한글 안깨짐
%>    

<c:redirect url="/12/main.jsp">
	<c:param  name="message" value="로그아웃 되었습니다."></c:param>
</c:redirect>
