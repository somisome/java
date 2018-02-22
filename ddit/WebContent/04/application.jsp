<%--==============================================================
 * application 연습(application.getInitParameter)
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


<%@page import="java.net.URL"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 	_jspService(request,response){ -->
<%
// 여기서부터 --------------------------------------------------------
	System.out.println("콘솔 방향의 로그 작성");
// _jspService(request,response)내부이기때문에
// 	pageContext.getServletContext()를 쓸 것 없이 아래처럼 쓰면 됨
	//실제 서버 배포 후 서비스 중에 application의 log() 출력되는 메세지는
	//서버설치폴더\logs\ 파일로 출력
	//우리 같은 경우는 D:\B_Util\5.ApacheTomcat\apache-tomcat-7.0.73\logs 여기에 로그들 다 남음
	application.log("출력 정보 레벨의 로그 작성");
// 여기까지---------------------------는 납품전에는 삭제되어야 할 부분이다.
// 콘솔창에 아래와 같이 찍히게 됨
// 콘솔 방향의 로그 작성
// 2월 22, 2018 10:03:48 오전 org.apache.catalina.core.ApplicationContext log
// 정보: 출력 정보 레벨의 로그 작성
// DEBUG, WARNING부분등도 다 삭제하고 납품해야 함
	
	//web.xml에 선언되어져 있는 것 읽어오기
	out.println("oracleDriver: "+application.getInitParameter("oracleDriver")+"<br>");
	out.println("oracleURL: "+application.getInitParameter("oracleURL")+"<br>");
	out.println("mySqlDriver: "+application.getInitParameter("mySqlDriver")+"<br>");
	out.println("mySqlURL: "+application.getInitParameter("mySqlURL")+"<br>");
	
	//D:\workspace(web)\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\ddit\org\apache\jsp\_04\application_jsp.java
	//확인차 찾아들어가 열어봄
	out.println("어플리케이션 배포 위치: "+application.getRealPath("")+"<br>");
	//어플리케이션 배포 위치: D:\workspace(web)\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\ddit
	//브라우저에 같은 경로 출력되는거 볼 수 있음
	
	out.println("서블릿 버전: "+application.getMajorVersion()+"."+application.getMinorVersion()+"<br>");
	//3.0 나옴
	
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br><hr color=pink><br>
<% 
	String buffer="";
	BufferedReader reader = new BufferedReader(
								new InputStreamReader(
										new FileInputStream(
												application.getRealPath("/04/readme.txt")
												),"UTF-8"
										)
							);
	while((buffer = reader.readLine())!=null){
%>
		<%=buffer %><br>		
<% 
	}
	
	out.println("<br><hr color=pink><br>");
	String dummy="";
	//http://localhost/ddit/04/readme.txt

	//여기에 패스를 주면 URL을 만들어 줌
	URL url = application.getResource("/04/readme.txt"); //라고 주면 전체 URL만들어짐
	
	BufferedReader urlReader = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
	
	while((dummy = urlReader.readLine())!=null){	
%>
	<%=dummy %><br>
<% 
	}
%>
</body>
</html>
<!-- } -->







