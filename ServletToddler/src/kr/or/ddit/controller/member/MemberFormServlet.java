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

public class MemberFormServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		IMemberService service = IMemberServiceImpl.getInstance();
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		
		
		request.setCharacterEncoding("UTF-8");

		
		MemberVO memberInfo = new MemberVO();
//		try {
//			BeanUtils.populate(memberInfo, request.getParameterMap());
//		} catch (IllegalAccessException e) {
//			e.printStackTrace();
//		} catch (InvocationTargetException e) {
//			e.printStackTrace();
//		}
//		
//		service.updateMemberInfo(memberInfo);
//		
//		response.sendRedirect("/ServletToddler/member/memberList");
//		
		
		
		
		
		
		
		
		
		
		out.println("<!DOCTYPE html>                             "); 
		out.println("<html>                                      "); 
		out.println("<head>                                      "); 
		out.println("<meta charset='UTF-8'>                      "); 
		out.println("<title>Insert title here</title>            "); 
		
		out.println(" <script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>      ");
		out.println("<script type='text/javascript' src='/ServletToddler/js/validation.js'></script>  ");
		
		out.println("<script type='text/javascript'>");
		
		out.println("$(function(){");
		
		out.println("$('form[name=memberForm]').submit(function(){                                    ");
		
		out.println("	if(!$('input[name=mem_id]').val().validationID()){                   ");
		out.println("		alert('아이디는 알파벳 소문자로 시작된 숫자 3개 조합으로 입력해주세요.');            ");
		out.println("		return false;                                                            ");
		out.println("	}                                                                            ");
		
		out.println("	if(!$('input[name=mem_pass]').val().validationPWD()){                ");
		out.println("		alert('패스워드는 알파벳 소문자와 숫자로 조합되어 최소4, 최대10개 글자로 입력해주세요.');");
		out.println("		return false;                                                            ");
		out.println("	}                                                                            ");

		out.println("	if(!$('input[name=mem_name]').val().validationNM()){                ");
		out.println("		alert('이름은 최소2, 최대4자 한글로 입력해주세요.');");
		out.println("		return false;                                                            ");
		out.println("	}                                                                            ");
		
		out.println("	var regon = $('input[name=mem_regno1]').val()+'-'+$('input[name=mem_regno2]').val()         ");
		out.println("	if(!regno.validationREGNO()){                ");
		out.println("		alert('올바른 주민등록 번호를 입력해주세요');");
		out.println("		return false;                                                            ");
		out.println("	}                                                                            ");
		
		out.println("	if(!$('input[name=mem_zip]').val().validationZIPCODE()){                ");
		out.println("		alert('우편번호를 바르게 입력해주세요.');");
		out.println("		return false;                                                            ");
		out.println("	}                                                                            ");
		
		out.println("	if(!$('input[name=mem_hometel]').val().validationHOMETEL()){                ");
		out.println("		alert('집전화를 바르게 입력해주세요.');");
		out.println("		return false;                                                            ");
		out.println("	}                                                                            ");
		
		out.println("	if(!$('input[name=mem_comtel]').val().validationCOMTEL()){                ");
		out.println("		alert('회사 전화번호를 바르게 입력해주세요.');");
		out.println("		return false;                                                            ");
		out.println("	}                                                                            ");
		
		out.println("	if(!$('input[name=mem_hp]').val().validationHP()){                ");
		out.println("		alert('휴대폰 번호를 바르게 입력해주세요.');");
		out.println("		return false;                                                            ");
		out.println("	}                                                                            ");
		
		
		out.println("	if(!$('input[name=mem_mail]').val().validationMAIL()){                ");
		out.println("		alert('메일 주소를 바르게 입력해주세요.');");
		out.println("		return false;                                                            ");
		out.println("	}                                                                            ");
		
		
		
		out.println("	return true;                                                                 ");
		out.println("});                                                                             ");
		out.println("})");
		
		out.println("</script>                  ");
		
		
		
		
		//$('input[name=mem_regno1]').val()+'-'+$('input[name=mem_regno2]').val()
		
		
		out.println("</head>                                     "); 
		out.println("<body>                                      "); 
		out.println("<form action='/ServletToddler/member/insertMemberInfo' name='memberForm' method='POST'>"); 
		
		out.println("			<table>                                                                          "); 
		out.println("	<tr>                                                                                     "); 
		out.println("		<td>아이디</td>                                                                      "); 
		out.println("		<td><input type='text' name='mem_id'/></td>     "); 
		out.println("	</tr>                                                                                    "); 
		out.println("	<tr>                                                                                     "); 
		out.println("		<td>패스워드</td>                                                                    "); 
		out.println("		<td><input type='text' name='mem_pass'  /></td>   "); 
		out.println("	</tr>                                                                                    "); 
		out.println("	<tr>                                                                                     "); 
		out.println("		<td>이름</td>                                                                        "); 
		out.println("		<td><input type='text' name='mem_name' /></td>     "); 
		out.println("	</tr>                                                                                    "); 
		out.println("	<tr>                                                                                     "); 
		out.println("		<td>주민번호</td>                                                                    "); 
		out.println("		<td>                                                                                 "); 
		out.println("			<input type='text' name='mem_regno1' />-    "); 
		out.println("			<input type='text' name='mem_regno2' />     "); 
		out.println("		</td>                                                                                "); 
		out.println("	</tr>                                                                                    "); 
		
		out.println("	<tr>                                                                                     "); 
		out.println("		<td>메일</td>                                                                    "); 
		out.println("		<td>                                                                                 "); 
		out.println("			<input type='text' name='mem_mail' />    "); 
		out.println("		</td>                                                                                "); 
		out.println("	</tr>                                                                                    "); 

		out.println("	<tr>                                                                                     "); 
		out.println("		<td>우편번호</td>                                                                    "); 
		out.println("		<td>                                                                                 "); 
		out.println("			<input type='text' name='mem_zip' />    "); 
		out.println("		</td>                                                                                "); 
		out.println("	</tr>                                                                                    "); 
		
		
		out.println("	<tr>                                                                                     "); 
		out.println("		<td>주소</td>                                                                        "); 
		out.println("		<td>                                                                                 "); 
		out.println("			<input type='text' name='mem_add1'  />        "); 
		out.println("			<input type='text' name='mem_add2' />        "); 
		out.println("		</td>                                                                                "); 
		out.println("	</tr>                                                                                    "); 
		out.println("	<tr>                                                                                     "); 
		out.println("		<td>집전화번호</td>                                                                  "); 
		out.println("		<td><input type='text' name='mem_hometel'/></td>"); 
		out.println("	</tr>                                                                                    "); 
		out.println("	<tr>                                                                                     "); 
		out.println("		<td>회사전화번호</td>                                                                "); 
		out.println("		<td><input type='text' name='mem_comtel'/></td> "); 
		out.println("	</tr>                                                                                    "); 
		out.println("	<tr>                                                                                     "); 
		out.println("		<td>휴대폰</td>                                                                      "); 
		out.println("		<td><input type='text' name='mem_hp'  /></td>         "); 
		out.println("	</tr>                                                                                    "); 
		
		out.println("	<tr>                                                                                     "); 
		out.println("		<td>직업</td>                                                                        "); 
		out.println("			<td><input type='text' name='mem_job'/></td>   "); 
		out.println("				</tr>                                                                       "); 
		out.println("				<tr>                                                                      "); 
		out.println("					<td>취미</td>                                                         "); 
		out.println("			<td><input type='text' name='mem_like' /></td>  "); 
		out.println("				</tr>                                                                       "); 
		out.println("				<tr>                                                                          "); 
		out.println("					<td colspan='2'>                                                  "); 
		out.println("						<input type='submit' value='회원가입' />                         "); 
		out.println("					</td>                                                                    "); 
		out.println("				</tr>                                                                      "); 
		out.println("				                                                                           "); 
		out.println("			</table>                                                                         "); 
		out.println("		</form>                                                                            "); 
		out.println("</body>                                                                                      "); 
		out.println("</html>                                                                     ");
		
		
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
















