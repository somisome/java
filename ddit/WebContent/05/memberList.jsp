<%--==============================================================
 * 회원관리 연습 - 모든 회원정보(아이디,패스워드,이름,주민번호) 리스트
 * @author 윤소미
 * @since  2018.02.22.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.22.  윤소미      최초작성
 *    2018.02.23.  윤소미      클릭이벤트(memberView.jsp로 이동) 추가
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.service.member.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.service.member.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	IMemberService service = IMemberServiceImpl.getInstance();
	List<MemberVO> memberList=service.getMemberList();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="list">
	<table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp" style="width: 100%;" id="memberListTbl">
		<thead>
			<tr>
				<th class="mdl-data-table__cell--non-numeric">아이디</th>
				<th class="mdl-data-table__cell--non-numeric">패스워드</th>
				<th class="mdl-data-table__cell--non-numeric">이름</th>
				<th class="mdl-data-table__cell--non-numeric">주민번호1</th>
				<th class="mdl-data-table__cell--non-numeric">주민번호2</th>
			</tr>
		</thead>
		<tbody>
		<% for(MemberVO memberInfo : memberList){ %>		
			<tr>
				<td class="mdl-data-table__cell--non-numeric"><%=memberInfo.getMem_id() %></td>
				<td class="mdl-data-table__cell--non-numeric"><%=memberInfo.getMem_pass() %></td>
				<td class="mdl-data-table__cell--non-numeric"><%=memberInfo.getMem_name() %></td>
				<td class="mdl-data-table__cell--non-numeric"><%=memberInfo.getMem_regno1() %></td>
				<td class="mdl-data-table__cell--non-numeric"><%=memberInfo.getMem_regno2() %></td>
			</tr>
		<% } %>	
		</tbody>
	</table>
</div>
<div class="searchForm" align="right" style="margin-top: 10px;">
	<form method="post" action="${pageContext.request.contextPath }/18_1/main.jsp?contentPage=boardList.jsp">
		<select name="search_keycode">
			<option value="ALL">전체</option>
			<option value="TITLE">제목</option>
			<option value="CONTENT">컨텐츠</option>
		</select>
		<input type="text" id="search_keyword" name="search_keyword">
		<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="submit">검색</button>
		<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="button">글쓰기</button>
	</form>
</div>
</body>
<!--
	jquery  코드 힌트 창 활성화 
	1. http://code.google.com/a/eclipselabs.org/p/jquerywtp/downloads/list 
	    다운로드 jqueryWTP1.20foEN.jar
	2. cmd -> java -jar jqueryWTP1.20foEN.jar 실행
			C:\Users\Administrator>d:
			D:\>D_Other
			D:\>cd D_Other
			D:\D_Other>java -jar jqueryWTP1.20foEN.jar
	3. 실행창에서 JarFile :[Browse] -> 사용중인 이클립스 -> plugins -> org.eclipse.wst.jsdt.core_1.3.1.v201401291437.jar 선택
			D:/B_Util/1.설치 및 압축파일/eclipse_kepler/plugins/org.eclipse.wst.jsdt.core_1.3.1.v201401291437.jar
	4. Output Dir : [Browse] -> jquery 코드 힌트 플러그인이 추가된 jar파일 작성 위치 선택(D:/)
	5. 신규 작성된 jar파일을 사용중인 이클립스의 plugins 폴더에 덮어쓰기
	6. 이클립스종료
	7. 워크스페이스 -> .metadate -> plugins -> org.eclipse.wst.jsdt.core 삭제
	8. 이클립스 실행
	
	
	
	D:\B_Util\1.설치 및 압축파일\eclipse_kepler\plugins
에 D:/에 생긴 파일 덮어쓰기

D:\workspace(web)\.metadata\.plugins에서
org.eclipse.wst.jsdt.core삭제
	
-->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<script type="text/javascript">
	$(function(){
		
		$('#memberListTbl tr:gt(0)').click(function(){
			var idx = $(this).index();
			var mem_id = $(this).find('td:eq(0)').text();
<%-- 			location.href='<%=request.getContextPath()%>/05/main.jsp?contentPage=/05/memberView.jsp?mem_id='+mem_id; --%>
			$(location).attr('href','<%=request.getContextPath()%>/05/main.jsp?contentPage=/05/memberView.jsp?mem_id='+mem_id);
		});
		
	})
</script>

</html>








