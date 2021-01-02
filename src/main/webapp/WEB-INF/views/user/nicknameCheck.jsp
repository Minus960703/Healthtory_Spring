<%@page import="com.control.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임중복체크 | Healthory</title>
</head>
<body>
<form name = "form1">

<% 
	String nickname = request.getParameter("nickname");
	UserDAO dao = new UserDAO();
	String result = dao.checknickname(nickname);
	
	if(result == "yes") {
%>
	<center>
	<br/><br/>
	<h4><%= nickname %>는 이미 사용중인 닉네임 입니다.</h4>
	<input type="button" value="닫기" name="close" onclick="CLform()"/>
	</center>
	<%} else if(result == "no") { %>
	<center>
	<br/><br/>
	<h4><%= nickname %>는 사용 가능한 닉네임입니다.</h4>
	<input type="button" value="사용하기" name="close2" onclick="CLform2()"/>
	</center>
	<%} %>
	
	</form>
	<script type="text/javascript">
	function CLform(){
		opener.document.join__form.nicknameDuplication.value="nicknameUnCheck";
		opener.document.join__form.nickname.value="";
		window.close();
	}
	
	function CLform2(){
		opener.document.join__form.nicknameDuplication.value="nicknameCheck";
		window.close();
	}
	</script>
</body>
</html>