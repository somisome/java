<%--==============================================================
 * 회원관리연습 - 로그인 정보 (아이디, 패스워드) 체크
 * @author 윤소미
 * @since  2018.02.22.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.03.15.  윤소미      최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
===============================================================--%>

<%@page import="kr.or.ddit.utils.CryptoGenerator"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.service.member.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.service.member.IMemberService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mem_id = request.getParameter("mem_id");
	//암호문을 세션 내 저장된 비밀키를 활용해서 평문으로 변경
	mem_id = CryptoGenerator.decryptoRSA(session, mem_id);
	
	String mem_pass = request.getParameter("mem_pass");
	mem_pass = CryptoGenerator.decryptoRSA(session, mem_pass);
	
	Map<String, String> params=new HashMap<String,String>();
	
	params.put("mem_id",mem_id);
	params.put("mem_pass",mem_pass);
	
	IMemberService service = IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.getMemberInfo(params);
	
	if(memberInfo ==null){
		String message = URLEncoder.encode("회원이 아닙니다","UTF-8");
		response.sendRedirect(request.getContextPath()+"/11/loginForm.jsp?message="+message);
	}else{
		session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
		response.sendRedirect(request.getContextPath()+"/12/main.jsp");
		
		
	}
	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/validation.js"></script>
<script>
// 	$(function(){
// 	})
	
</script>
</head>
<body>

</body>
</html>