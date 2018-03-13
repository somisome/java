package kr.or.ddit.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.commons.lang.StringUtils;

public class EncodingFilter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		//클라이언트 요청시 전송방식 GET: server.xml <connector URIEncoding="UTF-8"
		//						POST: jsp 내 request.setCharacterEncoding("UTF-8")
		//클라이언트 요청시 해당요청처리에 인코딩 타입을 추가로 제공
		String encodingType = req.getCharacterEncoding();
//		if(encodingType==null||encodingType==""){
		// java.lang.String 클래스 내의 활용가능한 메서드의 확장 자원
		//	1.http://commons.apache.org
		//http://commons.apache.org/proper/commons-lang/download_lang.cgi    commons-lang-2.6-bin.zip
		//	2.WEB-INF/lib import
		if(StringUtils.isEmpty(encodingType)){
			encodingType="UTF-8";
		}
		req.setCharacterEncoding(encodingType);
		chain.doFilter(req, resp);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
	}

}
