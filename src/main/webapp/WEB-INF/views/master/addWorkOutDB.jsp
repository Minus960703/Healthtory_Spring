<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>운동 게시글 처리 | Healthory</title>
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet" type="text/css">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/image/icon/icon.jpg">
</head>
<body>
	이름 : <%=request.getParameter("name") %><br>
	부위 : <%=request.getParameter("part") %><br>
	주소 : <%=request.getParameter("url") %><br>
	설명 : <%=request.getParameter("explain") %><br>
	
	<%
		response.sendRedirect("/master/addWorkOut");
	%>
</body>
</html>