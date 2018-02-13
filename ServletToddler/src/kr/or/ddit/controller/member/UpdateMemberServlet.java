package kr.or.ddit.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.member.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

public class UpdateMemberServlet extends HttpServlet {
	//   /ServletToddler/member/updateMemberInfo
	//	패킷: ?mem_id=a001&mem_pass=asdfasdf&mem_name=김은대&mem_regno1=111.....
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//클라이언트 전송방식 GET파라메터 인코딩 설정 : server.xml URIEncoding="UTF-8" 설정
		//클라이언트 전송방식 POST파라메터 인코딩 설정 :
		request.setCharacterEncoding("UTF-8");
		
		//http://commons.apache.org/
		//https://commons.apache.org/
		//commons-beanutils-1.8.3.jar
		//commons-logging-1.1.1.jar
		//다운로드후 WEB-INF/lib import
		//클라이언트에서 서버로 대량 전송되는 파라메터 맵핑 VO대상으로 실행
		
		MemberVO memberInfo = new MemberVO();
		try {
			//	request 파라메터: ?mem_id=a001&mem_pass=asdfasdf&mem_name=김은대&mem_regno1=111.....
			//	request.getParameterMap()=> HashMap 키	, 	값
			//									mem_id	=	a001
			//									mem_pass=	asdfasdf
			//	VO 내 HashMap의 키와 동일한 전역변수가 선언되어 있고 setter가 존재하면, 
			//	HashMap의 해당 키의 값을 setter를 통해 맵핑
			
			BeanUtils.populate(memberInfo, request.getParameterMap());
		
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		IMemberService service = IMemberServiceImpl.getInstance();
		service.updateMemberInfo(memberInfo);
		
		response.sendRedirect("/ServletToddler/member/memberList");
	
	
	
	}
	
	
	
	
}


/*
		String mem_id= request.getParameter("mem_id");
		String mem_pass= request.getParameter("mem_pass");
		String mem_name= request.getParameter("mem_name");
		String mem_regno1= request.getParameter("mem_regno1");
		String mem_regno2= request.getParameter("mem_regno2");
//		String mem_= request.getParameter("mem_");
		
		
		MemberVO memberInfo = new MemberVO();
		memberInfo.setMem_id(mem_id);
		memberInfo.setMem_pass(mem_pass);
		
		위와 같은 방법 있지만 너무 길고 번잡하니까 다른 방법을 모색하도록 하자.
		
 */


/*		
		Map<String,String> params = new HashMap<String,String>();
		params.put("mem_id", mem_id);
		
		IMemberService service = IMemberServiceImpl.getInstance();
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
 */