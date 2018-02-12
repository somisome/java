package kr.or.ddit.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.member.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

public class UpdateMemberServlet extends HttpServlet {
	//   /ServletToddler/member/updateMemberInfo
	//	패킷: ?mem_id=a001&mem_pass=asdfasdf&mem_name=김은대&mem_regno1=111.....
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		//http://commons.apache.org/
		//https://commons.apache.org/
		
		
/*		
		Map<String,String> params = new HashMap<String,String>();
		params.put("mem_id", mem_id);
		
		IMemberService service = IMemberServiceImpl.getInstance();
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
	*/
	
	
	
	
	}
	
	
	
	
}
