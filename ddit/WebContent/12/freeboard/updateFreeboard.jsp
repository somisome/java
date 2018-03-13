<%@page import="kr.or.ddit.service.freeboard.IFreeboardServiceImpl"%>
<%@page import="kr.or.ddit.service.freeboard.IFreeboardService"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.vo.FreeboardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	

	FreeboardVO freeboardInfo = new FreeboardVO();

	BeanUtils.populate(freeboardInfo, request.getParameterMap());
	
	IFreeboardService service = IFreeboardServiceImpl.getInstance();
	service.updateFreeboardInfo(freeboardInfo);
	
	response.sendRedirect(request.getContextPath()+"/12/main.jsp");
%>    