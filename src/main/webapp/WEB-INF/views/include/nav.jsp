<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<ul class="nav_menu">
			    <li class="menu_tap"><a href="/" class="big_menu"><span>Home</span></a></li>
			    <li class="menu_tap"><a href="/workout/list" class="big_menu"><span>운동 게시판</span></a></li>
			    <li class="menu_tap">
			      <a href="javascript:void(0);" class="big_menu"><span>회원 게시판</span></a>
			      <div class="little_menu_list">
			        <a href="/freecommunity/list" class="little_menu"><span>자유 게시판</span></a>
			        <a href="/screencommunity/list" class="little_menu"><span>몸짱 게시판</span></a>
			        <a href="/promotioncommunity/list" class="little_menu"><span>동호회 홍보 게시판</span></a>
			      </div>
			    </li>
			    <li class="menu_tap">
					    <% if(session.getAttribute("ID") == null)
		                   {
		                %>
							<a href="javascript:void(0);" class="big_menu"><span>Guest 님</span></a>
			      			<div class="little_menu_list">
						        <a href="/user/login" class="little_menu"><span>로그인</span></a>
						        <a href="/user/join" class="little_menu"><span>회원가입</span></a>
			     			</div>
						<%
							}
							else if(session.getAttribute("ID") != null && !session.getAttribute("ID").equals("alal"))
							{
						%>
		                    <a href="javascript:void(0);" class="big_menu"><span><%= session.getAttribute("NICKNAME")%> 님</span></a>
					        <div class="little_menu_list">
					         	<a href="/user/logout" class="little_menu"><span>로그아웃</span></a>
		                    	<a href="/user/mypage" class="little_menu"><span>My Page</span></a>
		                    	<a href="/letter/list" class="little_menu"><span>쪽지 목록</span></a>
					        </div>
		                <%
		                	}
							else if(session.getAttribute("ID") != null && session.getAttribute("ID").equals("alal"))
							{
		                %>
		                	<a href="javascript:void(0);" class="big_menu"><span><%= session.getAttribute("NICKNAME")%> 님</span></a>
					        <div class="little_menu_list">
					         	<a href="/user/logout" class="little_menu"><span>로그아웃</span></a>
		                    	<a href="/user/mypage" class="little_menu"><span>My Page</span></a>
		                    	<a href="/letter/list" class="little_menu"><span>쪽지 목록</span></a>
		                    	<a href="/master/addWorkOut" class="little_menu"><span>운동 게시글 추가</span></a>
					        </div>
		                <%
		                	}
					    %>
                    </a>
                </li>
		  	</ul>
</body>
</html>