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
-->	
오늘의 날짜는 <%=today %> 입니다.<br />	
1+1은 <%=calc(1,1) %> 입니다.	<br />
<%-- 
	익셉션 : <% int i = 1/0; %>
--%>
</body>
</html>