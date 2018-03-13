<%--==============================================================
 * 혈액형, 이름 받은 후 해당 혈액형페이지로 리다이렉트
 * @author 윤소미
 * @since  2018.02.20.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.20.  윤소미      최초작성
 *    2018.03.13.  윤소미      el수정
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="blood" value="${param.blood}"></c:set>
<c:set var="name" value="${param.name}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:if test="${blood=='A'}">
		<c:redirect url="view/a.jsp">
			<c:param name="name" value="${name}"></c:param>
			<c:param name="blood" value="${blood}"></c:param>
		</c:redirect>	
	</c:if>
	<c:if test="${blood=='B'}">
		<c:redirect url="view/b.jsp">
			<c:param name="name" value="${name}"></c:param>
			<c:param name="blood" value="${blood}"></c:param>
		</c:redirect>	
	</c:if>
	<c:if test="${blood=='AB'}">
		<c:redirect url="view/ab.jsp">
			<c:param name="name" value="${name}"></c:param>
			<c:param name="blood" value="${blood}"></c:param>
		</c:redirect>	
	</c:if>
	<c:if test="${blood=='O'}">
		<c:redirect url="view/o.jsp">
			<c:param name="name" value="${name}"></c:param>
			<c:param name="blood" value="${blood}"></c:param>
		</c:redirect>	
	</c:if>
	
	
	
	
	
<!-- 	혈액형취득 -->
<!-- 	A=> /02/view/a.jsp 리다이렉트(response.sendRedirect(URI)) -->
<!-- 		이름님의 혈액형은 ??타입이고, blah blah... -->
<!-- 	B=> /02/view/b.jsp 리다이렉트(response.sendRedirect(URI)) -->
<!-- 	AB=> /02/view/ab.jsp 리다이렉트(response.sendRedirect(URI)) -->
<!-- 	O=> /02/view/o.jsp 리다이렉트(response.sendRedirect(URI)) -->
</body>
</html>