package kr.or.ddit.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.member.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

	//브라우저	------------------------>	서버
	//	전송방식 : GET				doGet() 콜백
	//							/ServletToddler/join/loginCheck?mem_id=a001&mem_pass=asdfasdf
	//	전송방식 : POST				doPost() 콜백
	//							/ServletToddler/join/loginCheck
	//							전송패킷 내 : ?mem_id=a001&mem_pass=asdfasdf
	//	전송방식 GET일때 브라우저별 전송 파라메터의 총 사이즈
	//		IE: 2048byte
	//		Firefox, Chrome, Safari: 100kb
	//		Opera : 200kb
	//	전송방식 POST일때 브라우저별 전송 파라메터의 총 사이즈
	//		브라우저 관계없이 무한대. ex) 브라우저의 파일업로드시에 활용
	//								보호해야할 정보를 서버 전송시 활용
	//	클라이언트의 요청시 전송방식 구분
	// 	GET: 	<form/> default method="GET"
	//			<a href ="url"/>
	//			location.href = "url"
	//			location.replace("url")
	//			ajax(type:get)
	//			브라우저 주소창 직접 URL입력
	// 	POST: 	<form method ="POST"/>
	//			ajax(type:post)
public class MemberListServlet extends HttpServlet {

	//브라우저가 요청시 전송방식(GET or POST)과는 상관없이 콜백되는 메서드.
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		IMemberService service = IMemberServiceImpl.getInstance();
		List<MemberVO> memberList = service.getMemberList();
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		
		out.println("<!DOCTYPE html>                                                                     ");
		out.println("<html>                                                                              ");
		out.println("<head>                                                                              ");
		out.println("<meta charset='UTF-8'>                                                              ");
		out.println("<title>Insert title here</title>                                                    ");
		
		
		
		out.println("</head>                                                                             ");
		out.println("<body>       ");
		
		out.println("<table>                            ");
		out.println("<thead>                            ");
		out.println("	<tr>                           ");
		out.println("		<th>아이디</th>            ");
		out.println("		<th>이름</th>              ");
		out.println("		<th>주민등록번호</th>      ");
		out.println("		<th>직업</th>              ");
		out.println("		<th>취미</th>              ");
		out.println("	</tr>                          ");
		out.println("</thead>                           ");
		out.println("<tbody>                            ");
		
		for(MemberVO memberInfo: memberList){
			out.println("	<tr>                           ");
			out.println("		<td><a href='/ServletToddler/member/memberView?mem_id="+memberInfo.getMem_id()+"'>"+memberInfo.getMem_id()+"</a></td>                  ");
			out.println("		<td>"+memberInfo.getMem_name()+"</td>                  ");
			out.println("		<td>"+memberInfo.getMem_regno1()+"</td>                  ");
			out.println("		<td>"+memberInfo.getMem_job()+"</td>                  ");
			out.println("		<td>"+memberInfo.getMem_like()+"</td>                  ");
			out.println("	</tr>                          ");
		}
		
		out.println("</tbody>                           ");
		out.println("</table>                           ");
		
		out.println("</body>                                                                             ");
		out.println("</html>                                                                             ");
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
	
	
	
	
}











