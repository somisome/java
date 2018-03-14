<%@page import="kr.or.ddit.utils.FileUploadRequestWrapper"%>
<%@page import="kr.or.ddit.service.freeboard.IFreeboardServiceImpl"%>
<%@page import="kr.or.ddit.service.freeboard.IFreeboardService"%>
<%@page import="kr.or.ddit.vo.FreeboardVO"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	FileUploadRequestWrapper wrapper = (FileUploadRequestWrapper)request;	

	FreeboardVO freeboardInfo = new FreeboardVO();

	BeanUtils.populate(freeboardInfo, wrapper.getParameterMap());
	
	IFreeboardService service = IFreeboardServiceImpl.getInstance();
	service.insertFreeboardInfo(freeboardInfo, wrapper.getFileItemValues("files"));
	
	
	response.sendRedirect(request.getContextPath()+"/12/main.jsp");
%>    