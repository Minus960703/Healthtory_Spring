<%@page import="com.control.vo.PromotionCommunityVO"%>
<%@page import="com.control.dao.PromotionCommunityDAO"%>
<%@page import="com.control.vo.ScreenCommunityVO"%>
<%@page import="com.control.dao.ScreenCommunityDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%	int no = 0;
	if(request.getParameter("no")!=null){no = Integer.parseInt(request.getParameter("no"));}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>홈 | Healthory</title>
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/resources/css/swiper-bundle.min.css" rel="stylesheet">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/image/icon/icon.jpg">
	<style>
	    .swiper-container {
	      width: 100%;
	      height: 100%;
	      padding-top: 50px;
	      padding-bottom: 50px;
	    }
	
	    .swiper-slide {
	      background-position: center;
	      background-size: cover;
	      width: 300px;
	      height: 300px;
	
	    }
  	</style>
</head>
<body>
	<!-- 네비게이션 시작 -->
		<%@ include file="include/nav.jsp" %>
	<!-- 네비게이션 종료 -->
	
	<section class="home_section">
		<div class="home_content">
		
			<!-- 사이트 소개 시작 -->
			<div class="home_workout_panel">
				<header><span>오늘의 운동을 시작하자!</span><span onclick="go_workout_list()">운동 게시판  ▶</span></header>
				<main>
					  <!-- Swiper -->
					  <div class="swiper-container">
					    <div class="swiper-wrapper">
					      <div class="swiper-slide" style="background-image:url(../../resources/image/icon/Pectoral.png)" onclick="go_workout_list_part('Pectoral')"></div>
					      <div class="swiper-slide" style="background-image:url(../../resources/image/icon/Deltoid.png)" onclick="go_workout_list_part('Deltoid')"></div>
					      <div class="swiper-slide" style="background-image:url(../../resources/image/icon/Abs.png)" onclick="go_workout_list_part('Abs')"></div>
					      <div class="swiper-slide" style="background-image:url(../../resources/image/icon/Arms.png)" onclick="go_workout_list_part('Arms')"></div>
					      <div class="swiper-slide" style="background-image:url(../../resources/image/icon/Latissimus.png)" onclick="go_workout_list_part('Latissimus_Dorsi_Muscle')"></div>
					      <div class="swiper-slide" style="background-image:url(../../resources/image/icon/Quadriceps.png)" onclick="go_workout_list_part('Quadriceps')"></div>
					      <div class="swiper-slide" style="background-image:url(../../resources/image/icon/Hamstring.png)" onclick="go_workout_list_part('Hamstring')"></div>
					      <div class="swiper-slide" style="background-image:url(../../resources/image/icon/Gluteus.png)" onclick="go_workout_list_part('Gluteus_maximus')"></div>
					    </div>
					    <!-- Add Pagination -->
					    <div class="swiper-pagination"></div>
					  </div>
					</main>
			</div>
			<!-- 사이트 소개 종료 -->
			
			<!-- 몸짱 게시판 TOP 3 시작 -->
			<div class="home_screen_rank_panel">
				<header><span>당신의 성과를 자랑하자! TOP 3!</span><span onclick="go_screen_list()">몸짱 게시판  ▶</span></header>
				<main>
				<%--DAO, VO 설정 시작 --%>
					<%
						ScreenCommunityDAO dao = new ScreenCommunityDAO();
						ScreenCommunityVO vo = new ScreenCommunityVO();
						
						dao.setRankingList("signdate", "desc");
					%>
					<%--
						몸짱 게시판 테이블에서 랭킹 조건에 맞춰서 가져오기
					--%>
				<%--DAO, VO 설정 종료 --%>
				
				<!-- 데이터 연동 후 사용할 부분 시작 -->
				<%for(int i=0; i<3; i++){ 
					vo = dao.list.get(i);
				%>
					<div class="box" onclick="go_screen_view(<%= vo.getNo() %>)">
						<div class="rank">
							<span>
								<%=i+1%>위&nbsp;
								<i class="fas fa-medal <%if (i==0){out.print("gold");} else if(i==1){out.print("silver");} else if(i==2){out.print("bronze");}%>"></i>
							</span>
						</div>
						<header><span><%= vo.getTitle() %></span></header>
						<main><img width="100%" height="100%" alt="" src="<%= vo.getSumnail() %>"></main>
						<footer>
							<span>
								<i class="far fa-eye"></i>&nbsp;<%= vo.getViews() %>
								</span>
							<span>
								<i class="far fa-comment-alt"></i>&nbsp;<%--=vo.get댓글수--%>
								</span>
						</footer>
					</div>
				<%}%>
				<!-- 데이터 연동 후 사용할 부분 종료 -->
				</main>
			</div>
			<!-- 몸짱 게시판 TOP 3 종료 -->
			
			<!-- 동호회 홍보 게시판 랜덤 3개 시작 -->
			<div class="home_promotion_list_panel">
				<header><span>우리 함께 운동해요!</span><span onclick="go_promotion_list()">동호회 홍보 게시판  ▶</span></header>
				<main>
				
			<!-- 동호회 홍보 게시판 랜덤 3개 종료 -->
			<%
				PromotionCommunityDAO promotiondao = new PromotionCommunityDAO();
				PromotionCommunityVO promotionvo = new PromotionCommunityVO();
						
				promotiondao.setRankingList("signdate", "desc");
			%>
			<%--DAO, VO 설정 시작 --%>
				<%--
					동호회 홍보 게시판 테이블에서 아무거나 가져오기
				--%>
			<%--DAO, VO 설정 종료 --%>
				
			<!-- 데이터 연동 후 사용할 부분 시작 -->
			<%for(int i=0; i<3; i++){ 
				promotionvo = promotiondao.list.get(i);
				%>
				<div class="box" onclick="go_promotion_view(<%= promotionvo.getNo() %>)">
					<header><span><%= promotionvo.getTitle() %></span></header>
					<main><img width="100%" alt="" src="<%= promotionvo.getSumnail() %>"></main>
					<footer>
						<span>
							<i class="far fa-eye"></i>&nbsp;<%= promotionvo.getViews() %>
							</span>
						<span>
							<i class="far fa-comment-alt"></i>&nbsp;<%--=vo.get댓글수--%>
							</span>
					</footer>
				</div>
			<%}%>
			<!-- 데이터 연동 후 사용할 부분 종료 -->
				</main>
			</div>
			<!-- 개발자 소개 시작 -->
			<div class="home_programmer_intro_panel">
				<span>&copy; 헬스토리</span>
				<span><span>기능 개발 담당자 : 최진우</span> <span class="hide">&</span> <span>디자인 개발 담당자 : 이상원</span></span>
			</div>
			<!-- 개발자 소개 종료 -->
		</div>
	</section>
	
	<script src="../../resources/js/swiper-bundle.min.js"></script>
	 <script>
	    var swiper = new Swiper('.swiper-container', {
	      effect: 'coverflow',
	      grabCursor: true,
	      centeredSlides: true,
	      slidesPerView: 'auto',
	      coverflowEffect: {
	        rotate: 50,
	        stretch: 0,
	        depth: 100,
	        modifier: 1,
	        slideShadows: true,
	      },
	      pagination: {
	        el: '.swiper-pagination',
	      },
	    });
	 </script>
	<script src="https://kit.fontawesome.com/34a8d510cf.js" crossorigin="anonymous" ></script>
	<script src="../../resources/js/home.js"></script>
</body>
</html>
