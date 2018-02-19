package kr.or.ddit.controller.member;

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
/**
 * @Class Name :DeleteMemberServlet.java
 * @Description : 회원 비활성화
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
public class DeleteMemberServlet extends HttpServlet {
	
	
	
	@Override
	/**
	 * 선택된 회원의 비활성화(탈퇴)처리를 위해 회원의 아이디를 취득 및 전송
	 * @param javax.servlet.http.HttpServletRequest
	 * @param javax.servlet.http.HttpServletResponse
	 * @return 
	 * @throws javax.servlet.ServletException
	 * @throws java.io.IOException
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String mem_id = request.getParameter("mem_id");
		
		Map<String,String> params = new HashMap<String,String>();
		params.put("mem_id",mem_id);
		
		IMemberService service = IMemberServiceImpl.getInstance();
		
		service.deleteMemberInfo(params);
		response.sendRedirect("/ServletToddler/join/loginForm");
		
		
		
	}
	
	
	
}
