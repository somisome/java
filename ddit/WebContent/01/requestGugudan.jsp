<%--==============================================================
 * JSP로 요청한 단의 구구단 출력
 * @author 윤소미
 * @since  2018.02.20.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.20.  윤소미      최초작성
 * Copyright (c) 2016 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	구구단을 선택해주세요<br/>
<!-- http://localhost/ddit/01/gugudanResult.jsp?dan=5 -->	
<!-- 		select[name=dan]>option[value=$]*9^input[type=button value=전송] -->
<!-- form[name=gugudanForm action='/ddit/01/gugudanResult.jsp'] -->
	<form action="/ddit/01/gugudanResult.jsp" name="gugudanForm">
	<select name="dan" id="">
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>
		<option value="6">6</option>
		<option value="7">7</option>
		<option value="8">8</option>
		<option value="9">9</option>
	</select><input type="submit" value="전송" />
	</form>
</body>
</html>