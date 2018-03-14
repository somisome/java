<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
td {f on t-family:"돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
}

td a {
	font-family: "돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
	text-decoration: none;
}

td a:hover {
	font-family: "돋움";
	font-size: 9pt;
	line-height: 16px;
	color: #818181;
	letter-spacing: 0px;
	text-decoration: underline;
}

#hiddenFileInput{
	position : relative;
	width : 80px; 
	height:30px; 
	overflow:hidden; 
	cursor:pointer; 
	background-image:url('${pageContext.request.contextPath}/image/bt_search.gif');
	background-repeat: no-repeat;
}
#idPic{
	width:80px; 
	height:30px; 
	filter:alpha(opacity=0); 
	opacity:0; 
	-moz-opacity:0; 
	cursor:pointer;
	vertical-align: middle;
}
.bar {
    height: 18px;
    background: green;
}

</style>
<!--  
	ajax를 활용한 파일 업로드 처리
	1. http://malsup.com/jquery/form/#download      http://malsup.github.io/jquery.form.js
-->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
<script type="text/javascript">
var fileSaveName;
function idPicInput(fileName){
	//	d:\\a.png
	//	d:\\temp\\a.png
	var fileInfo = fileName.split('\\');
	fileName = fileInfo[fileInfo.length-1];
	$('#fileName').val(fileName);
	
	if(!/\.(jpg|jpeg|png|gif)/.test(fileName.toLowerCase())){
		alert('이미지 파일을 선택해주세요.');
		return;
	}
	
	if($(opener.document).find('input[name=mem_id]').val()==''){
		alert('아이디를 입력해주세요.');
		return;
	}
	
	
	$('#idPicForm').append('<input type="hidden" name="mem_id" value="'+$(opener.document).find('input[name=mem_id]').val()+'" />');
	
	$('#idPicForm').ajaxForm({
		dataType:'json',
		success:function(result){
			fileSaveName=result.file_save_name;
			$('#viewTable').html('<input type="image" src="/image/'+fileSaveName+'" width="230" height="250" onclick="popClose();"/>');
		}
	});
	$('#idPicForm').submit();
	
}
function popClose(){
	$(opener.document).find('#viewTable').html('<input type="image" src="/image/'+fileSaveName+'" width="150" height="200"/>');
	self.close();
	
	 
	
	
	
}

</script>

</head>
<body>
	<table width="354" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30" style="text-align: center;"><font color="red" size="5">증명 사진 업로드</font></td>
		</tr>
		<tr>
			<td><img src="../image/open_table01.gif" width="354" height="10"></td>
		</tr>
		<tr>
			<td height="10" background="../image/open_table02.gif" align="center">&nbsp;</td>
		</tr>
		<tr>
			<td height="300" align="center" valign="top"
				background="../image/open_table02.gif">
				<table width="300" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="25">
							<div align="center">등록하려는 사진(gif | jpg | jpeg | png)를 선택해주세요.</div>
						</td>
					</tr>
					<tr>
						<td height="38" background="../image/open_tt.gif" align="center">
							<form id="idPicForm" action="${pageContext.request.contextPath}/05/idPickFileUpload.jsp" method="post" enctype="multipart/form-data" >
								<input type="text" id="fileName" name="fileName"/>
								<span id="hiddenFileInput">
	    							<input type="file" id="idPic" name="idPic" onchange="idPicInput(this.value);"/>
								</span>
							</form>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
							<div style="overflow: auto; white-space: nowrap; overflow-X: hidden; height: 200px;" id="viewTable"></div>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td><img src="../image/open_table03.gif" width="354" height="10"></td>
		</tr>
	</table>
</body>
</html>