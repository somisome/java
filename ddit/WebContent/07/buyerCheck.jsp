<%@page import="kr.or.ddit.vo.BuyerVO"%>
<%@page import="kr.or.ddit.service.buyer.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.service.buyer.IBuyerService"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String buyer_name = request.getParameter("buyer_name");
	
	Map<String, String> params = new HashMap<String, String>();
	params.put("buyer_name", buyer_name);
	
	IBuyerService service = IBuyerServiceImpl.getInstance();
	List<BuyerVO> buyerList = service.getBuyerList(params);
	
	
	ObjectMapper mapper = new ObjectMapper();
	String jsonData = mapper.writeValueAsString(buyerList);
	
	out.println(jsonData);
%>