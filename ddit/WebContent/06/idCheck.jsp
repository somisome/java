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
	
	List<MemberVO> memberList = service.getMemberList();

	Map<String,String> resultSet=new HashMap<String,String>();
	if(memberInfo==null){
		resultSet.put("flag", "true");
	}else{
		resultSet.put("flag", "false");
	}
	
	ObjectMapper mapper = new ObjectMapper();
	String result = mapper.writeValueAsString(resultSet);
	
	out.println(result);
	
%>

