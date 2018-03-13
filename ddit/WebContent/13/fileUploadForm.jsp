<%--==============================================================
 * 파일 업로드 연습 폼
 * @author 윤소미
 * @since  2018.03.13.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.13.  윤소미      최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
===============================================================--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		$('form').submit(function(){
			var flag= true;
			$('input[type=file]').each(function(idx,tag){
				if(!/\.(jpg|jpeg|png|gif)/.test($(tag).val().toLowerCase())){
					alert('이미지 파일만 업로드 할 수 있습니다.');
					flag=false;
				}
			});
			return flag;
		});
	});
</script>
</head>
<body>
<!--  
	브라우저 Security Policy: 브라우저는 클라이언트의 파일시스템 접근으로 파일 또는 디렉토리를 수정, 삭제할 수 없음.
	
	브라우저 파일 업로드 규칙 : 업고드에 활용되는 자원 - form, ajax
							*전송방식(method) - post
							*enctype="multipart/form-data"
-->
<!-- 	<input type="file" name="files"> -->
<form action="${pageContext.request.contextPath }/13/result2.jsp"
	method="post" enctype="multipart/form-data" >
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="mem_id" /></td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td><input type="text" name="mem_pass" /></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="mem_name" /></td>
		</tr>
		<tr>
			<td>file01</td>
			<td><input type="file" name="files" /></td>
		</tr>
		<tr>
			<td>file02</td>
			<td><input type="file" name="files" /></td>
		</tr>
		<tr>
			<td colspan=2>
				<input type="submit" value="전송" />
			</td>
		</tr>
	</table>
</form>
<!-- <form action="" menctype="multipart/form-data"></form> -->
</body>
</html>