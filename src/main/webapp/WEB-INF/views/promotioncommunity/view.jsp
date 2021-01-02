<%@page import="com.control.vo.PromotionCommunityVO"%>
<%@page import="com.control.dao.PromotionCommunityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	int no = 0;
	if(request.getParameter("no")!=null){no = Integer.parseInt(request.getParameter("no"));}
%>
<%
	PromotionCommunityDAO dao=new PromotionCommunityDAO();//동아리 홍보 게시판용으로 수정
	PromotionCommunityVO vo=new  PromotionCommunityVO();//동아리 홍보 게시판용으로 수정
	
	dao.setonePromotionCommunity(no);
	vo=dao.list.get(0);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><%= vo.getTitle() %> | Healthory</title>
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet" type="text/css">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/image/icon/icon.jpg">
</head>
<body>
	<!-- 네비게이션 시작 -->
		<%@ include file="../include/nav.jsp" %>
	<!-- 네비게이션 종료 -->
	
		<section class="community_section">
			<div class="community_content">
				<div class="community_list_blank"></div>
				<header class="community_view_title"><span>제목 : <%= vo.getTitle() %></span></header>
				<header class="community_view_info">
					<span>작성자 : <%=vo.getNickname() %></span>
					<span>작성일 : <%=vo.getSigndate() %></span>
					<span>조회수 : <%=vo.getViews() %></span>
				</header>
				<main class="community_view_main">
					<div class="community_view_main_content"><%=vo.getText() %></div>
					<div class="community_view_comment">
						<header class="community_view_comment_header"><span>댓글 목록</span></header>
						<main class="community_view_comment_main">
							<iframe id="community_view_comment_iframe" width="100%" height="auto" scrolling="no"></iframe>
						</main>
					</div>
          </main>
          <footer class="community_view_footer">
          	<div>
				<% if(session.getAttribute("ID") == null) 
	            {
	            %>
	            	<a href="/user/login"><input type=button value="글쓰기"></a>
	            <%
	            }
	            else{
	            %>
	            	<a href="write"><input type=button value="글쓰기"></a>
	            <%
	            }
	            if(vo.getId().equals(session.getAttribute("ID")))
	            {
	            %>
                	<a href="delete?no=<%=vo.getNo()%>"><input type=button value="글 삭제"></a>
                    <a href="list"><input type=button value="글 목록"></a>
	            <%
	            }
				else
	            {
	            %>
	            	<a href="list"><input type=button value="글 목록"></a>
	            <%
	            } 
	            %>
	         </div>
          </footer>
		</section>
		
	<script src="../../../resources/js/community.js"></script>
	<script src="https://kit.fontawesome.com/34a8d510cf.js" crossorigin="anonymous" ></script>
</body>
</html>