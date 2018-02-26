<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.service.member.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.service.member.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	MemberVO memberInfo = new MemberVO();
	BeanUtils.populate(memberInfo, request.getParameterMap());
	IMemberService service = IMemberServiceImpl.getInstance();
	service.updateMemberInfo(memberInfo);
	
	response.sendRedirect(request.getContextPath()+"/06/main.jsp");
	
%>    
