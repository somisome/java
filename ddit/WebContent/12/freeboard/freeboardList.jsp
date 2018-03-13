<%--==============================================================
 * 자유게시판 목록 페이지
 * @author 윤소미
 * @since  2018.03.11.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.11.  윤소미      최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
===============================================================--%>


<%@page import="kr.or.ddit.vo.FreeboardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.service.freeboard.IFreeboardServiceImpl"%>
<%@page import="kr.or.ddit.service.freeboard.IFreeboardService"%>
<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% 
	IFreeboardService service = IFreeboardServiceImpl.getInstance();
	List<FreeboardVO> freeboardList = service.getFreeboardList();
	//pageContext.setAttribute("freeboardList",freeboardList);
%>
<c:set var="freeboardList" value="<%=freeboardList %>"></c:set>
<c:url var="main" value="/12/main.jsp">
	<c:param name="contentPage" value="/12/freeboard/freeboardForm.jsp"></c:param>
</c:url>
<%-- <c:url var="freeboardView" value="/12/main.jsp"> --%>
<%-- 	<c:param name="contentPage" value="/12/freeboard/freeboardView.jsp?bo_no="></c:param> --%>
<%-- </c:url>	 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시글 목록</title>
</head>
<body>

<div id="freeboardList_content">
	<div class="panel panel-blue">
    	<div class="panel-heading">게시판 목록</div>
		<table class="table table-bordered table-hover" id="freeboardListTbl">
			<thead>
				<tr>
					<th scope="col" width="5%">No</th>
					<th scope="col" width="65%">제목</th>
					<th scope="col" width="10%">작성자</th>
					<th scope="col" width="10%">작성일</th>
					<th scope="col" width="10%">조회수</th>
				</tr>
			</thead>
			<tbody>
				
				<c:if test="${empty freeboardList}">
					<tr align="center">
						<td colspan="5">
							<font color="red">
								등록된 게시글이 없습니다.							
							</font>
						</td>
					</tr>
				</c:if>
				
				<c:if test="${!empty freeboardList}">
					<c:forEach items="${freeboardList}" var="freeboardInfo">
						<tr>
							<td><input type="hidden" value="${freeboardInfo.bo_no}" />	 ${freeboardInfo.rnum}</td>
							<td>${freeboardInfo.bo_title}</td>
							<td>${freeboardInfo.bo_nickname}</td>
							<td>${fn:substringBefore(freeboardInfo.bo_reg_date,' ') } </td>
							<td>${freeboardInfo.bo_hit}</td>
						</tr>
					</c:forEach>
				</c:if>

			</tbody>
		</table>
	</div>
</div>
<div >
<form action="#" method="post" class="form-inline pull-right">
		<input id="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
		<select class="form-control" name="search_keycode" >
			<option>검색조건</option>
			<option value="TOTAL">전체</option>
			<option value="TITLE">제목</option>
			<option value="CONTENT">내용</option>
			<option value="WRITER">작성자</option>
		</select>
	    <button type="submit" class="btn btn-primary form-control">검색</button>
	    <button type="button" class="btn btn-info form-control" id="registFreeboard">게시글 등록</button>
</form>
</div>	
</body>

<script type="text/javascript">

	$(function(){
		$('#registFreeboard').click(function(){
			if(eval('${empty LOGIN_MEMBERINFO}')){
				BootstrapDialog.show({
				    title: '경고',
				    message: '로그인 후 게시글 등록이 가능합니다.'
				});
				return;
			}
			$(location).attr('href','${main}');
		});
		
		$('#freeboardListTbl tr:gt(0)').click(function(){
// 			$(this).find('td:eq(0)').find('input')	
			var bo_no = $(this).find('td:eq(0) input').val();	
			$(location).attr('href','${pageContext.request.contextPath}/12/main.jsp?contentPage=/12/freeboard/freeboardView.jsp?bo_no='+bo_no);
		});
		
	});
</script>

</html>