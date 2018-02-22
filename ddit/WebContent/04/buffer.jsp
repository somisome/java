<%--==============================================================
 * buffer - flush, clearBuffer, getBufferSize, getRemaining 연습
 * @author 윤소미
 * @since  2018.02.21.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.21.  윤소미      최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
===============================================================--%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page buffer="1kb" autoFlush="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  
	HttpServletResponse 내 출력버퍼 : 클라이언트에 전송되는 컨텐츠(javascript, html)저장소.
									default 8kb	
									클라이언트 대상 전송(시점) - 출력버퍼에 저장된 컨텐츠는 출력버퍼 사이즈를 넘어선 컨텐츠 저장시.
														  - (8kb 되지 않았지만) 해당 jsp가 jasper엔진을 통해 변경된 서블릿 클래스의 _jspService() 종료시.
									
	
	
	autoFlush = "false" 일때 8kb이상 보내면 에러남 
	그거 실행해봄
-->
<% 
	for(int i=0; i<50; i++){
		out.println("전체 버퍼 사이즈: "+out.getBufferSize()+"<br>");
		out.println("가용 버퍼 사이즈: "+out.getRemaining()+"<br>");
%>
		<p>아무것도 하기 싫다. 아무것도 하고 있지 않지만, 더 격하게 아무것도 하기 싫다 </p> <br>		
<% 
		if(i%5==0){
			//수동 flush(출력버퍼에 저장된 컨텐츠를 클라이언트에 전송 후 출력버퍼 초기화.전송 삭제 모두)
			//out.flush();
			//clearBuffer(출력버퍼에 저장된 컨텐츠를 삭제후 초기화.삭제만)
			out.clearBuffer();
		}
	}
%>
</body>
</html>