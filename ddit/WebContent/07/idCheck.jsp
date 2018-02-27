<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.vo.MemberVO"%>
<%@page import="kr.or.ddit.service.member.IMemberServiceImpl"%>
<%@page import="kr.or.ddit.service.member.IMemberService"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String mem_id = request.getParameter("mem_id");
	Map<String,String> params = new HashMap<String,String>();
	params.put("mem_id",mem_id);
	
	IMemberService service=IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.getMemberInfo(params);

	Map<String,String> resultSet=new HashMap<String,String>();
	if(memberInfo==null){//중복아이디 없음
		resultSet.put("flag", "사용이 가능한 아이디 입니다.");
	}else{//중복아이디 있음
		resultSet.put("flag", "중복되는 아이디 입니다.");
	}
	
	ObjectMapper mapper = new ObjectMapper();
	String result = mapper.writeValueAsString(resultSet);
	
	out.println(result);
	
%>

