<%@ page language="JAVA" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>엄마!!미안해!!</title>
</head>
<body>
action? 으로 바꾸기? 절대경로로 바꾸기
<jsp:include page="./layout/header.jsp"></jsp:include>
<div id="wrapper">
	<jsp:include page="./layout/left.jsp"></jsp:include>
	<div id="page-wrapper">
		<jsp:include page="content_header.jsp"></jsp:include>
		<div class="page-content">
			<jsp:include page="./freeboard/freeboardForm.jsp"></jsp:include>
		</div>
		<jsp:include page="./layout/footer.jsp"></jsp:include>
	</div>
</div>
</body>
</html>