/*out.println("<!DOCTYPE html>                             "); 
out.println("<html>                                      "); 
out.println("<head>                                      "); 
out.println("<meta charset='UTF-8'>                      "); 
out.println("<title>Insert title here</title>            "); 
out.println("</head>                                     "); 
out.println("<body>                                      "); 
out.println("<form action='/ServletToddler/member/memberForm' name='memberForm' method='POST'>"); 

out.println("			<table>                                                                          "); 
out.println("	<tr>                                                                                     "); 
out.println("		<td>아이디</td>                                                                      "); 
out.println("		<td><input type='text' name='mem_id' value='"+memberInfo.getMem_id()+"' /></td>     "); 
out.println("	</tr>                                                                                    "); 
out.println("	<tr>                                                                                     "); 
out.println("		<td>패스워드</td>                                                                    "); 
out.println("		<td><input type='text' name='mem_pass' value='"+memberInfo.getMem_pass()+"' /></td>   "); 
out.println("	</tr>                                                                                    "); 
out.println("	<tr>                                                                                     "); 
out.println("		<td>이름</td>                                                                        "); 
out.println("		<td><input type='text' name='mem_name' value='"+memberInfo.getMem_name()+"' /></td>     "); 
out.println("	</tr>                                                                                    "); 
out.println("	<tr>                                                                                     "); 
out.println("		<td>주민번호</td>                                                                    "); 
out.println("		<td>                                                                                 "); 
out.println("			<input type='text' name='mem_regno1' value='"+memberInfo.getMem_regno1()+"' />-    "); 
out.println("			<input type='text' name='mem_regno2' value='"+memberInfo.getMem_regno2()+"' />     "); 
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
out.println("						<input type='submit' value='회원가입' />                         "); 
out.println("					</td>                                                                    "); 
out.println("				</tr>                                                                      "); 
out.println("				                                                                           "); 
out.println("			</table>                                                                         "); 
out.println("		</form>                                                                            "); 
out.println("</body>                                                                                      "); 
out.println("</html>                                                                     ");

*/
