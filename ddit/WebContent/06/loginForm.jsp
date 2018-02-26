<%--==============================================================
 * 회원관리 연습 - 로그인페이지
 * @author 윤소미
 * @since  2018.02.26.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.26.  윤소미      최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/admin.css" type="text/css">
<title>회원관리 관리자 로그인</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/validation.js"></script>
<script>
$(function(){
	//validation
	$('.loginBtn').on('click',function(){
		if(!$('input[name=mem_id]').val().validationID()){
			alert("양식에 맞지 않는 아이디입니다.");
			return;
		}
		if(!$('input[name=mem_pass]').val().validationPWD()){
			alert("양식에 맞지 않는 패스워드입니다.");
			return;
		}
		var $subForm = $('<form method="POST" action="/ddit/06/idpwCheck.jsp"></form>');
		var $id = $('<input type="hidden" name="mem_id" value="'+$('input[name=mem_id]').val()+'"/>');
		var $pass = $('<input type="hidden" name="mem_pass" value="'+$('input[name=mem_pass]').val()+'"/>');
		
		$subForm.append($id);
		$subForm.append($pass);
		$(document.body).append($subForm);
		
		$subForm.submit();
	});
	
	//없는 회원일 때, idpwCheck.jsp에서 받은 alert(msg)
	//로그아웃 했을때 alert('로그아웃메세지')
	if('<%=request.getParameter("msg")%>'!='null'){
		alert('<%=request.getParameter("msg")%>');
	}
	
});
</script>
</head>
<body>
	<table width="770" border="0" align="center" cellpadding="0"
		cellspacing="0" style="margin: 90px;">
		<tr>
			<td height="150" align="center"><img src="${pageContext.request.contextPath }/image/p_login.gif" /></td>
		</tr>
		<tr>
			<td height="174"
				style="background: url(${pageContext.request.contextPath }/image/login_bg.jpg); border: 1px solid #e3e3e3;">
				<table width="100%" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td width="260" height="110" align="center"
							style="border-right: 1px dotted #736357;">
							<img src="${pageContext.request.contextPath }/image/logo.jpg" />
						</td>
						<td>
							<table border="0" align="center" cellpadding="5"
								cellspacing="0">
								<tr>
									<td><b>아이디</b></td>
									<td><input type="text" name="mem_id" class="box" tabindex="3" height="18" /></td>
									<td rowspan="2">
										<img src="${pageContext.request.contextPath }/image/login.gif" class="loginBtn"/>
									</td>
								</tr>
								<tr>
									<td><b>패스워드</b></td>
									<td><input type="password" name="mem_pass" class="box" tabindex="3" height="18" /></td>
								</tr>
								<tr>
									<td colspan="3" align="right"><a href="<%=request.getContextPath()%>/06/main.jsp?contentPart=/06/memberForm.jsp">회원가입을 원하세요??</a></td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
