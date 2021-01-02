<%@page import="com.control.vo.PromotionCommentVO"%>
<%@page import="com.control.dao.PromotionCommentDAO"%>
<%@page import="com.control.vo.ScreenCommentVO"%>
<%@page import="com.control.dao.ScreenCommentDAO"%>
<%@page import="com.control.vo.FreeCommentVO"%>
<%@page import="com.control.dao.FreeCommentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>내가 쓴 댓글 | Healthory</title>
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet" type="text/css">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/image/icon/icon.jpg">
</head>
<body>
	<!-- 네비게이션 시작 -->
		<%@ include file="../../include/nav.jsp" %>
	<!-- 네비게이션 종료 -->
	
	<!-- Main -->
		<section class="mypage_section">
			<div class="mypage_content">
				<aside>
					<%@ include file="../../include/aside.jsp" %>
				</aside>
				<div class="mypage_list_panel">
					<div class="mypage_list_line_start">
						<div class="comment_content"><span>내용</span></div>
						<div class="comment_date"><span>작성일</span></div>
					</div>
					<!-- 자유 게시판 시작 -->
					<div class="mypage_list_line_board">
						<span>자유 게시판 댓글 목록</span>
					</div>
					<%
						FreeCommentDAO freecommentdao=new FreeCommentDAO();
						FreeCommentVO freecommentvo = new FreeCommentVO();
						freecommentdao.setIdFreeComment(session.getAttribute("ID").toString());
						
						if(freecommentdao.list.size()==0){
					%>
						<div class="mypage_list_line">
							<span>작성한 댓글이 없습니다.</span>
						</div>
					<%										
						}//if문 종료
						else{
							for(int i=0;i<freecommentdao.list.size();i++){
								freecommentvo=freecommentdao.list.get(i);
						%>
							<div class="mypage_list_line">
								<div class="comment_content"><a href="/freecommunity/view?no=<%=freecommentvo.getFreeno()%>"><%= freecommentvo.getText()%></a></div>
								<div class="comment_date"><span><b><%=freecommentvo.getSigndate()%></b></span></div>
							</div>
											<% 
								}//for문 종료
										
						   }//else문 종료
					%>
					<!-- 자유 게시판 종료 -->
					<!-- 몸짱 게시판 시작 -->
					<div class="mypage_list_line_board">
						<span>몸짱 게시판 댓글 목록</span>
					</div>
					<%
						ScreenCommentDAO screencommentdao=new ScreenCommentDAO();
						ScreenCommentVO screencommentvo = new ScreenCommentVO();
						screencommentdao.setIdScreenComment(session.getAttribute("ID").toString());
						
						if(screencommentdao.list.size()==0){
					%>
						<div class="mypage_list_line">
							<span>작성한 댓글이 없습니다.</span>
						</div>
					<%										
						}//if문 종료
						else{
							for(int i=0;i<screencommentdao.list.size();i++){
								screencommentvo=screencommentdao.list.get(i);
						%>
							<div class="mypage_list_line">
								<div class="comment_content"><a href="/screencommunity/view?no=<%=screencommentvo.getScreenno()%>"><%= screencommentvo.getText()%></a></div>
								<div class="comment_date"><span><b><%=screencommentvo.getSigndate()%></b></span></div>
							</div>
											<% 
								}//for문 종료
										
						   }//else문 종료
					%>
					<!-- 몸짱 게시판 종료 -->
					<!-- 동아리 홍보 게시판 시작 -->
					<div class="mypage_list_line_board">
						<span>동아리 홍보 게시판 댓글 목록</span>
					</div>
					<%
						PromotionCommentDAO promotioncommentdao=new PromotionCommentDAO();
						PromotionCommentVO promotioncommentvo = new PromotionCommentVO();
						promotioncommentdao.setIdPromotionComment(session.getAttribute("ID").toString());
						
						if(promotioncommentdao.list.size()==0){
					%>
						<div class="mypage_list_line">
							<span>작성한 댓글이 없습니다.</span>
						</div>
					<%										
						}//if문 종료
						else{
							for(int i=0;i<promotioncommentdao.list.size();i++){
								promotioncommentvo=promotioncommentdao.list.get(i);
						%>
							<div class="mypage_list_line">
								<div class="comment_content"><a href="/promotioncommunity/view?no=<%=promotioncommentvo.getPromotionno() %>"><%= promotioncommentvo.getText()%></a></div>
								<div class="comment_date"><span><b><%=promotioncommentvo.getSigndate()%></b></span></div>
							</div>
											<% 
								}//for문 종료
										
						   }//else문 종료
					%>
					<!-- 동아리 홍보 게시판 종료 -->
				</div>
			</div>
    	</section>
</body>
</html>