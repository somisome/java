<%--==============================================================
 * pageContext, request, session, application setAttribute 및 forward
 * @author 윤소미
 * @since  2018.02.21.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.21.  윤소미      최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
===============================================================--%>

<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.service.member.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.service.member.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- public void _jspService(request,response){ -->
<c:param name="mem_id" value="a001"></c:param>
<c:param name="mem_pass" value="asdfasdf"></c:param>
<% 
	Map<String, String> params = new HashMap<String, String>();
	params.put("mem_id","a001");
	params.put("mem_pass","asdfasdf");
	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.getMemberInfo(params);
	//				bloodTypeResult.jsp?bloodType=A
	//	브라우저 ------------------------------------------->	서버
	//														 bloodTypeResult.jsp
	//														 	request.getParameter("bloodType"); A라는 값 리턴
	//														|<--포워딩(a.jsp);
	//														|-->a.jsp
	//														 	request.getParameter("bloodType"); jsp가 달라도 포워딩할때는 가져올 수 있음
	//			<--------------------------------------------	컨텐츠
	
	
	//기본객체 중 저장영역(Scope)을 포함하는 네개의 기본객체
	//	PageContext : jsp한개당 하나가 할당.
	//	Request		: 리다이렉트 요청시에는 항상 새롭게 생성
	//				  포워딩 요청시에는 재활용.
	//	session		: 최초 리다이렉트 요청시 생성되어 세션 만료시간까지 유지.
	//	application	: 해당 웹 어플리케이션이 서비스 시작될 때 생성되어 서비스가 정지되면 삭제.
	//	저장역역 접근 공통 메서드:
	//			저장 - setAttribute(키, 값); Object 타입으로 저장
	//			취득 - getAttribute(키);  Object 타입으로 반환
	//			삭제 - removeAttribute(키);
	//			갱신 - setAttribute(동일키, 다른값);
	
	pageContext.setAttribute("pageMemberInfo", memberInfo );
// 	MemberVO returnValue =  (MemberVO)pageContext.getAttribute("pageMemberInfo");
// 	pageContext.removeAttribute("pageMemberInfo");
	request.setAttribute("reqMemberInfo", memberInfo);
	session.setAttribute("sesMemberInfo", memberInfo);
	application.setAttribute("appMemberInfo",memberInfo);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("/03/forwardRequest2.jsp");
	dispatcher.forward(request,response );
	
%>



<!-- } -->