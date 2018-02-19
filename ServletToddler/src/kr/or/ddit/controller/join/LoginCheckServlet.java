package kr.or.ddit.controller.join;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.member.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

// URL: http://localhost/ServletToddler/join/loginCheck
//http://localhost/ServletToddler/join/loginCheck?mem_id=123123&mem_pass=456456
// 서블릿패스: join/loginCheck?mem_id=123123&mem_pass=456456
/**
 * @Class Name : LoginCheckServlet.java
 * @Description : 로그인 아이디, 패스워드 체크
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
public class LoginCheckServlet extends HttpServlet {

	
	/**
	 * 취득한 아이디와 패스워드가 DB에 존재하는지 검증
	 * @param javax.servlet.http.HttpServletRequest
	 * @param javax.servlet.http.HttpServletResponse
	 * @return 
	 * @throws javax.servlet.ServletException
	 * @throws java.io.IOException
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mem_id = request.getParameter("mem_id");
		String mem_pass = request.getParameter("mem_pass");
		
		Map<String,String> params = new HashMap<String,String>();
		params.put("mem_id",mem_id);
		params.put("mem_pass",mem_pass);
		
		//	클라이언트로부터 전송된 파라메터 취득-servlet
		//	RDBMS 대상 커넥션 취득 - ibatis
		//	쿼리완성 - ibatis
		//	쿼리질의 - dao
		//	쿼리결과 - ibatis
		//	회원여부 검증 - servlet
		//	조건처리(회원일때, 아닐때) - servlet
		
		//LoginCheckServlet 
		//service(비지니스로직)에서 처리할 부분
		//	클라이언트의 요청 처리를 위해 서버 내 특정자원에 접근, 정보 취득
		//	클라이언트의 요청 처리를 위해 서버 내 특정자원에 접근, 저장
		//	클라이언트의 요청 처리를 위해 다른 원격지 서버에 접근, 정보 취득
		
		//Controller(servlet)		service			dao						ibatis
		// 	파라메터 취득				비지니스로직		쿼리질의					커넥션
		//	회원여부검증														쿼리완성
		//	조건처리(회원, 비회원)												쿼리결과(반환)
		IMemberService service = IMemberServiceImpl.getInstance();
		
		MemberVO memberInfo = service.getMemberInfo(params);
		
		if(memberInfo==null){
			//회원아님
			//브라우저 : 브라우저야 내가 응답으로 전송한 주소를 활용해서 서버로 요청을 다시 해줘..
			String message = URLEncoder.encode("회원이 아닙니다.","UTF-8");
			
			response.sendRedirect("/ServletToddler/join/loginForm?message="+message);
//			response.sendRedirect("http://localhost/ServletToddler/join/loginForm");
		}else{
			//회원
			response.sendRedirect("/ServletToddler/member/memberList");
		}
		
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}
	
}











