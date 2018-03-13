<%--==============================================================
 * 브라우저 요청과 응답구조, 헤더 정보
 * @author 윤소미
 * @since  2018.02.20.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.20.  윤소미      최초작성
 *    2018.03.13.  윤소미     	 el수정
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  
	브라우저 요청과 응답 구조:	요청라인 - 요청시의 프로토콜 정보, URI 등
						 	요청헤더 - 클라이언트 종류, 요청 지역, 클라이언트의 응답대기 상태 등
						 	요청본문 - 전송방식 POST에 서버로 전송되는 파라메터 값
						 	응답라인 - 해당 요청의 서버 처리 상태, 프로토콜 정보
						 	응답헤더 - 응답 컨텐츠 타입, 처리시간 등
						 	응답본문 - 클라이언트로 전송되는 컨텐츠					 	
-->
<% 
	response.setHeader("Refresh","1");
%>
	현재시간 : <%=new Date() %><br>
	<hr>
	클라이언트 주소: ${pageContext.request.remoteAddr}<br>
	요청시 파라메터 사이즈 : ${pageContext.request.contentLength }<br>
	요청시 프로토콜 : ${pageContext.request.protocol}<br>
	URL : ${pageContext.request.requestURL}<br>
	URI : ${pageContext.request.requestURI}<br>
	컨텍스트 패스|루트 :  ${pageContext.request.contextPath}<br>
	서블릿 패스 :  ${pageContext.request.servletPath}<br>
	전송방식 :  ${pageContext.request.method}<br>
	User-Agent:  ${header["User-Agent"]}<br>
	Accept: ${header["Accept"] }<br>
</body>
</html>