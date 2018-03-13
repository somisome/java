<%@page import="kr.or.ddit.service.buyer.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.service.buyer.IBuyerService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	
	String buyer_id = request.getParameter("buyer_id");
	Map<String,String> params = new HashMap<String,String>();
	params.put("buyer_id",buyer_id);
	IBuyerService service = IBuyerServiceImpl.getInstance();
	service.deleteBuyerInfo(params);
	response.sendRedirect(request.getContextPath()+"/08/main.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	