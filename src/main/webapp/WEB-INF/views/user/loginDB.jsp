<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		String userid = request.getParameter("id");
		String userpwd = request.getParameter("pw");
		String username = (String)request.getAttribute("name");
		String nickname = (String)request.getAttribute("nickname");
		session.setAttribute("ID", userid);
		session.setAttribute("PW", userpwd);
		session.setAttribute("NAME", username);
		session.setAttribute("NICKNAME", nickname);
		
		response.sendRedirect("/");
	%>
</body>
</html>