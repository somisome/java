package kr.or.ddit.filter;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.vo.MemberVO;

public class LoginCheckFilter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		//로그인을 하면 세션에 LOGIN_MEMBERINFO로 회원(MemberVO) 저장
		HttpServletRequest request =  (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)resp;
		HttpSession session = request.getSession(true);
		//getSession()	->	현재 해당 클라이언트와 맵핑된 세션을 취득
		//getSession(true or false)
		//			true : 현재 해당 클라이언트와 맵핑된 세션을 취득
		//					해당 클라이언트와 맵핑된 세션이 존재하지 않을 때 신규 세션 생성 취득.
		//			false: 현재 해당 클라이언트와 맵핑된 세션을 취득
		//					해당 클라이언트와 맵핑된 세션이 존재하지 않을 때 익셉션 발생.
		MemberVO memberInfo =  (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		if(memberInfo != null){
			chain.doFilter(req, resp);
		}else{
			String message = URLEncoder.encode("로그인해주세요.","UTF-8");
			response.sendRedirect(request.getContextPath()+"/11/loginForm.jsp?message="+message);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

}
