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
	//contentType 에 올 수 있는 옵션
//	contentType="text/html;" or "text/xml;" or "text/plain;"
//plain은 그저 문자열로 인식

// 	
	String mem_id = request.getParameter("mem_id");
	Map<String,String> params = new HashMap<String,String>();
	params.put("mem_id",mem_id);
	
	IMemberService service=IMemberServiceImpl.getInstance();
	MemberVO memberInfo = service.getMemberInfo(params);
	
	List<MemberVO> memberList = service.getMemberList();
	
	//{flag:true} or {flag:false}
	// 하단의 방법은 문자열이 길고 복잡할 경우 쓰기가 어려움
// 	String result = "{flag: ";
// 	if(memberInfo==null){
// 		result+="true}";
// 	}else{
// 		result+="false}";
// 	}
	//객체 <==> Json 형신의 문자열 변환 라이브러리
	//1. 다운로드
	// http://search.maven.org/
	// 
	//jackson-core 검색
	//org.codehaus.jackson	jackson-core-asl   	1.9.13  jar 다운로드
	//jackson-mapper 검색
	//org.codehaus.jackson	jackson-mapper-asl	1.9.13  jar 다운로드
	//2.WEB-INF/lib에 import(복붙)
	Map<String,String> jsonMap=new HashMap<String,String>();
	if(memberInfo==null){
		jsonMap.put("flag", "true");
	}else{
		jsonMap.put("flag", "false");
	}
	
	ObjectMapper mapper = new ObjectMapper();
	//MemberVO=>json형식 문자열 변환
	String memberInfoJsonData = mapper.writeValueAsString(memberInfo);
	application.log("memberInfoJsonData: "+memberInfoJsonData);
	
	//List<MemberVO> => json형식문자열변환
	String memberListJsonData = mapper.writeValueAsString(memberList);
	application.log("memberListJsonData: "+memberListJsonData);
	
	//Map<String,String> =>json형식문자열변환
	String result = mapper.writeValueAsString(jsonMap);
	application.log("result: "+result);
	
	out.println(result);
	
%>