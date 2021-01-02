<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 | Healthory</title>
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet" type="text/css">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/image/icon/icon.jpg">
</head>
<body>
	<!-- 네비게이션 시작 -->
		<%@ include file="../include/nav.jsp" %>
	<!-- 네비게이션 종료 -->
	
	<!-- Main -->
		<section class="mypage_section">
			<div class="mypage_content">
				<aside>
					<%@ include file="../include/aside.jsp" %>
				</aside>
				<div class="mypage_list_panel">
								
				</div>
			</div>
    	</section>
</body>
</html>