<%--==============================================================
 * JSP 시작하는 수업(디렉티브, 디클러레이션, 스크립트릿, 익스프레션)
 * @author 윤소미
 * @since  2018.02.20.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.20.  윤소미      최초작성
 * Copyright (c) 2016 by DDIT  All right reserved
 * </pre>
===============================================================--%>

<!-- 디렉티브 : 해당 jsp(Java ServerSide Page)의 정의 부분
				&lt;%@ ... %&gt; 
-->
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  
	디클러레이션 :	해당 jsp내에 선언된 메서드 정의 부분.
				&lt;%! ... %&gt;
-->
<%! 
	private int calc(int i, int j){
		return i + j;
	}
%>
<!-- public void _jspService(final HttpServletRequest request, final HttpServletRespnse respnse){ 
여기서부터 마지막까지가 문자열로 표현되는 파트라고 생각하면 됨
-->
<!--  
	스크립트릿 :	해당 jsp의 비지니스 로직(자바코드)을 작성하는 부분
				&lt;% ... %&gt;
-->
<% 
	Date today = new Date(); 
	calc(1,1);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

</script>
</head>
<body>
<!--  
	익스프레션 :	해당 jsp 내 스크립트릿 영역에 선언된 변수를 활용해서 javascript, html 작성시 활용
				&lt;%= ... %&gt;
	디렉티브, 디클러레이션, 스크립트릿, 익스프레션 모두 서버에서 실행됨
	요청과 응답을 통해 html과 오간다 'ㅅ')?
	PHP, ASP, JSP
-->	
오늘의 날짜는 <%=today %> 입니다.<br />	
1+1은 <%=calc(1,1) %> 입니다.	<br />
<%-- 
	익셉션 : <% int i = 1/0; %>
--%>
</body>
</html>