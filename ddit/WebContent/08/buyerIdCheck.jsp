<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.service.buyer.IBuyerServiceImpl"%>
<%@page import="kr.or.ddit.service.buyer.IBuyerService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String buyer_id = request.getParameter("buyer_id");
	IBuyerService service = IBuyerServiceImpl.getInstance();
	List<String> list = service.getBuyerIdInfo();
	
	boolean res=false;
	for(String buyer : list){
		if(buyer.equals(buyer_id)){
			res=true;
		}
	}
	
	Map<String,String> resultSet=new HashMap<String,String>();
	if(res==true){
		resultSet.put("flag", "이미 사용중인 거래처코드입니다.");
	}else{
		resultSet.put("flag", "신규등록이 가능한 거래처코드입니다.");
	}
	
	ObjectMapper mapper = new ObjectMapper();
	String result = mapper.writeValueAsString(resultSet);
	
	out.println(result);
	
%>