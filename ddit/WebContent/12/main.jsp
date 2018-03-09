<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>엄마!!미안해!!</title>
</head>
<body>
<!-- action? 으로 바꾸기? 절대경로로 바꾸기 -->
<%-- <jsp:include page="./layout/header.jsp"></jsp:include> --%>
<c:import url="/12/layout/header.jsp"></c:import>
<div id="wrapper">
	<c:import url="/12/layout/left.jsp"></c:import>
	<div id="page-wrapper">
		<c:import url="/12/content_header.jsp"></c:import>
		<div class="page-content">
			<%-- <c:if test="${empty param.contentPage} ">
				<c:import url="/12/freeboard/freeboardForm.jsp"></c:import>
			</c:if>
			<c:if test="${!empty param.contentPage} ">
				<c:import url="${param.contentPage}"></c:import>
			</c:if> --%>
			
			<c:import url="${empty param.contentPage ? '/12/freeboard/freeboardList.jsp' : param.contentPage}"></c:import> 				
			
		</div>
		<c:import url="/12/layout/footer.jsp"></c:import>
	</div>
</div>
</body>
<script type="text/javascript">
<!-- /12/main.jsp?message=회원이 아닙니다. -->
	$(function(){
		//Expression or Expression Language 활용 시 자바스크립트에서는 '' 또는 ""으로 랩핑해주어야 함
		// 'true' or 'false' 문자열처럼 나온 것 원래 타입대로 쓰고싶을 때 eval('true')
// 		if('${not empty param.message}'){
		if(eval('${!empty param.message}')){
			BootstrapDialog.show({
			    title: '알림',
			    message: '${param.message}'
			});
		}
		
		
	});
</script>

</html>