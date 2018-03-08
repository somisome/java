<%--==============================================================
 * JSP로 구구단 전체 출력
 * @author 윤소미
 * @since  2018.02.20.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.20.  윤소미      최초작성
 *    2018.03.08.  윤소미      jstl 활용 수정
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%-- <%!
	private int multiple(int i, int j){
	return i*j;
	}
%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>구구단</h4>
	<c:forEach var="i" begin="2" end="9">
			${i }단<br>
		<c:forEach var="j" begin="1" end="9">
			${i } * ${j } = ${i*j } <br>			
		</c:forEach>
		<hr>
	</c:forEach>
	
<%-- 	<% 
		for(int i=2; i<10; i++){
			for(int j=1; j<10; j++){
	%>
				<%=i %> * <%=j %> = <%= multiple(i,j) %><br />
	<%			
			}
		}
	%>	
	 --%>
</body>
</html>