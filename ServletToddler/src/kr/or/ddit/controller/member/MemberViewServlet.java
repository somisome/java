package kr.or.ddit.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.service.member.IMemberService;
import kr.or.ddit.service.member.IMemberServiceImpl;
import kr.or.ddit.vo.MemberVO;

public class MemberViewServlet extends HttpServlet {
	//http://localhost/ServletToddler/member/memberView?mem_id=a001
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mem_id= request.getParameter("mem_id");
		Map<String,String> params = new HashMap<String,String>();
		params.put("mem_id", mem_id);
		
		IMemberService service = IMemberServiceImpl.getInstance();
		MemberVO memberInfo = service.getMemberInfo(params);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		
		// - HTML Tag에 disabled='disabled' 설정 시 해당 값이 랜더링되어 출력은 되지만 값은 서버로 미전송.
		// - HTML Tag에 type='hidden'설정 시 해당값이 미출력되지만 값은 서버로 전송.
		out.println("<!DOCTYPE html>                             "); 
		out.println("<html>                                      "); 
		out.println("<head>                                      "); 
		out.println("<meta charset='UTF-8'>                      "); 
		out.println("<title>Insert title here</title>            "); 
		out.println("</head>                                     "); 
		out.println("<body>                                      "); 
		out.println("<form action='/ServletToddler/member/updateMemberInfo' name='updateMemberForm' method='POST'>"); 
		
		out.println("<input type='hidden' name='mem_id' value='"+memberInfo.getMem_id()+"'/>");
		
		out.println("			<table>                                                                          "); 
		out.println("	<tr>                                                                                     "); 
		out.println("		<td>아이디</td>                                                                      "); 
		out.println("		<td><input type='text' name='mem_id' disabled='disabled' value='"+memberInfo.getMem_id()+"' /></td>     "); 
		out.println("	</tr>                                                                                    "); 
		out.println("	<tr>                                                                                     "); 
		out.println("		<td>패스워드</td>                                                                    "); 
		out.println("		<td><input type='text' name='mem_pass' value='"+memberInfo.getMem_pass()+"' /></td>   "); 
		out.println("	</tr>                                                                                    "); 
		out.println("	<tr>                                                                                     "); 
		out.println("		<td>이름</td>                                                                        "); 
		out.println("		<td><input type='text' name='mem_name' disabled='disabled' value='"+memberInfo.getMem_name()+"' /></td>     "); 
		out.println("	</tr>                                                                                    "); 
		out.println("	<tr>                                                                                     "); 
		out.println("		<td>주민번호</td>                                                                    "); 
		out.println("		<td>                                                                                 "); 
		out.println("			<input type='text' name='mem_regno1' disabled='disabled' value='"+memberInfo.getMem_regno1()+"' />-    "); 
		out.println("			<input type='text' name='mem_regno2' disabled='disabled' value='"+memberInfo.getMem_regno2()+"' />     "); 
		out.println("		</td>                                                                                "); 
		out.println("	</tr>                                                                                    "); 
		out.println("	<tr>                                                                                     "); 
		out.println("		<td>주소</td>                                                                        "); 
		out.println("		<td>                                                                                 "); 
		out.println("			<input type='text' name='mem_add1' value='"+memberInfo.getMem_add1()+"' />        "); 
		out.println("			<input type='text' name='mem_add2' value='"+memberInfo.getMem_add2()+"' />        "); 
		out.println("		</td>                                                                                "); 
		out.println("	</tr>                                                                                    "); 
		out.println("	<tr>                                                                                     "); 
		out.println("		<td>집전화번호</td>                                                                  "); 
		out.println("		<td><input type='text' name='mem_hometel' value='"+memberInfo.getMem_hometel()+"' /></td>"); 
		out.println("	</tr>                                                                                    "); 
		out.println("	<tr>                                                                                     "); 
		out.println("		<td>회사전화번호</td>                                                                "); 
		out.println("		<td><input type='text' name='mem_comtel' value='"+memberInfo.getMem_comtel()+"' /></td> "); 
		out.println("	</tr>                                                                                    "); 
		out.println("	<tr>                                                                                     "); 
		out.println("		<td>휴대폰</td>                                                                      "); 
		out.println("		<td><input type='text' name='mem_hp' value='"+memberInfo.getMem_hp()+"' /></td>         "); 
		out.println("	</tr>                                                                                    "); 
		out.println("	<tr>                                                                                     "); 
		out.println("		<td>직업</td>                                                                        "); 
		out.println("			<td><input type='text' name='mem_job' value='"+memberInfo.getMem_job()+"' /></td>   "); 
		out.println("				</tr>                                                                       "); 
		out.println("				<tr>                                                                      "); 
		out.println("					<td>취미</td>                                                         "); 
		out.println("			<td><input type='text' name='mem_like' value='"+memberInfo.getMem_like()+"' /></td>  "); 
		out.println("				</tr>                                                                       "); 
		out.println("				<tr>                                                                          "); 
		out.println("					<td colspan='2'>                                                  "); 
		out.println("						<input type='submit' value='회원정보수정' />                         "); 
		out.println("						<input type='button' value='회원탈퇴' />                                "); 
		out.println("					</td>                                                                    "); 
		out.println("				</tr>                                                                      "); 
		out.println("				                                                                           "); 
		out.println("			</table>                                                                         "); 
		out.println("		</form>                                                                            "); 
		out.println("</body>                                                                                      "); 
		out.println("</html>                                                                     ");
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
	
	
	
	
	
}











