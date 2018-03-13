package kr.or.ddit.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;


public class IPCheckFilter implements Filter {
	private static Map<String, String> ipMap;
	
	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
//		chain.doFilter(req, resp);
		String clientIPAddr = req.getRemoteAddr();
		boolean flag = false;
		if(StringUtils.isNotEmpty(clientIPAddr)&&ipMap.containsKey(clientIPAddr)){
			if("F".intern()==ipMap.get(clientIPAddr).intern()){
				flag = true;
			}
		}else{
			flag = true;
		}
		
		if(flag){
			HttpServletResponse response = (HttpServletResponse)resp;
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<html>");
			out.println("<body>");
			out.println("<font color ='red' size='15'>인가된 클라이언트가 아닙니다XD</font>");
			out.println("</body>");
			out.println("</html>");
		}else{
			chain.doFilter(req, resp);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		ipMap = new HashMap<String, String>();
		ipMap.put("127.0.0.1", "A");
		ipMap.put("0:0:0:0:0:0:0:1", "A");
		ipMap.put("192.168.203.92", "A");
		ipMap.put("192.168.203.93", "F");
	}

}
