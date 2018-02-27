<%@page import="kr.or.ddit.vo.ProdVO"%>
<%@page import="kr.or.ddit.service.prod.IProdServiceImpl"%>
<%@page import="kr.or.ddit.service.prod.IProdService"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String prod_buyer = request.getParameter("prod_buyer");
	Map<String,String> params = new HashMap<String,String>();
	params.put("prod_buyer",prod_buyer);
	IProdService service = IProdServiceImpl.getInstance();
	
	
	ProdVO prodInfo = service.getProdInfo(params);

	
	
	
	
	Map<String,String> resultSet=new HashMap<String,String>();
	if(prodInfo==null){
		resultSet.put("flag", "사용이 가능한 거래처코드 입니다.");
	}else{
		resultSet.put("flag", "중복되는 거래처코드 입니다.");
	}
	
	ObjectMapper mapper = new ObjectMapper();
	String result = mapper.writeValueAsString(resultSet);
	
	out.println(result);
	
%>

