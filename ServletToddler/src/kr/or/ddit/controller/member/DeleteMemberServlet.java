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

public class DeleteMemberServlet extends HttpServlet {

	@Override
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
