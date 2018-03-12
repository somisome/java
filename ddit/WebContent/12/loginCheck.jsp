<%--==============================================================
 * 로그인 정보 (아이디, 패스워드) 체크
 * @author 윤소미
 * @since  2018.03.09.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.09.  윤소미      최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
===============================================================--%>

<%@page import="kr.or.ddit.utils.CryptoGenerator"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.service.member.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.service.member.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mem_id = request.getParameter("mem_id");
	mem_id=CryptoGenerator.decryptoRSA(session, mem_id);
	String mem_pass = request.getParameter("mem_pass");
	mem_pass=CryptoGenerator.decryptoRSA(session, mem_pass);
	
	Map<String, String> params=new HashMap<String,String>();
	
	params.put("mem_id",mem_id);
	params.put("mem_pass",mem_pass);
	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.getMemberInfo(params);
	
	String message = "";
	if(memberInfo == null){
		message = URLEncoder.encode("회원이 아닙니다","UTF-8");
	}else{
		session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
		message = URLEncoder.encode(memberInfo.getMem_name()+"님, 환영합니다.","UTF-8");
	}
	response.sendRedirect(request.getContextPath()+"/12/main.jsp?message="+message);
	
%>