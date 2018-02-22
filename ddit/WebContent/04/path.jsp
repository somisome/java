<%--==============================================================
 * 상대경로, 절대경로 연습
 * @author 윤소미
 * @since  2018.02.22.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.22.  윤소미      최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
===============================================================--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- C:\Users\Administrator\Desktop\웹기반어플리케이션\JSP\제공레이아웃(회원테이블_회원관리) 
전부 복붙에서 05폴더에넣고, 에러나는 파일 하나 삭제했음

C:\Users\Administrator\Desktop\웹기반어플리케이션\JSP\제공레이아웃(관리자)\image
image폴더 WebContent안에 붙여넣음

-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	절대경로: 경로표현의 시작이 컨텍스트 루트|패스
			/ddit/04/appliaction.jsp
			/ddit/image/ddit.jpg
			반드시 /로 시작
			
	상대경로: 경로표현의 시작이 해당 jsp
			application.jsp
			../image/ddit.jpg
			./image/ddit.jpg   
			
			현재위치 ./
			한단계 위 ../
			두단계 위 ../../		
 -->
 절대경로<br>
 <img src ="/ddit/image/ddit.jpg"  alt="" style="width: 200px; height:150px;"/><br>
 
 <br>상위폴더<br>
 <img src ="../image/ddit.jpg"  alt="" style="width: 200px; height:150px;"/><br>
 <br>하위폴더(자기폴더소속)<br>
 <img src ="./image/ddit.jpg" alt="" style="width: 200px; height:150px;"/><br>
 
</body>
</html>





