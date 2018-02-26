<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.service.member.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.service.member.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String mem_id=request.getParameter("mem_id");
	Map<String,String> params= new HashMap<String,String>();
	params.put("mem_id",mem_id);
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.getMemberInfo(params);

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
		//memberInfo 출력
	//성명
	$('input[name=mem_name]').val('<%=memberInfo.getMem_name()%>');
	//주민등록번호 1, 2
	$('input[name=mem_regno1]').val('<%=memberInfo.getMem_regno1()%>');
	$('input[name=mem_regno2]').val('<%=memberInfo.getMem_regno2()%>');
	//생년월일(년,월,일)
	var bir = '<%=memberInfo.getMem_bir()%>';
	if(bir!='null'){
		$('input[name=mem_bir1]').val(bir.split("-")[0]);
		$('input[name=mem_bir2]').val(bir.split("-")[1]);
		$('input[name=mem_bir3]').val(bir.split("-")[2].substring(0,2));
	}
	//아이디
	$('input[name=mem_id]').val('<%=memberInfo.getMem_id()%>');
	//비밀번호
	$('input[name=mem_pass]').val('<%=memberInfo.getMem_pass()%>');
	//전화번호(집)
	var hometel ='<%=memberInfo.getMem_hometel()%>';
	$('select[name=mem_hometel1] option[value="'+hometel.split("-")[0]+'"]').attr('selected',true);
	$('input[name=mem_hometel2]').val(hometel.split("-")[1]);
	$('input[name=mem_hometel3]').val(hometel.split("-")[2]);
	//핸드폰
	var hp ='<%=memberInfo.getMem_hp()%>';
	$('select[name=mem_hp1] option[value="'+hp.split("-")[0]+'"]').attr('selected',true);
	$('input[name=mem_hp2]').val(hp.split("-")[1]);
	$('input[name=mem_hp3]').val(hp.split("-")[2]);
	//이메일
	var email = '<%=memberInfo.getMem_mail()%>';
	$('input[name=mem_mail1]').val(email.split("@")[0]);
	$('select[name=mem_mail2] option[value="'+email.split("@")[1]+'"]').attr('selected',true);
	//우편번호1,2
	
	$('input[name=mem_zip1]').val('<%=memberInfo.getMem_zip()%>'.split("-")[0]);
	$('input[name=mem_zip2]').val('<%=memberInfo.getMem_zip()%>'.split("-")[1]);
	//주소1,2
	$('input[name=mem_add1]').val('<%=memberInfo.getMem_add1()%>');
	$('input[name=mem_add2]').val('<%=memberInfo.getMem_add2()%>');
	//직업
	$('input[name=mem_job]').val('<%=memberInfo.getMem_job()%>');
	//취미
	$('input[name=mem_like]').val('<%=memberInfo.getMem_like()%>');
	
	
		//memberInfo 수정(submit)
	$('form[name=memberForm]').submit(function(){
		//수정쿼리에 필요한 아이디 정보 보낼 것 append
		$(this).append('<input type="hidden" name="mem_id" value="<%=memberInfo.getMem_id()%>"></input>');
		
		//형식에 맞게 값 입력했는지 validation
		if(!$('input[name=mem_pass]').val().validationPWD()){
			return err('형식에 맞는 패스워드를 입력하세요');
		}
		if($('input[name=mem_pass_confirm]').val() != $('input[name=mem_pass]').val()){
			return err('비밀번호와 비밀번호확인란의 입력사항이 같아야 합니다.');
		}
		var hometel = $('select[name=mem_hometel1]').val()+'-'+$('input[name=mem_hometel2]').val()+'-'+$('input[name=mem_hometel3]').val();
		if(!hometel.validationHOMETEL()){
			return err('형식에 맞는 집전화번호를 입력하세요');
		}
		$('input[name=mem_hometel]').val(hometel);
		
		var email =$('input[name=mem_mail1]').val()+'@'+$('select[name=mem_mail2]').val();
		if(!email.validationMAIL()){
			return err('형식에 맞는 이메일주소를 입력하세요');
		}
		$('input[name=mem_mail]').val(email);
		
		var hp =$('select[name=mem_hp1]').val()+'-'+$('input[name=mem_hp2]').val()+'-'+$('input[name=mem_hp3]').val();
		if(!hp.validationHP()){
			return err('형식에 맞는 휴대전화번호를 입력하세요');
		}
		$('input[name=mem_hp]').val(hp);
		
		var zip =$('input[name=mem_zip1]').val()+'-'+$('input[name=mem_zip2]');
		if(!zip.validationZIPCODE()){
			return err('형식에 맞는 우편번호를 입력하세요');
		}
		$('input[name=mem_zip]').val(zip);
	
		
// 		var comtel="";
// 		if(!comtel.val().validationCOMTEL()){
// 			return err('형식에 맞는 회사전화번호를 입력하세요');
// 		}

		return true;
	});
	
		
		
		//삭제버튼 클릭했을 때
		$('#btn3').on('click',function(){
			var $delForm = $('<form action="/ddit/06/deleteMember.jsp" method="post"></form>');
			var $id = $('<input type="hidden" name="mem_id" value="<%=mem_id%>"/>');
			$delForm.append($id);
			$(document.body).append($delForm);
			$delForm.submit();
		});
		
		//목록버튼 클릭했을 때
		$('#btn4').on('click',function(){
			$(location).attr('href','<%=request.getContextPath()%>/06/main.jsp');
		});
});

