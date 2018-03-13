<%@page import="kr.or.ddit.service.buyer.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.service.buyer.IBuyerService"%>
<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	
	BuyerVO buyerInfo = new BuyerVO();	
	
	BeanUtils.populate(buyerInfo, request.getParameterMap());
	IBuyerService service = IBuyerServiceImpl.getInstance();
	service.updateBuyerInfo(buyerInfo);
	response.sendRedirect(request.getContextPath()+"/08/main.jsp");
	
%>    
