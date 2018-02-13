package kr.or.ddit.controller.join;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginFormServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String message = request.getParameter("message");
		
		//	/ServletToddler/join/loginForm
		//	message = null;
		//	/ServletToddler/join/loginForm?message=회원이 아닙니다.
		//	message = 회원이 아닙니다.
		
		//브라우저별  html 태그 랜더링 엔진
		//    IE : 트라이던트
		//    Chrome : 블링크
		//    Safari : 웹킷
		//    Firefox : 겟코
		//    Opera : 프레스토
		//브라우저별 javascript 구문해석 엔진
		//    IE : Chakra
		//    Chrome : V8
		//    Safari : javascript core
		//    Firefox : SpiderMonkey
		//    Opera : karakan
		
		
		//응답전송 컨텐츠 저장소 설정
		response.setCharacterEncoding("UTF-8");
		//브라우저 
		response.setContentType("text/html; charset=UTF-8");
		//
		PrintWriter out = response.getWriter();
		
		
		out.println("<!DOCTYPE html>                                                                     ");
		out.println("<html>                                                                              ");
		out.println("<head>                                                                              ");
		out.println("<meta charset='UTF-8'>                                                              ");
		out.println("<title>Insert title here</title>                                                    ");
		out.println(" <script type='text/javascript' src='http://code.jquery.com/jquery-latest.js'></script>      ");
		
		out.println("<script type='text/javascript' src='/ServletToddler/js/validation.js'></script>  ");
		
		out.println("<script type='text/javascript'>");
		
		out.println("$(function(){");
		out.println("     if('"+message+"'!='null'){");
		out.println("      alert('"+message+"');                          ");
		out.println("}");
		out.println("$('form[name=loginForm]').submit(function(){                                    ");       
		out.println("	if(!$('input[name=mem_id]').val().validationID()){                   ");
		out.println("		alert('아이디는 알파벳 소문자로 시작된 숫자 3개 조합으로 입력해주세요.');            ");
		out.println("		return false;                                                            ");
		out.println("	}                                                                            ");
		out.println("	if(!$('input[name=mem_pass]').val().validationPWD()){                ");
		out.println("		alert('패스워드는 알파벳 소문자와 숫자로 조합되어 최소4, 최대10개 글자로 입력해주세요.');");
		out.println("		return false;                                                            ");
		out.println("	}                                                                            ");
		out.println("	return true;                                                                 ");
		out.println("});                                                                             ");
		
		
		
		
		out.println("})");
		out.println("</script>                  ");
		
		out.println("</head>                                                                             ");
		out.println("<body>                                                                              ");
		out.println("	<form action='/ServletToddler/join/loginCheck' name='loginForm' method='POST'> ");
		out.println("		<table>                                                                      ");
		out.println("			<tr>                                                                     ");
		out.println("				<td>아이디</td>                                                      ");
		out.println("				<td><input type='text' name='mem_id'/></td>                          ");
		out.println("			</tr>                                                                    ");
		out.println("			<tr>                                                                     ");
		out.println("				<td>패스워드</td>                                                    ");
		out.println("				<td><input type='text' name='mem_pass'/></td>                        ");
		out.println("			</tr>                                                                    ");
		out.println("		</table>                                                                     ");
		out.println("		<input type='submit' value='로그인' />                                       ");
		
		out.println("		<input type='button' value='회원가입' onclick='javascript:location.href=\"/ServletToddler/member/memberForm\";'/>                                       ");
		
		
		out.println("	</form>                                                                          ");
		out.println("	                                                                                 ");
		out.println("</body>                                                                             ");
		out.println("</html>                                                                             ");
		
		
		
		
		
		
	}
	
}
