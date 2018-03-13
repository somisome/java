<%--==============================================================
 * 혈액형 선택 및 이름입력, 전송
 * @author 윤소미
 * @since  2018.02.20.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.20.  윤소미      최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
===============================================================--%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

response.setCharacterEncoding("UTF-8");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/ddit/02/bloodTypeResult.jsp" name="bloodForm">
	이름: <input type=text name="name"><br>
	<select name="blood" id="">
		<option value="A">A</option>
		<option value="B">B</option>
		<option value="AB">AB</option>
		<option value="O">O</option>
	</select><input type="submit" value="전송" />
	</form>
	
	

<!-- 이름 -->
<!-- 셀렉트태그 -->
<!-- 옵션A -->
<!-- 옵션B -->
<!-- 옵션AB -->
<!-- 옵션O -->
<!-- 서브밋 -->

</body>
</html>