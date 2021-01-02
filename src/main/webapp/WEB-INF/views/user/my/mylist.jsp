<%@page import="com.control.vo.PromotionCommunityVO"%>
<%@page import="com.control.dao.PromotionCommunityDAO"%>
<%@page import="com.control.vo.ScreenCommunityVO"%>
<%@page import="com.control.dao.ScreenCommunityDAO"%>
<%@page import="com.control.vo.FreeCommunityVO"%>
<%@page import="com.control.dao.FreeCommunityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>내가 쓴 글 | Healthory</title>
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
						<div class="title"><span>제목</span></div>
						<div class="date"><span>작성일</span></div>
						<div class="views"><span>조회수</span></div>
					</div>
					<!-- 자유 게시판 시작 -->
					<div class="mypage_list_line_board">
						<span>자유 게시판 게시글 목록</span>
					</div>
					<%
						FreeCommunityDAO freedao=new FreeCommunityDAO();
						FreeCommunityVO freevo = new FreeCommunityVO();
						freedao.setIdFreeCommunity(session.getAttribute("ID").toString());
						
						if(freedao.list.size()==0){
					%>
						<div class="mypage_list_line">
							<span>작성한 게시글이 없습니다.</span>
						</div>
					<%										
						}//if문 종료
						else{
							for(int i=0;i<freedao.list.size();i++){
								freevo=freedao.list.get(i);
						%>
							<div class="mypage_list_line">
								<div class="title"><a href="/freecommunity/view?no=<%=freevo.getNo() %>"><%= freevo.getTitle()%></a></div>
								<div class="date"><span><b><%=freevo.getSigndate()%></b></span></div>
								<div class="views"><span><b><%=freevo.getViews()%></b></span></div>
							</div>
											<% 
								}//for문 종료
										
						   }//else문 종료
					%>
					<!-- 자유 게시판 종료 -->
					<!-- 몸짱 게시판 시작 -->
					<div class="mypage_list_line_board">
						<span>몸짱 게시판 게시글 목록</span>
					</div>
					<%
						ScreenCommunityDAO screendao=new ScreenCommunityDAO();
						ScreenCommunityVO screenvo=new ScreenCommunityVO();
						screendao.setIdScreenCommunity(session.getAttribute("ID").toString());	
						
						if(screendao.list.size()==0){
					%>
						<div class="mypage_list_line">
							<span>작성한 게시글이 없습니다.</span>
						</div>
					<%										
						}//if문 종료
						else{
							for(int i=0;i<screendao.list.size();i++){
								screenvo=screendao.list.get(i);
						%>
							<div class="mypage_list_line">
								<div class="title"><a href="/screencommunity/view?no=<%=screenvo.getNo() %>"><%= screenvo.getTitle()%></a></div>
								<div class="date"><span><b><%=screenvo.getSigndate()%></b></span></div>
								<div class="views"><span><b><%=screenvo.getViews()%></b></span></div>
							</div>
											<% 
								}//for문 종료
										
						   }//else문 종료
					%>
					<!-- 몸짱 게시판 종료 -->
					<!-- 동아리 홍보 게시판 시작 -->
					<div class="mypage_list_line_board">
						<span>동아리 홍보 게시판 게시글 목록</span>
					</div>
					<%
						PromotionCommunityDAO promotiondao = new PromotionCommunityDAO();
						PromotionCommunityVO promotionvo = new PromotionCommunityVO();
						promotiondao.setIdPromotionCommunity(session.getAttribute("ID").toString());
						
						if(promotiondao.list.size()==0){
					%>
						<div class="mypage_list_line">
							<span>작성한 게시글이 없습니다.</span>
						</div>
					<%										
						}//if문 종료
						else{
							for(int i=0;i<promotiondao.list.size();i++){
								promotionvo=promotiondao.list.get(i);
						%>
							<div class="mypage_list_line">
								<div class="title"><a href="/promotioncommunity/view?no=<%=promotionvo.getNo() %>"><%= promotionvo.getTitle()%></a></div>
								<div class="date"><span><b><%=promotionvo.getSigndate()%></b></span></div>
								<div class="views"><span><b><%=promotionvo.getViews()%></b></span></div>
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