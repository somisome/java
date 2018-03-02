<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="kr.or.ddit.service.buyer.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.service.buyer.IBuyerService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String buyer_id=request.getParameter("buyer_id");
	Map<String,String> params=new HashMap<String,String>();
	params.put("buyer_id",buyer_id);
	IBuyerService service = IBuyerServiceImpl.getInstance();
	BuyerVO buyerInfo = service.getBuyerInfo(params);
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src='<%=request.getContextPath()%>/js/validation.js'></script>
<script type="text/javascript">
$(function(){
	
// 	buyer_id
// 	buyer_name
// 	buyer_charger
// 	buyer_bank
// 	buyer_add1
// 	buyer_add2
// 	buyer_comtel
// 	buyer_fax
// 	buyer_mail
	
	
	$('input[name=buyer_id     ]').val('<%=buyerInfo.getBuyer_id() %>');
	$('input[name=buyer_name   ]').val('<%=buyerInfo.getBuyer_name() %>');
	$('input[name=buyer_charger]').val('<%=buyerInfo.getBuyer_charger() %>');
	$('input[name=buyer_bank   ]').val('<%=buyerInfo.getBuyer_bank() %>');
	$('input[name=buyer_add1   ]').val('<%=buyerInfo.getBuyer_add1() %>');
	$('input[name=buyer_add2   ]').val('<%=buyerInfo.getBuyer_add2() %>');
	$('input[name=buyer_comtel ]').val('<%=buyerInfo.getBuyer_comtel() %>');
	$('input[name=buyer_fax    ]').val('<%=buyerInfo.getBuyer_fax() %>');
	$('input[name=buyer_mail   ]').val('<%=buyerInfo.getBuyer_mail() %>');
	
	
	//buyer - update
	$('form[name=buyerForm]').submit(function(){
		$(this).append('<input type="hidden" name="buyer_id" value="<%=buyer_id %>"></input>');
	});		
	
	//buyer_delete 'n'->'y'
	$('#btn2').on('click',function(){
		var $delForm = $('<form action="/ddit/08/deleteBuyer.jsp" method="post"></form>');
		var $id = $('<input type="hidden" name="buyer_id" value="<%=buyerInfo.getBuyer_id() %>"/>');
		$delForm.append($id);
		$(document.body).append($delForm);
		$delForm.submit();
	});
	
	
	//목록
	$('#btn3').on('click',function(){
		$(location).attr('href','<%=request.getContextPath()%>/08/main.jsp');
	});
});		
</script>




</head>
<style>
.fieldName {text-align: center; background-color: #f4f4f4;}
.tLine {background-color: #d2d2d2; height: 1px;}
.btnGroup { text-align: right; }
td {text-align: left; }
</style>

<body>
<form name="buyerForm" method="post"  action="<%=request.getContextPath()%>/08/updateBuyer.jsp" >
<table width="600" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td class="fieldName" width="100px" height="25">거래처코드</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_id" name="buyer_id" disabled="disabled">
				<label class="mdl-textfield__label" for="buyer_id">거래처코드</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">거래처명</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_name" name="buyer_name">
				<label class="mdl-textfield__label" for="buyer_name">거래처명</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">담당자</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_charger" name="buyer_charger">
				<label class="mdl-textfield__label" for="buyer_charger">담당자명</label>
			</div>			
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">거래은행</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_bank" name="buyer_bank">
				<label class="mdl-textfield__label" for="buyer_bank">거래은행</label>
			</div>			
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">거래처주소1</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_add1" name="buyer_add1">
				<label class="mdl-textfield__label" for="buyer_add1">거래처주소1</label>
			</div>			
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">거래처주소2</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_add2" name="buyer_add2">
				<label class="mdl-textfield__label" for="buyer_add2">거래처주소2</label>
			</div>
		</td>
	</tr>
</table>
<table width="600" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
	<tr>
		<td class="fieldName" width="100px" height="25">전화번호</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_comtel" name="buyer_comtel">
				<label class="mdl-textfield__label" for="buyer_comtel">전화번호</label>
			</div>		
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">팩스번호</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_fax" name="buyer_fax">
				<label class="mdl-textfield__label" for="buyer_fax">팩스번호</label>
			</div>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="300px" height="25">거래처메일</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="buyer_mail" name="buyer_mail">
				<label class="mdl-textfield__label" for="buyer_mail">거래처메일</label>
			</div>
		</td>
	</tr>
	
	<tr><td colspan="2" height="20"></td></tr>
	
	<tr>
		<td class="btnGroup" colspan="2" >
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn1" type="submit">거래처정보수정</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn2" type="button">거래처 삭제</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn3" type="button">목록</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>








