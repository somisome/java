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
<%@page import="kr.or.ddit.utils.RolePagingUtil"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.ddit.vo.FreeboardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.service.freeboard.IFreeboardServiceImpl"%>
<%@page import="kr.or.ddit.service.freeboard.IFreeboardService"%>
<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% 
	//main.jsp?currentPage=5
	String currentPage = request.getParameter("currentPage");
	if(currentPage==null){
		currentPage="1";
	}
	
	


	//freeboardList.jsp[검색: main.jsp]
	//redirect	main.jsp[request(search_keycode,search_keyword)]
	//		forwarding<c:import url=freeboardList.jsp/>
	//					[request(search_keycode,search_keyword)]
	String search_keycode  = request.getParameter("search_keycode");
	String search_keyword  = request.getParameter("search_keyword");
	
	Map<String,String> params = new HashMap<String,String>();
	params.put("search_keycode", search_keycode);
	params.put("search_keyword", search_keyword);
	
	IFreeboardService service = IFreeboardServiceImpl.getInstance();
	
	//총 게시글 갯수
	int totalCount = service.getTotalCount(params);
	
	//페이지 네비게이션 메뉴를 동적으로 작성
	//사용자정의태그(paging.tld) 로 프로젝트때에는 그렇게 만들어서 써야 함
	RolePagingUtil pagingUtil = new RolePagingUtil(Integer.parseInt(currentPage), totalCount, request);
	
	String startCount = String.valueOf(pagingUtil.getStartCount());
	String endCount = String.valueOf(pagingUtil.getEndCount());
	
	params.put("startCount", startCount);
	params.put("endCount", endCount);
	
	String pagingContent = pagingUtil.getPageHtmls().toString();
	
	List<FreeboardVO> freeboardList = service.getFreeboardList(params);
	//pageContext.setAttribute("freeboardList",freeboardList);
%>
<c:set var="freeboardList" value="<%=freeboardList %>"></c:set>
<c:set var="pagingContent" value="<%=pagingContent %>"></c:set>
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
							<td align="left">
								<c:forEach begin="1" end="${freeboardInfo.bo_depth}" varStatus="stat">
									&nbsp;&nbsp;&nbsp;
									<c:if test="${stat.last}">
										<i class="fa fa-angle-right"></i>
									</c:if>
								</c:forEach>
								${freeboardInfo.bo_title}
							</td>
							<td>${freeboardInfo.bo_nickname}</td>
							<td>${fn:substringBefore(freeboardInfo.bo_reg_date,' ') } </td>
							<td>${freeboardInfo.bo_hit}</td>
						</tr>
					</c:forEach>
				</c:if>

			</tbody>
		</table>
		${pagingContent }
	</div>
</div>
<div >
<form action="${pageContext.request.contextPath}/12/main.jsp" method="post" class="form-inline pull-right">
		<input id="search_keyword" name="search_keyword" type="text" placeholder="검색어 입력..." class="form-control" />
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
			var rnum = $(this).find('td:eq(0)').text();
			$(location).attr('href','${pageContext.request.contextPath}/12/main.jsp?contentPage=/12/freeboard/freeboardView.jsp?bo_no='+bo_no+'&rnum='+rnum);
		});
		
	});
</script>

</html>