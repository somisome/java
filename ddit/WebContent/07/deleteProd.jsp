<%@page import="kr.or.ddit.service.prod.IProdServiceImpl"%>
<%@page import="kr.or.ddit.service.prod.IProdService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	
	String prod_id = request.getParameter("prod_id");
	Map<String,String> params = new HashMap<String,String>();
	params.put("prod_id",prod_id);
	
	IProdService service = IProdServiceImpl.getInstance();
	service.deleteProdInfo(params);
	
	response.sendRedirect(request.getContextPath()+"/07/main.jsp");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	