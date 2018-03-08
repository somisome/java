<%--==============================================================
 * JSP로 요청한 단의 값을 받아 구구단 출력
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

<!--  
	Jasper 엔진 : gugudanResult.jsp 요청시
				gugudanResult_jsp.java(서블릿)
				gugudanResult_jsp.class
	public final class gugudanResult_jsp extends HttpJspBase{
		public void _jspService(HttpServletRequest request, HttpServletResponse response){
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!-- http://localhost/ddit/01/gugudanResult.jsp?dan=5 -->

<%-- <% 
	String dan = request.getParameter("dan");
%>
<%!
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
	<c:set var="ii" value="${param.dan }"></c:set>
	<fmt:parseNumber var="i" type="number" value="${param.dan } }"> </fmt:parseNumber>			
	<h3>${i }단</h3>
	
	<c:forEach var="j" begin="1" end="9">
		${i } * ${j } = ${i*j } <br>
	</c:forEach>
	
	
	
	<%-- 
	<% 
			for(int j=1; j<10; j++){
				int i= Integer.parseInt(dan);
	%>
				<%=i %> * <%=j %> = <%= multiple(i,j) %><br />
	<%			
			}
	%>	 --%>
	
	
	
	
</body>
</html>
<!--  
	}
}
-->