function err(msg){
	alert(msg);
	return false;
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
<form name="memberForm" method="post" action="<%=request.getContextPath()%>/06/updateMember.jsp">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr><td rowspan="13" class="pic" colspan="2" style="vertical-align: bottom; width: 150px; text-align: center;">
			<img src="${pageContext.request.contextPath }/image/btn_pic.gif" alt="사진올리기" class="btn" title="인적사항에 올릴 증명	을 검색합니다." 
				style="cursor: pointer;"/><br/>
			<div style="width: 100%" align="center">
				size : 235x315 이하
			</div>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">성 명</td>
		<td>
			<input type="text" name="mem_name" value="" disabled="disabled"/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">주민등록번호</td>
		<td>
			<input type="text" name="mem_regno1" size="6" value="" disabled="disabled"/>
  			<input type="text" name="mem_regno2" size="7" value="" disabled="disabled"/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">생년월일</td>
		<td>
				<input type="hidden" name="mem_bir" />
				<input type="text" name="mem_bir1" size="4" value="" disabled="disabled"/>년
				<input type="text" name="mem_bir2" size="2" value="" disabled="disabled"/>월
				<input type="text" name="mem_bir3" size="2" value="" disabled="disabled"/>일
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">아이디</td>
		<td>
			<input type="text" name="mem_id" value="" disabled="disabled">
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">비밀번호</td>
		<td>
			<input type="text" name="mem_pass" value="" /> 8 ~ 20 자리 영문자 및 숫자 사용
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">비밀번호확인</td>
		<td>
			<input type="text" name="mem_pass_confirm" value="" /> 8 ~ 20 자리 영문자 및 숫자 사용
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
	<tr>
		<td class="fieldName" width="100px" height="25">전화번호</td>
		<td>
			<div>
			<input type="hidden" name="mem_hometel"/>
			<select name="mem_hometel1">
				<option value="02">02</option>
				<option value="031">031</option>
				<option value="032">032</option>								        	
				<option value="033">033</option>				        	
				<option value="041">041</option>
				<option value="042">042</option>				        	
				<option value="043">043</option>				        	
				<option value="051">051</option>				        	
				<option value="052">052</option>
				<option value="053">053</option>				        					        	
				<option value="061">061</option>
				<option value="062">062</option>
				<option value="063">063</option>				        					        					        	
				<option value="064">064</option>				        					        					        	
				<option value="070">070</option>				        					        					        	
			</select>	- 	
			<input type="text" name="mem_hometel2" size="4" value="" /> - 
			<input type="text" name="mem_hometel3" size="4" value="" />
			</div>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">핸드폰</td>
		<td>
			<input type="hidden" name="mem_hp"/>
			<select name="mem_hp1">
				<option value="010">010</option>
				<option value="016">016</option>				        	
				<option value="017">017</option>				        	
				<option value="019">019</option>				        	
			</select>	-
			<input type="text" name="mem_hp2" size="4" value="" /> - 
			<input type="text" name="mem_hp3" size="4" value="" />
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr>
		<td class="fieldName" width="100px" height="25">이메일</td>
		<td>
			<input type="hidden" name="mem_mail" />
			<input type="text" name="mem_mail1" value="" /> @
			<select name="mem_mail2">
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="nate.com">nate.com</option>
				<option value="gmail.com">gmail.com</option>				
			</select>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
		
	<tr>
		<td class="fieldName" width="100px" height="25">주소</td>
		<td>
			<input type="hidden" name="mem_zip" />
			<input type="text" name="mem_zip1" id="mem_zip1" size="3" value="" /> - 
			<input type="text" name="mem_zip2" id="mem_zip2" size="3" value="" />
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--accent">우편번호검색</button><br>
			<input type="text" name="mem_add1" id="mem_add1" value="" />
			<input type="text" name="mem_add2" id="mem_add2" value="" />
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">직 업</td>
		<td>
			<input type="text" name="mem_job" value=""/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	<tr>
		<td class="fieldName" width="100px" height="25">취 미</td>
		<td>
			<input type="text" name="mem_like" value=""/>
		</td>
	</tr>
	<tr><td class="tLine" colspan="2"></td></tr>
	
	<tr><td colspan="2" height="20"></td></tr>
	
	<tr>
		<td class="btnGroup" colspan="2" >
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn1" type="submit">수정하기</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn2" type="reset">취소</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn3" type="button">삭제</button>
			<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" id="btn4" type="button">목록</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>








