<%@page import="kr.or.ddit.service.member.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.service.member.IMemberService"%>
<%@page import="org.apache.commons.beanutils.BeanUtils"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	
	MemberVO memberInfo = new MemberVO();
	BeanUtils.populate(memberInfo, request.getParameterMap());
	IMemberService service = IMemberServiceImpl.getInstance();
	service.insertMemberInfo(memberInfo);
	
	response.sendRedirect(request.getContextPath()+"/07/main.jsp");
	
%>    