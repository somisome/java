<%--==============================================================
 * error발생시 정의된 errorPage로 포워드 연습
 * @author 윤소미
 * @since  2018.02.22.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.22.  윤소미      최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
===============================================================--%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="/error/errorCtrl.jsp" isErrorPage="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- false가 디폴트값  
	isErrorPage="false" : jsp 내에서 발생된 익셉션을 처리하기 위해 기본객체 exception을 활용할 수 없는 jsp.
	errorPage : 해당 jsp 내에서 발생된 익셉션을 처리하는 isErrorPage="true"가 선언된 특정 jsp로의 포워딩 설정.
	
-->
<% 
	//블랙홀 : 부피 0, 밀도 무한대
	int i = 1/0;
	
	//errorCtrl.jsp로 포워드
	//익셉션 발생 자원: java.lang.ArithmeticException
	//익셉션 메세지: / by zero
%>
</body>
</html>