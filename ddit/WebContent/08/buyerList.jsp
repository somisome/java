<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.service.buyer.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.service.buyer.IBuyerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	IBuyerService service = IBuyerServiceImpl.getInstance();
	List<BuyerVO> buyerList = service.getBuyerList();
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		$('#buyerTable tr:gt(0)').on('click',function(){
			var idx = $(this).index();
			var buyer_id = $(this).find('td:eq(0)').text();
			$(location).attr('href','<%=request.getContextPath()%>/08/main.jsp?contentPart=/08/buyerView.jsp?buyer_id='+buyer_id);
		});
		
		$('#insertBtn').on('click',function(){
			$(location).attr('href','<%=request.getContextPath()%>/08/main.jsp?contentPart=/08/buyerForm.jsp');
		});
		
	});
	
</script>

</head>
<body>
<div id="list">
	<table id="buyerTable" class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp" style="width: 100%;">
		<thead>
			<tr>
				<th class="mdl-data-table__cell--non-numeric">거래처코드</th>
				<th class="mdl-data-table__cell--non-numeric">거래처명</th>
				<th class="mdl-data-table__cell--non-numeric">상품분류명</th>
				<th class="mdl-data-table__cell--non-numeric">담당자명</th>
				<th class="mdl-data-table__cell--non-numeric">전화번호</th>
				<th class="mdl-data-table__cell--non-numeric">메일</th>
			</tr>
		</thead>
		<tbody>
			<%for(BuyerVO buyer : buyerList){ %>
			<tr>
				<td class="mdl-data-table__cell--non-numeric"><%=buyer.getBuyer_id()%> </td>
				<td class="mdl-data-table__cell--non-numeric"><%=buyer.getBuyer_name()%> </td>
				<td class="mdl-data-table__cell--non-numeric"><%=buyer.getBuyer_lgu() %> </td>
				<td class="mdl-data-table__cell--non-numeric"><%=buyer.getBuyer_charger() %> </td>
				<td class="mdl-data-table__cell--non-numeric"><%=buyer.getBuyer_comtel()%></td>
				<td class="mdl-data-table__cell--non-numeric"><%=buyer.getBuyer_mail()%></td>
			</tr>
			<%} %>
		</tbody>
	</table>
</div>
<div class="searchForm" align="right" style="margin-top: 10px;">
	<form method="post" action="">
		<select name="search_keycode">
			<option value="ALL">전체</option>
			<option value="BUYERID">거래처코드</option>
			<option value="BUYERNAME">거래처명</option>
			<option value="BUYERCHARGER">담당자명</option>
		</select>
		<input type="text" id="search_keyword" name="search_keyword">
		<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="submit">검색</button>
		<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" id="insertBtn" type="button">거래처등록</button>
	</form>
</div>
</body>
</html>








