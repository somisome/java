<%@page import="kr.or.ddit.service.prod.IProdServiceImpl"%>
<%@page import="kr.or.ddit.service.prod.IProdService"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	
	ProdVO prodInfo = new ProdVO();
	
	BeanUtils.populate(prodInfo, request.getParameterMap());
	IProdService service = IProdServiceImpl.getInstance();
	service.updateProdInfo(prodInfo);
	response.sendRedirect(request.getContextPath()+"/07/main.jsp");
	
%>    
