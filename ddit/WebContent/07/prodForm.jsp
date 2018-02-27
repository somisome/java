<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/validation.js"></script>
<script type="text/javascript">
$(function(){
	
	$('form[name=buyerForm]').submit(function(){
				
// 		if(!$('input[name=prod_id]').val().validationProdId()){
// 			return err('대문자P와 9개의 숫자로 이루어진 상품코드를 입력하세요. (예: P123456789)');
// 		}

		return true;
	});
		
	
	$('#btn3').on('click',function(){
		$(location).attr('href','<%=request.getContextPath()%>/07/main.jsp');
	});
	
	
});

function err(msg){
	alert(msg);
	return false;
}

function isOkID(){
	
// 	if(!$('input[name=prod_id]').val().validationProdId()){
// 		return err('대문자P와 9개의 숫자로 이루어진 상품코드를 입력하세요. (예: P123456789)');
// 	}
	$.ajax({
		type:'POST',
		dataType:'json',
		data:{prod_id:$('input[name=prod_id]').val()},
		url:'<%=request.getContextPath()%>/07/prodIdCheck.jsp',
		error:function(result){
				alert(result.message);
			},	
		success:function(result){
  			alert(result.flag);
			}
	});
	
};


</script>


</head>
<style>
.fieldName {text-align: center; background-color: #f4f4f4;}
.tLine {background-color: #d2d2d2; height: 1px;}
.btnGroup { text-align: right; }
td {text-align: left; }
</style>
<body>
<form action="<%=request.getContextPath()%>/07/insertProd.jsp"   name="buyerForm" method="post">
<table width="600" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td class="fieldName" width="100px" height="25">상품코드</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_id" name="prod_id">
				<label class="mdl-textfield__label" for="prod_id">상품코드</label>
			</div>
			<!-- 
				상품코드 신규 등록시 기존의 상품코드와의 중복검사 로직을 ajax로 구현.
			 -->
			 
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="search_prod_id" type="button" ><a href="javascript:isOkID();">상품코드중복검사</a></button>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">상품명</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_name" name="prod_name">
				<label class="mdl-textfield__label" for="prod_name">상품명</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">상품분류코드</td>
		<td>
			<div class="mdl-selectfield">
				<!-- 해당 셀렉트에 출력될 option의 구성은 LProd 테이블의 lprod_gu와 lprod_nm으로 UI출력시 먼저 
				     구성되도록 함.
				 -->
				<select class="browser-default" name="prod_lgu" id="prod_lgu">
<!-- 					<option value="" disabled selected>상품분류코드</option> -->
					<option value="P302">P302</option>
					<option value="P301">P301</option>
				</select>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">거래처코드</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_buyer" name="prod_buyer">
				<label class="mdl-textfield__label" for="prod_buyer">거래처코드</label>
			</div>
			<!-- 
				거래처 등록시 모달리스 팝업을 활용하여 기존의 거래처명으로 거래처 코드 검색을 ajax로 구현.
			 -->
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="search_buyer_id" type="button">거래처검색</button>	
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">매입가</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_cost" name="prod_cost">
				<label class="mdl-textfield__label" for="prod_cost">매입가</label>
			</div>			
		</td>
	</tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">소비자가</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_price" name="prod_price">
				<label class="mdl-textfield__label" for="prod_price">소비자가</label>
			</div>
		</td>
	</tr>
</table>
<table width="600" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
	<tr>
		<td class="fieldName" width="100px" height="25">판매가</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_sale" name="prod_sale">
				<label class="mdl-textfield__label" for="prod_sale">판매가</label>
			</div>		
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="100px" height="25">상품설명</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_outline" name="prod_outline">
				<label class="mdl-textfield__label" for="prod_outline">상품설명</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="300px" height="25">상품상세설명</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_detail" name="prod_detail">
				<label class="mdl-textfield__label" for="prod_detail">상품상세설명</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="300px" height="25">총입고수량</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_qtyin" name="prod_qtyin">
				<label class="mdl-textfield__label" for="prod_qtyin">총입고수량</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="300px" height="25">재고수량</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_totalstock" name="prod_totalstock">
				<label class="mdl-textfield__label" for="prod_totalstock">재고수량</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="300px" height="25">안전재고수량</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_properstock" name="prod_properstock">
				<label class="mdl-textfield__label" for="prod_properstock">안전재고수량</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="fieldName" width="300px" height="25">입고일자</td>
		<td>
			<div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
				<input class="mdl-textfield__input" type="text" id="prod_insdate" name="prod_insdate">
				<label class="mdl-textfield__label" for="prod_insdate">입고일자</label>
			</div>
		</td>
	</tr>
	<tr>
		<td class="btnGroup" colspan="2" >
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn1" type="submit">상품등록</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn2" type="button">취소</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn3" type="button">목록</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>








