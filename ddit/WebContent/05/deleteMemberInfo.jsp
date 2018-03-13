<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="kr.or.ddit.service.member.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.service.member.IMemberService"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	
	
	String mem_id=request.getParameter("mem_id");
	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id",mem_id);
	
	IMemberService service = IMemberServiceImpl.getInstance();
	service.deleteMemberInfo(params);
	
	response.sendRedirect(request.getContextPath()+"/05/main.jsp");
%>
