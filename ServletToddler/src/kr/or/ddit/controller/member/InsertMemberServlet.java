package kr.or.ddit.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.member.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;
/**
 * @Class Name :InsertMemberServlet .java
 * @Description : 회원 추가
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
public class InsertMemberServlet extends HttpServlet {
	
	
	@Override
	/**
	 * 추가할 회원의 정보 취득 및 전송
	 * @param javax.servlet.http.HttpServletRequest
	 * @param javax.servlet.http.HttpServletResponse
	 * @throws javax.servlet.ServletException
	 * @throws java.io.IOException
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		MemberVO memberInfo = new MemberVO();
		try {
			BeanUtils.populate(memberInfo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		IMemberService service = IMemberServiceImpl.getInstance();
		service.insertMemberInfo(memberInfo);
		
		// 리다이렉트: 서버로의 요청의 출발점이 클라이언트(브라우저)
		//			response.sendRedirect("/ServletToddler/member/memberList");
		// 포워드 : 서버로의 요청의 출발점이 서버
		//            *ServletPath 구성시 컨텍스트 패스는 제외
		//				request.getRequestDispatcher("/member/memberList");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/member/memberList");
		dispatcher.forward(request, response);
		
		
		
		
		
		
		/*
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		 */		
		
		
		
		
		
		
	}


	
	
	
	
}
