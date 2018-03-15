<%@page import="kr.or.ddit.vo.FreeboardVO"%>
<%@page import="kr.or.ddit.service.freeboard.IFreeboardServiceImpl"%>
<%@page import="kr.or.ddit.service.freeboard.IFreeboardService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<% 
	String bo_no = request.getParameter("bo_no");
	Map<String,String> params = new HashMap<String,String>();
	params.put("bo_no",bo_no);
	IFreeboardService service = IFreeboardServiceImpl.getInstance();
	FreeboardVO freeboardInfo = service.getFreeboardInfo(params);
%>    
<c:set var="freeboardInfo" value="<%=freeboardInfo %>"></c:set>
<c:url var="main" value="/12/main.jsp"></c:url>
<c:url var="deleteFreeboard" value="/12/freeboard/deleteFreeboard.jsp"></c:url>
<c:url var="updateFreeboard" value="/12/freeboard/updateFreeboard.jsp"></c:url>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 정보</title>
<!-- 이미지 슬라이드 사이즈 조정 -->
<style type="text/css">
.carousel{
	width:200px;
    height:150px;
    margin-left: 200px;
}
.carousel-inner > .item > img{
    width:200px;
    height:150px;
}       
</style>
<script>
$(function(){
	// 섬머노트를 div를 활용한 textarea에 추가.
	// http://summernote.org 활용
    $('#bo_content').summernote({
			height: 150,
			codemirror: {
			theme: 'monokai'
		}
    });
});
</script>
</head>
<body>
<form class="form-horizontal" role="form" action="" method="post" name="freeboardForm">
	<input type="hidden" name="bo_writer" value="${LOGIN_MEMBERINFO.mem_id }"/>
	<input type="hidden" name="bo_ip" value="${pageContext.request.remoteAddr}"/>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_title">제목:</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="bo_title" name="bo_title" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_nickname">작성자 대화명:</label>
		<div class="col-sm-10"> 
			<input type="text" class="form-control" id="bo_nickname" name="bo_nickname" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_pwd">패스워드:</label>
		<div class="col-sm-10"> 
			<input type="password" class="form-control" id="bo_pwd" name="bo_pwd" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_mail">메일:</label>
		<div class="col-sm-10"> 
			<input type="password" class="form-control" id="bo_mail" name="bo_mail" >
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">내용:</label>
		<div class="col-sm-10"> 
			<div id="bo_content"></div>
		</div>
	</div>
	<div class="form-group">
		<label class="control-label col-sm-2" for="bo_content">첨부파일:</label>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
			</ol>
	
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox" style= "height: 200px;">
				<c:forEach items="${freeboardInfo.fileItemList}" var="fileItemInfo" varStatus="stat" >
					<c:if test="${stat.first}">
						<div class="item active">
					</c:if>
					<c:if test="${stat.last}">
						<div class="item">
					</c:if>
					<img src="/image/${fileItemInfo.file_save_name}" alt="pic1" onclick="javascript:location.href='${pageContext.request.contextPath}/12/fileDownload.jsp?fileSeq=${fileItemInfo.file_seq}';">
					</div>
				</c:forEach>
			</div>
			<!-- Left and right controls -->
			<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
		</div>
	</div>
	<div class="form-group"> 
		<div class="col-sm-offset-2 col-sm-10">
			<button type="button" class="btn btn-success" id="freeboardFormBtn">글쓰기</button>
			<button type="button" class="btn btn-danger" id="freeboardDeleteBtn">삭제</button>
			<button type="button" class="btn btn-primary" id="replyBtn">댓글</button>
			<button type="button" class="btn btn-info" id="freeboardListBtn">목록</button>
			<button type="submit" class="btn btn-default" style="float: right">수정</button>
		</div>
	</div>
