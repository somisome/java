<%--==============================================================
 * 회원관리 연습 - memberList에서 선택된 회원 정보 출력 및 수정(업데이트) 
 * @author 윤소미
 * @since  2018.02.23.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.23.  윤소미      최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
===============================================================--%>

<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.service.member.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.service.member.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// main.jsp <jsp:include page="/05/memberView.jsp?mem_id=1001"/>
	String mem_id=request.getParameter("mem_id");
	
	Map<String, String> params = new HashMap<String, String>();
	
	params.put("mem_id",mem_id);
	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.getMemberInfo(params);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.fieldName {text-align: center; background-color: #f4f4f4;}
.tLine {background-color: #d2d2d2; height: 1px;}
.btnGroup { text-align: right; }
td {text-align: left; }
</style>
<body>
<form action="<%=request.getContextPath()%>/05/updateMemberInfo.jsp" name="memberViewForm" method="post">
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
		<td class="fieldName" width="100px" height="25">회사전화번호</td>
		<td>
			<div>
			<input type="hidden" name="mem_comtel"/>
			<select name="mem_comtel1">
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
			<input type="text" name="mem_comtel2" size="4" value="" /> - 
			<input type="text" name="mem_comtel3" size="4" value="" />
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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/validation.js"></script>
<script type="text/javascript">
	$(function(){
		
		$('input[name=mem_name]').val('<%=memberInfo.getMem_name()%>');		
		$('input[name=mem_regno1]').val('<%=memberInfo.getMem_regno1()%>');		
		$('input[name=mem_regno2]').val('<%=memberInfo.getMem_regno2()%>');	
		
		
		//1976-01-15
		//[0] : 1976
		//[1] : 01
		//[2] : 15
		$('input[name=mem_bir1]').val('<%=(memberInfo.getMem_bir()!=null) ? memberInfo.getMem_bir().split("-")[0] : ""%>');		
		$('input[name=mem_bir2]').val('<%=(memberInfo.getMem_bir()!=null) ? memberInfo.getMem_bir().split("-")[1] : ""%>');		
		$('input[name=mem_bir3]').val('<%=(memberInfo.getMem_bir()!=null) ? (memberInfo.getMem_bir().split("-")[2]).substring(0,2) : ""%>');		
		
		$('input[name=mem_id]').val('<%=memberInfo.getMem_id()%>');		
		$('input[name=mem_pass]').val('<%=memberInfo.getMem_pass()%>');
		
		//042-621-4615
		var hometel='<%=memberInfo.getMem_hometel()%>';		
		var opts = document.memberViewForm.mem_hometel1;
		for(var i=0; i<opts.length ; i++){
			if(opts[i].value == hometel.split('-')[0]){
				opts[i].selected='selected';
			}
		}
		$('input[name=mem_hometel2]').val(hometel.split('-')[1]);		
		$('input[name=mem_hometel3]').val(hometel.split('-')[2]);		

		//042-111-1111
		var comtel='<%=memberInfo.getMem_comtel()%>';
		$('select[name=mem_comtel1] option[value="'+comtel.split('-')[0]+'"]').attr('selected',true);
		$('input[name=mem_comtel2]').val(comtel.split('-')[1]);		
		$('input[name=mem_comtel3]').val(comtel.split('-')[2]);		
		
		var hp='<%=memberInfo.getMem_hp()%>';
		$('select[name=mem_hp1] option[value="'+hp.split('-')[0]+'"]').attr('selected',true);
		$('input[name=mem_hp2]').val(hp.split('-')[1]);		
		$('input[name=mem_hp3]').val(hp.split('-')[2]);		
		
		var em='<%=memberInfo.getMem_mail()%>';
		$('input[name=mem_mail1]').val(em.split('@')[0]);		
		$('select[name=mem_mail2] option[value="'+em.split('-')[1]+'"]').attr('selected',true);
		
		
		var zip ='<%=memberInfo.getMem_zip()%>';
		$('input[name=mem_zip1]').val(zip.split('-')[0]);		
		$('input[name=mem_zip2]').val(zip.split('-')[1]);		
		
		$('input[name=mem_add1]').val('<%=memberInfo.getMem_add1()%>');		
		$('input[name=mem_add2]').val('<%=memberInfo.getMem_add2()%>');		
		
		$('input[name=mem_job]').val('<%=memberInfo.getMem_job()%>');		
		$('input[name=mem_like]').val('<%=memberInfo.getMem_like()%>');		
		
		
		$('form[name=memberViewForm]').submit(function(){
			$(this).append('<input type="hidden" name="mem_id" value="<%=memberInfo.getMem_id()%>"></input>');
			if(!$('input[name=mem_pass]').val().validationPWD()){
				return stopSubmit('비밀번호를 바르게 입력해주세요.');
			}
			if($('input[name=mem_pass]').val()!=$('input[name=mem_pass_confirm]').val()){
				return stopSubmit('비밀번호를 확인해주세요.');
			}
			
			
			
			var ht = $('select[name=mem_hometel1]').val()+'-'+$('input[name=mem_hometel2]').val()+'-'+$('input[name=mem_hometel3]').val();
			$('input[name=mem_hometel]').val(ht);
			if(!$('input[name=mem_hometel]').val().validationHOMETEL()){
				return stopSubmit('전화번호를 바르게 입력해주세요.');
			}
			
			var ct = $('select[name=mem_comtel1]').val()+'-'+$('input[name=mem_comtel2]').val()+'-'+$('input[name=mem_comtel3]').val();
			$('input[name=mem_comtel]').val(ct);
			if(!$('input[name=mem_comtel]').val().validationCOMTEL()){
				return stopSubmit('회사전화번호를 바르게 입력해주세요.');
			}

			var ht = $('select[name=mem_hp1]').val()+'-'+$('input[name=mem_hp2]').val()+'-'+$('input[name=mem_hp3]').val();
			$('input[name=mem_hp]').val(ht);
			if(!$('input[name=mem_hp]').val().validationHP()){
				return stopSubmit('휴대폰 번호를 바르게 입력해주세요.');
			}
			
			var em = $('input[name=mem_mail1]').val()+'@'+$('select[name=mem_mail2]').val();
			$('input[name=mem_mail]').val(em);
			if(!$('input[name=mem_mail]').val().validationMAIL()){
				return stopSubmit('이메일주소를 바르게 입력해주세요.');
			}
			
			$('input[name=mem_zip]').val($('input[name=mem_zip1]').val()+'-'+$('input[name=mem_zip2]').val());
			if(!$('input[name=mem_zip]').val().validationZIPCODE()){
				return stopSubmit('우편번호를 바르게 입력해주세요.');
			}
			return true;
		});
	});
	
	function stopSubmit(message){
		alert(message);		
		return false;
	}
</script>
</html>








