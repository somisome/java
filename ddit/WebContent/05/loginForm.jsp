<%--==============================================================
 * 회원관리 연습 - 로그인페이지
 * @author 윤소미
 * @since  2018.02.22.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.22.  윤소미      최초작성
 *    2018.03.06.  윤소미      체크박스추가(쿠키)
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
<!-- <script type="text/javascript" src="/ddit/js/validation.js"></script> -->
<script type="text/javascript" src="<%=request.getContextPath() %>/js/validation.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/cookieControl.js"></script>
<script>
	$(function(){
		//자바스크립트 내에 익스프레션 선언할때는 "" 또는 ''으로 익스크페션을 랩핑해야 함.
		if('<%=request.getParameter("message") %>'!='null'){
			alert('<%=request.getParameter("message") %>');
		}
		cookieId = Get_Cookie('mem_id');
		if(cookieId!=null){
			$('input[name=mem_id]').val(cookieId);
			$('input[name=saveCookie]').prop('checked',true);
		}
		
		$('.loginBtn').click(function(){
			if($('input[name=saveCookie]').is(':checked')){
				Set_Cookie('mem_id',$('input[name=mem_id]').val()); 
			}
			if(!$('input[name=saveCookie]').is(':checked')){
				Delete_Cookie('mem_id'); 
			}
			
			if(!$('input[name=mem_id]').val().validationID()){
				alert("아이디를 바르게 입력해주세요.");
				return;
			}			
			if(!$('input[name=mem_pass]').val().validationPWD()){
				alert("패스워드를 바르게 입력해주세요.");
				return;
			}
			/* 보안상 추천하지 않는 get방식...
			location.href='/ddit/05/loginCheck.jsp?mem_id='+$('input[name=mem_id]').val()+'&mem)pass='+$('input[name=mem_pass]').val();//get방식
			location.replace('/ddit/05/loginCheck.jsp');//get방식
			*/
			var $frm = $('<form method="POST" action="/ddit/05/loginCheck.jsp"></form>');
			var $iptID = $('<input type="hidden" name="mem_id" value="'+$('input[name=mem_id]').val()+'"/>');
			var $iptPWD = $('<input type="hidden" name="mem_pass value="'+$('input[name=mem_pass]').val()+'"/>');
			
			$frm.append($iptID);
			$frm.append($iptPWD);
			
			$(document.body).append($frm);
			
			$frm.submit();
			
			
		});
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
									<td colspan="3" align="right">
<!-- 									input[type=checkbox nanme=saveCookie] -->
										아이디저장: <input type="checkbox" name="saveCookie" /><br>			
									<a href="<%=request.getContextPath()%>/05/main.jsp?contentPage=/05/memberForm.jsp">회원가입을 원하세요??</a></td>
<!-- 									클릭하면 memberForm.jsp로... -->
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