</form>
</body>
<script type="text/javascript">
$(function(){
// 	$('#bo_title').val('${pageScope.freeboardInfo.bo_title}');
	$('#bo_title').val('${freeboardInfo.bo_title}');
	$('#bo_nickname').val('${freeboardInfo.bo_nickname}');
	$('#bo_pwd').val('${freeboardInfo.bo_pwd}');
	$('#bo_mail').val('${freeboardInfo.bo_mail}');
    $('#bo_content').summernote('code', '${freeboardInfo.bo_content}');
    
    
	//목록버튼	
	$('#freeboardListBtn').click(function(){
		$(location).attr('href','${main}');
	});
	
	//글쓰기버튼
	$('#freeboardFormBtn').click(function(){
		if(eval('${empty LOGIN_MEMBERINFO}')){
			BootstrapDialog.show({
			    title: '경고',
			    message: '로그인해주세요'
			});
			return false;
		}
		$(location).attr('href','${pageContext.request.contextPath}/12/main.jsp?contentPage=/12/freeboard/freeboardForm.jsp');
	});
	
	//삭제버튼
	$('#freeboardDeleteBtn').click(function(){
		if(eval('${empty LOGIN_MEMBERINFO}')){
			BootstrapDialog.show({
			    title: '경고',
			    message: '로그인해주세요'
			});
			return;
		}
		
		if('${freeboardInfo.bo_writer}'!='${LOGIN_MEMBERINFO.mem_id}'){
			BootstrapDialog.show({
			    title: '경고',
			    message: '작성자만 삭제 가능합니다.'
			});
			return false;
		}
		var bo_no = ${freeboardInfo.bo_no};	
		$(location).attr('href','${pageContext.request.contextPath}/12/freeboard/deleteFreeboard.jsp?bo_no='+bo_no);
	
	});
	
	//댓글 버튼
	$('#replyBtn').click(function(){
		if(eval('${empty LOGIN_MEMBERINFO}')){
			return alertPrt('로그인해주세요');
		}	
		var bo_group = '${freeboardInfo.bo_group}';
		var bo_seq = '${freeboardInfo.bo_seq}';
		var bo_depth = '${freeboardInfo.bo_depth}';
		var title = encodeURIComponent('${freeboardInfo.bo_title}');
		var params = '?rnum=${param.rnum}&bo_title='+title+'&bo_group='+bo_group+'&bo_seq='+bo_seq+'&bo_depth='+bo_depth;
		
		
		$(location).attr('href','${pageContext.request.contextPath}/12/main.jsp?contentPage=/12/freeboard/freeboardReplyForm.jsp'+params);
	});
	
	
	
	//수정버튼(submit)
	$('form[name=freeboardForm]').submit(function(){
		if(eval('${empty LOGIN_MEMBERINFO}')){
			BootstrapDialog.show({
			    title: '경고',
			    message: '로그인해주세요'
			});
			return false;
		}
		
		if('${freeboardInfo.bo_writer}'!='${LOGIN_MEMBERINFO.mem_id}'){
			BootstrapDialog.show({
			    title: '경고',
			    message: '작성자만 수정 가능합니다.'
			});
			return false;
		}
		
		
		if(!$('#bo_title').val().validationTITLE()){
			BootstrapDialog.show({
				title:'경고',
				message:'게시글 제목을 입력해주세요.!'
			});
			return false;
		}
		if(!$('#bo_nickname').val().validationNICKNAME()){
			BootstrapDialog.show({
				title:'경고',
				message:'작성자 닉네임을 입력해주세요.!'
			});
			return false;
		}
		if(!$('#bo_pwd').val().validationPWD()){
			BootstrapDialog.show({
				title:'경고',
				message:'패스워드를 입력해주세요.!'
			});
			return false;
		}
		if(!$('#bo_mail').val().validationMAIL()){
			BootstrapDialog.show({
				title:'경고',
				message:'이메일을 입력해주세요.!'
			});
			return false;
		}
		$content = $('<input type="hidden" name="bo_content" value="'+$('#bo_content').summernote('code')+'"></input>')
		
		if($content.val()==''){
			BootstrapDialog.show({
				title:'경고',
				message:'게시글 내용을 입력해주세요.!'
			});
			return false;
		}
		
		$no = $('<input type="hidden" name="bo_no" value="'+<%=bo_no%>+'"></input>')
		$(this).append($content);
		$(this).append($no);
		$(this).attr('action','${updateFreeboard}');
		$(this).submit();
	});
	
    
	
	
	
	
});

</script>


</html>