<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="kr.or.ddit.vo.ZipcodeVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.service.zipcode.IZipcodeServiceImpl"%>
<%@page import="kr.or.ddit.service.zipcode.IZipcodeService"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	
	String dong = request.getParameter("dong");
	
	Map<String, String> params = new HashMap<String, String>();
	params.put("dong", dong);
	
	IZipcodeService service = IZipcodeServiceImpl.getInstance();
	
	List<ZipcodeVO> zipcodeList = service.getZipcodeList(params);
	
	ObjectMapper mapper = new ObjectMapper();
	
	String jsonData = mapper.writeValueAsString(zipcodeList);
	
	out.println(jsonData);
%>