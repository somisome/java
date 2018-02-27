<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.service.prod.IProdServiceImpl"%>
<%@page import="kr.or.ddit.service.prod.IProdService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	IProdService service = IProdServiceImpl.getInstance();
	List<ProdVO> prodList = service.getProdList();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(function(){
		$('#prodtable tr:gt(0)').on('click',function(){
			var num = $(this).index();
			var prod_id = $(this).find('td:eq(0)').text();
			$(location).attr('href','<%=request.getContextPath()%>/07/main.jsp?contentPart=/07/prodView.jsp?prod_id='+prod_id);
		});
		
		$('#insertBtn').on('click',function(){
			$(location).attr('href','<%=request.getContextPath()%>/07/main.jsp?contentPart=/07/prodForm.jsp');
		});
		
	});
	
	
	
	
</script>
</head>
<body>
<div id="list">
	<table id=prodtable class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp" style="width: 100%;">
		<thead>
			<tr>
				<th class="mdl-data-table__cell--non-numeric">상품분류코드</th>
				<th class="mdl-data-table__cell--non-numeric">상품명</th>
				<th class="mdl-data-table__cell--non-numeric">매입가</th>
				<th class="mdl-data-table__cell--non-numeric">소비자가</th>
				<th class="mdl-data-table__cell--non-numeric">판매가</th>
				<th class="mdl-data-table__cell--non-numeric">총입고수량</th>
				<th class="mdl-data-table__cell--non-numeric">재고수량</th>
			</tr>
		</thead>
		<tbody>
			<%for(ProdVO prodInfo: prodList){ %>
			<tr>
				<td class="mdl-data-table__cell--non-numeric"><%=prodInfo.getProd_id() %></td>
				<td class="mdl-data-table__cell--non-numeric"><%=prodInfo.getProd_name() %></td>
				<td class="mdl-data-table__cell--non-numeric"><%=prodInfo.getProd_cost() %></td>
				<td class="mdl-data-table__cell--non-numeric"><%=prodInfo.getProd_price() %></td>
				<td class="mdl-data-table__cell--non-numeric"><%=prodInfo.getProd_sale() %></td>
				<td class="mdl-data-table__cell--non-numeric"><%=prodInfo.getProd_qtyin() %></td>
				<td class="mdl-data-table__cell--non-numeric"><%=prodInfo.getProd_totalstock() %></td>
			</tr>
			<%} %>
		</tbody>
	</table>
</div>
<div class="searchForm" align="right" style="margin-top: 10px;">
	<form method="post" action="">
		<select name="search_keycode">
			<option value="ALL">전체</option>
			<option value="PRODLGU">상품분류코드</option>
			<option value="PRODNAME">상품명</option>
			<option value="BUYERNAME">거래처명</option>
		</select>
		<input type="text" id="search_keyword" name="search_keyword">
		<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="submit">검색</button>
		<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent" type="button" id=insertBtn >상품등록</button>
	</form>
</div>
</body>
</html>








