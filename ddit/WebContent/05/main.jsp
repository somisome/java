<%--==============================================================
 * 회원관리 연습 - main 페이지
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
<% 
	//			?contentPage=/05/memberForm.jsp
	//			/05/memberView.jsp
	//			/05/memberList.jsp
	String contentPage = request.getParameter("contentPage");
	if(contentPage==null){
		contentPage="/05/memberList.jsp";
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.indigo-pink.min.css">
<script
	src="https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">
.mdl-layout__container {
	width: 240px;
}
</style>
</head>
<body>
<!--  
	http://localhost/ddit/05/main.jsp
							응답 객체 <= 컨텐츠 저장
							응답 객체 <= jsp:include page=다른 jsp로 포워딩 후 취득한 
										컨텐츠를 저장
							응답 객체 <= 컨텐츠 저장
							응답 객체 <= jsp:include page=다른 jsp로 포워딩 후 취득한 
										컨텐츠를 저장
							
-->
<center>
	<div id="wrap">
		<div id="header">
			<jsp:include page="./layout/header.jsp" />
<%-- 			일부만 해당 jsp에서 가져오고 싶을 때 if문 쓰고 <jsp:param value="5" name="dan"/> --%>
		</div>
		<p style="clear: both;"></p>
		<div>
			<div class="left">
				<jsp:include page="./layout/left.jsp" />
			</div>
			<div id="content" style="height: 600px; margin-left: 250px; overflow: scroll;">
				<jsp:include page="<%=contentPage %>" />
<%-- 				<jsp:include page="memberList.jsp" /> --%>
<%-- 				<jsp:include page="/05/memberList.jsp" /> --%>
<%-- 				<jsp:include page="memberView.jsp" /> --%>
<%-- 				<jsp:include page="memberForm.jsp" /> --%>
			</div>
		</div>
		<div>
			<jsp:include page="./layout/footer.jsp" />
		</div>
	</div>
</center>
</body>
</html>









