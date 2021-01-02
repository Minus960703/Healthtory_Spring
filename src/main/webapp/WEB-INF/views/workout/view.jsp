<%@page import="com.control.vo.WorkOutVO"%>
<%@page import="com.control.dao.WorkOutDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동 정보 | Healthory</title>
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet" type="text/css">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/image/icon/icon.jpg">
</head>
<body>
	<!-- 네비게이션 시작 -->
		<%@ include file="../include/nav.jsp" %>
	<!-- 네비게이션 종료 -->
	
	
		<%--DAO, VO 설정 시작 --%>
			<%
				WorkOutDAO dao=new WorkOutDAO();
				WorkOutVO vo=new WorkOutVO();
				
				dao.selectOneWorkOut(Integer.parseInt(request.getParameter("no")));
				vo=dao.list.get(0);
			%>
		<%--DAO, VO 설정 종료 --%>
				
	<!-- 컨텐츠 시작 -->
		<section class="workout_section">
			<div class="workout_content">
				<div class="workout_view_blank"></div>
				<header class="workout_view_header">
					<span><%=vo.getName() %></span></header>
				</header>
				<main class="workout_view_main">
					<!-- "https://www.youtube.com/watch?v=iMTblJbmam4"에서 "watch?v="를   "embed/"로 변경 -->
					<iframe width="90%" height="100%" src="<%=vo.getUrl()%>"></iframe>
				</main>
				<footer class="workout_view_footer">
					<span><%=vo.getExplain() %></span>
				</footer>
			</div>
		</section>
		
	<!-- 컨텐츠 종료 -->
	<script src="../../../resources/js/workout.js"></script>	
</body>
</html>