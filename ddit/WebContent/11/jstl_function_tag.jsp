<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="targetclazz" uri="http://ddit.com/taglib/TargetClazz-taglib" %>
<c:set var="targetString1" value="function 태그는 java.lang.String 클래스 내 빈번하게 활용되는 몇몇 메서드를 태그로 제공합니다."></c:set>
<c:set var="targetString2" value="제공"></c:set>
<c:set var="targetString3" value="201호, 202호, 203호, 204호, 205호"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- ${pageScope.targetString1 } --%>
<!-- pageScope. 생략가능 -->
<%-- ${targetString1 } --%>


<%-- <%=((String)pageContext.getAttribute("targetString1")).length()%> --%>
<%-- length(): ${fn:length(pageScope.targetString1) }<br> --%>
length(): ${fn:length(targetString1) } <br>
toUpperCase(): ${fn:toUpperCase(targetString1) } <br>
toLowerCase(): ${fn:toLowerCase(targetString1) }<br>
<%-- ${fn:trim() } 중첩해서 씀--%>
substring(): ${fn:substring(fn:trim(targetString1),0,9) }<br>
substringAfter(): ${fn:substringAfter(targetString1, '태그') } <br>
substringBefore(): ${fn:substringBefore(targetString1, '태그') } <br>
replace(): ${fn:replace(targetString1, '활용', targetString2) } <br>
indexOf(): ${fn:indexOf(targetString1, '태그' ) } <br>
startsWith(): ${fn:startsWith(targetString1, 'fun') }<br>
endsWith(): ${fn:endsWith(targetString1, '미다.') }<br>
contains(): ${fn:contains(targetString1, targetString2) } <br>
split() [0] : ${fn:split(targetString3, ', ')[0] }<br>
<c:set var="targetString4" value="<script type='text/javascript'> alert('알럿'); </script>"></c:set>
${targetString4 }
escapeXml(): ${fn:escapeXml(targetString4) }<br>
<br>
<!--  
	사용자 정의 태그 활용
-->

plus: ${targetclazz:plus(1,1)}<br>
multiple : ${targetclazz:multiple('3',3)}<br>
today(): ${targetclazz:today() }<br>
charCount(): ${targetclazz:charCount('1234555678','5') } <br> 


</body>
</html>