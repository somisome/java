package kr.or.ddit.controller.hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
* @Class Name : HelloServlet.java
* @Description : Hello! World! 출력
* @Modification Information
* @author 윤소미
* @since  2018.02.19.
* @version 1.0
* @see javax.servlet.http.HttpServlet
* <pre>
* << 개정이력(Modification Information) >>
*    수정일    	    수정자          수정내용
*    -------      -------     -------------------
*    2018.02.19.  윤소미          최초작성
* Copyright (c) 2018 by DDIT  All right reserved
* </pre>
*/
public class HelloServlet extends HttpServlet {
	//		http://localhost/ServletToddler/hello		서버
	//												Apache		Tomcat
	//												 html		servlet
	//												(정적)		 (동적)
	//												Coyote엔진	Catalina엔진
	// 브라우저 ----------request--------------->		  X		--->   O 
	//	\											web.xml		HelloServlet 컴파일
	//	 \														HelloServlet 인스턴스화	
	//	  \														HelloServlet 내 doGet() 호출
	//	   \													동적인 컨텐츠(""+javascript+html)  다 문자열임
	//		\_-<---_-_-_-_-_-_response_-_-_-<-_-_-_-_-<-_-_-_-_-_-<----___/
	//														
	
	/**
	 * Hello!World! 출력
	 * @param javax.servlet.http.HttpServletRequest
	 * @param javax.servlet.http.HttpServletResponse
	 * @throws javax.servlet.ServletException
	 * @throws java.io.IOException
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//응답전송 컨텐츠 저장소 설정
		response.setCharacterEncoding("UTF-8");
		//브라우저 
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<body>");
		out.println("Hello! World!");
		out.println(":D");
		out.println("</body>");
		out.println("</html>");
		
	}
	
}
