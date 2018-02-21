<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String blood = request.getParameter("blood");
		//String name = request.getParameter("name");
		String name = URLEncoder.encode(request.getParameter("name"),"UTF-8");
		if(blood.equals("A")){
			response.sendRedirect("view/a.jsp?blood=A&name="+name+"");					
		}else if(blood.equals("B")){
			response.sendRedirect("view/b.jsp?blood=B&name="+name+"");					
		}else if(blood.equals("AB")){
			response.sendRedirect("view/ab.jsp?blood=AB&name="+name+"");					
		}else if(blood.equals("O")){
			response.sendRedirect("view/o.jsp?blood=O&name="+name+"");					
		}
	%>
	
<!-- 	혈액형취득 -->
<!-- 	A=> /02/view/a.jsp 리다이렉트(response.sendRedirect(URI)) -->
<!-- 		이름님의 혈액형은 ??타입이고, blah blah... -->
<!-- 	B=> /02/view/b.jsp 리다이렉트(response.sendRedirect(URI)) -->
<!-- 	AB=> /02/view/ab.jsp 리다이렉트(response.sendRedirect(URI)) -->
<!-- 	O=> /02/view/o.jsp 리다이렉트(response.sendRedirect(URI)) -->
</body>
</html>