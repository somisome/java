<%--==============================================================
 * JSP로 form 만들고 POST방식으로 파라메터 전송
 * @author 윤소미
 * @since  2018.02.20.
 * @version 1.0
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>
 *    수정일       수정자          수정내용
 *    -------      -------     -------------------
 *    2018.02.20.  윤소미      최초작성
 * Copyright (c) 2018 by DDIT  All right reserved
 * </pre>
===============================================================--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>requestParam</title>
</head>
<body>
<!-- 	form[action='/ddit/01/resultParam.jsp' method=POST]>table>(tr>td*2)*7 -->

<!-- http://localhost/ddit/01/resultParam.jsp  
	전송패킷 : mem_id=a001&mem_pass=asdfasdf&mem_name=김은대&
			param_group=첫번째&param_group=다섯번째
-->
<form action="/ddit/01/resultParam.jsp" method="POST">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="mem_id" /></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="text" name="mem_pass" /></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="mem_name" /></td>
			</tr>
			<tr>
				<td colspan="2">국내 국민 미스테리</td>
			</tr>
			<tr>
				<td>첫번째</td>
				<td><input type="checkbox" name="param_group" value="첫번째" />
					인류의 구멸을 초래하는 고스톱 막판쓸 : 과연 허용해야 하는가?
				</td>
			</tr>
			<tr>
				<td>두번째</td>
				<td><input type="checkbox" name="param_group" value="두번째" />
					중국집 군만두 서비스 : 얼마부터 시작인가?
				</td>
			</tr>
			<tr>
				<td>세번째</td>
				<td><input type="checkbox" name="param_group" value="세번째" />
					영원히 풀리지 않는 숙제 : 엄마가 좋은가? 아빠가 좋은가?
				</td>
			</tr>
			<tr>
				<td>네번째</td>
				<td><input type="checkbox" name="param_group" value="네번째" />
					당신이 간과한 혈육 : 식당이모 - 과연 가족으로 인정해야 하는가?
				</td>
			</tr>
			<tr>
				<td>다섯번째</td>
				<td><input type="checkbox" name="param_group" value="다섯번째" />
					셜록홈즈도 속아버린 완벽한 트릭 : 오빠 믿지?? - 과연 믿어야 하는가?
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="전송" /></td>
			</tr>
		</table>
	</form>
	
	
</body>
</html>