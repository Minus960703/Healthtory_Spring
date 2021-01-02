<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%=request.getAttribute("title")%>
	<%=request.getAttribute("id")%>
	<%=(String)request.getAttribute("text")%>
	<% 
		String userid = request.getParameter("id");
		String userpwd = request.getParameter("pw");
		String username = (String)request.getAttribute("name");
		String nickname = (String)request.getAttribute("nickname");
		response.sendRedirect("/freecommunity/list");
	%>
</body>
</html>