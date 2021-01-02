<%@page import="com.control.vo.ScreenCommentVO"%>
<%@page import="com.control.dao.ScreenCommentDAO"%>
<%@page import="java.beans.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	<meta charset="UTF-8">
	<link href="${pageContext.request.contextPath}/resources/css/comment.css" rel="stylesheet">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/image/icon/icon.jpg">
	<title>몸짱 게시판 댓글 | Healthory</title>
</head>
<body>
<% if(session.getAttribute("ID") != null) 
   {
%>
<form action="./commentDB?no=<%=request.getParameter("no")%>">
	<div class="comment_form">
		<header class="comment_form_header">
			<span>&nbsp;
				<%=session.getAttribute("NICKNAME")%>&nbsp;(<%=session.getAttribute("ID")%>)
			</span>
		</header>
		<textarea name="comment_text" class="comment_text"></textarea>
		<input type="hidden" name="no" value="<%=request.getParameter("no") %>">		
		<input type="hidden" name="id" value="<%=session.getAttribute("ID")%>">
		<input type="hidden" name="nickname" value="<%=session.getAttribute("NICKNAME")%>">  
		<input type="submit" value="등록" class="comment_submit" />
	</div>
</form>
<% } %>
	<%
		ScreenCommentDAO dao = new ScreenCommentDAO();
		ScreenCommentVO vo = new ScreenCommentVO();
		
		dao.setScreenCommunityScreenComment(Integer.parseInt((request.getParameter("no"))));
		if(dao.list.size()==0){
			%>
			<div class="comment_none">
				<span>작성된 댓글이 없습니다.</span>
			</div>
		<%	
		}
		else{
		for(int i=0;i<dao.list.size();i++){
			vo=dao.list.get(i);	
			%>
			
	<div class="comments">
			<header>
				<span><%= vo.getNickname() %>&nbsp;(<%= vo.getId() %>)</span>
			</header>
			<main>
			<div><%= vo.getText() %><br><br></div>
			</main>
			<footer>
				<span>등록일 : <%= vo.getSigndate() %></span>
			</footer>
			</div>
		<%	
			}
		}
		 %>
		 
	<!-- 반복 종료 할 곳 -->
		 
	<!-- 반복 종료 할 곳 -->
	
<div class="comment_blank"></div>  <!-- 공간 짤리는 문제 해결용 -->
	
	<script src="https://kit.fontawesome.com/34a8d510cf.js" crossorigin="anonymous" ></script>
</body>
</html>