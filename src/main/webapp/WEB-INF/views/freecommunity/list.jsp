<%@page import="com.control.vo.FreeCommunityVO"%>
<%@page import="com.control.dao.FreeCommunityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판 | Healthory</title>
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet" type="text/css">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/image/icon/icon.jpg">
</head>
<body>
	<!-- 네비게이션 시작 -->
		<%@ include file="../include/nav.jsp" %>
	<!-- 네비게이션 종료 -->
	
	<%
		//검색 단어
		String searchText=request.getParameter("search");//검색 값
                                	
        if(searchText==null){searchText="X";}
        else if(searchText.equals("")){searchText="X";}
	%>
		<%--DAO, VO 설정 시작 --%>
			<%
				FreeCommunityDAO dao = new FreeCommunityDAO();
	            FreeCommunityVO vo = new FreeCommunityVO();
	                    	
	            if(searchText.equals("X")){dao.selectFreeCommunity();}
	            else{dao.selectFreeCommunity(searchText);}
	                    	
	            //페이지설정부
	            String strPg = request.getParameter("pg"); //list.jsp?pg=?
	            int rowSize = 10; //한페이지에 보여줄 글의 수
	            int pg = 1; //페이지 , list.jsp로 넘어온 경우 , 초기값 =1
	            
	            if(strPg != null){ //list.jsp?pg=2
	            	pg = Integer.parseInt(strPg); //.저장
	            } 
	            
	            int from = (pg * rowSize) - (rowSize-1); //(1*10)-(10-1)=10-9=1 //from
	            int to=(pg * rowSize); //(1*10) = 10 //to
	            int total = dao.list.size();
	            if(total<to){to=total;};
	            
	            int allPage = (int) Math.ceil(total/(double)rowSize); //페이지수
	            //int totalPage = total/rowSize + (total%rowSize==0?0:1);
	            int block = 10; //한페이지에 보여줄  범위 << [1] [2] [3] [4] [5] [6] [7] [8] [9] [10] >>
	            
	            int fromPage = ((pg-1)/block*block)+1;  //보여줄 페이지의 시작
	            int toPage = ((pg-1)/block*block)+block; //보여줄 페이지의 끝
	            if(toPage> allPage){ // 예) 20>17
	            	toPage = allPage;
	            };
	            //페이지설정부
			%>
		<%--DAO, VO 설정 종료 --%>
				
	<!-- 컨텐츠 시작 -->
	<section class="community_section">
		<div class="community_content">
			<div class="community_list_blank"></div>
			<header class="community_list_header">
				<div class="search_box">
                        	<form name="searchForm" class="searchForm">
                        	<% if(searchText.equals("X")){ %>
                        		<input type="text" name="search" class="search_box_text" value=""/>
                        	<%} else{ %>
                        		<input type="text" name="search" class="search_box_text" value="<%=searchText%>"/>
                        	<%} %>
                        		<div class="search_box_button" onclick="submit_searchForm()"><i class="fas fa-search"></i></div>
                        	</form>
               </div>
			</header>
			<main class="community_list_main">
				<header class="community_list_title">
					<span>자유 게시판</span>
					<% if(session.getAttribute("ID") != null) 
	                        {
	                        %>
	                        	<span class="goWrite" onclick="go_write()">글쓰기 ▶</span>
	                        <%
	                        }
	                        %>
				</header>
				<header class="community_list_count">
					<span>게시물 개수&nbsp;:&nbsp;<span class="highlight"><%=dao.list.size() %></span>&nbsp;개</span>
				</header>
					<div class="community_list_line_start">
						<div class="number"><span>글번호</span></div>
						<div class="title"><span>글 제목</span></div>
						<div class="user"><span>작성자</span></div>
						<div class="date"><span>작성일</span></div>
						<div class="views"><span>조회수</span></div>
					</div>
					
				<!-- 반복 시작 -->
				<% if(dao.list.size()==0) { %>
						<div class="community_list_line">
							<span>등록된 글이 없습니다.</span>
						</div>
				<% }
				   else {
						for(int i=from-1;i<to;i++){
							vo=dao.list.get(i);
					%>
							<div class="community_list_line">
								<div class="number"><span><%= vo.getNo() %></span></div>
								<div class="title"><a href="./view?no=<%=vo.getNo() %>"><span><%= vo.getTitle()%></span></a></div>
								<div class="user"><span><%=vo.getNickname() %></span></div>
								<div class="date"><span><%=vo.getSigndate() %></span></div>
								<div class="views"><span><%=vo.getViews() %></span></div>
								</div>	 			
					<%	
							}	
					}
				%>
				<!-- 반복 종료  -->
				<footer class="community_list_page">
					<span>
						<%
								            if(pg>block){ //처음, 이전 링크
								       
								        		if(allPage>20){
										%>
								                [<a href="list?pg=1">◀◀</a>]
								                <%
								                }
								                %>
								                [<a href="list?pg=<%=fromPage-1%>">◀</a>] 
								        <%     
								            }
								            for(int i=fromPage; i<= toPage; i++){
								                if(i==pg){
								        %>         
								                    [<%=i%>]
								       
								        <%     
								                }else{
								        %>
								                    [<a href="list?pg=<%=i%>"><%=i%></a>]
								        <%
								                }
								            }
								       
								        %>
								       
								       
								        <%
								            if(toPage<allPage){ //다음, 이후 링크
								       
								        %>
								                [<a href="list?pg=<%=toPage+1%>">▶</a>]
								                <%if(allPage>20)
								                {
								                %>
								                	[<a href="list?pg=<%=allPage%>">▶▶</a>]
								                <%
								                }
								                %>
								                       
								        <%     
								            }
								        %>
					</span>
				</footer>
			</main>
		</div>
	</section>
	<!-- 컨텐츠 종료 -->
		
	<script src="../../../resources/js/community.js"></script>
	<script src="https://kit.fontawesome.com/34a8d510cf.js" crossorigin="anonymous" ></script>
</body>
</html>