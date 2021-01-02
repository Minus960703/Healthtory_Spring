<%@page import="com.control.vo.WorkOutVO"%>
<%@page import="com.control.dao.WorkOutDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동 게시판 | Healthory</title>
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet" type="text/css">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/image/icon/icon.jpg">
</head>
<body>
	<!-- 네비게이션 시작 -->
		<%@ include file="../include/nav.jsp" %>
	<!-- 네비게이션 종료 -->
	
	<!-- 운동 게시판 전용 네비게이션 시작 -->
		<div id="workout_nav" class="overlay">
		  <div class="overlay-content">
		  	<div class="overlay-side"></div>
		  	<div class="overlay-main">
		  		<div class="muscle_cover_text">
		  			<div class="muscle_cover_upper">
		  				<header class="muscle_cover_list_header">
		  					<span><<< 상체 >>></span>
		  				</header>
		  				<main class="muscle_cover_list_main">
		  					<span onclick="change_textList('Pectoral')">대흉근 (가슴, Pectoral)</span>
		  					<span onclick="change_textList('Deltoid')">삼각근 (어깨, Deltoid)</span>
		  					<span onclick="change_textList('Abs')">복근 (복부, Abs)</span>
		  					<span onclick="change_textList('Arms')">상완이두근 & 상완삼두근 (팔, Arms)</span>
		  					<span onclick="change_textList('Latissimus_Dorsi_Muscle')">광배근 (등, Latissimus Dorsi Muscle)</span>
		  				</main>
		  			</div>
		  			<div class="muscle_cover_lower">
		  				<header class="muscle_cover_list_header">
		  					<span><<< 하체 >>></span>
		  				</header>
		  				<main class="muscle_cover_list_main">
		  					<span onclick="change_textList('Quadriceps')">대퇴근 (다리앞면, Quadriceps)</span>
		  					<span onclick="change_textList('Hamstring')">슬굴곡근 (다리뒷면 , Hamstring)</span>
		  					<span onclick="change_textList('Gluteus_Maximus')">대둔근 (엉덩이, Gluteus Maximus)</span>
		  				</main>
		  			</div>
		  		</div>
		  	</div>
		  	<div class="overlay-side">
		  		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		  	</div>
		  </div>
		</div>
	<!-- 운동 게시판 전용 네비게이션 종료 -->
	
	<%
		//검색 단어
		String searchText=request.getParameter("search");//검색 값
				                                	
		 if(searchText==null){searchText="X";}
		 else if(searchText.equals("")){searchText="X";}
	%>
	
	<!-- 컨텐츠 시작 -->
	<section class="workout_section">
		<div class="workout_content">
			<header class="workout_list_header">
				<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; 메뉴</span>
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
			<main class="workout_list_main">
				<header class="workout_list_title">
					<span>
						<% 
							String part=request.getParameter("part");
							if(part==null){part="All";}
							
							if(part.equals("All")){out.print("전체");}
							else if(part.equals("Pectoral")){out.print("대흉근 (가슴, Pectoral)");}
							else if(part.equals("Deltoid")){out.print("삼각근 (어깨, Deltoid)");}
							else if(part.equals("Abs")){out.print("복근 (복부, Abs)");}
							else if(part.equals("Arms")){out.print("상완이두근 & 상완삼두근 (팔, Arms)");}
							else if(part.equals("Latissimus_Dorsi_Muscle")){out.print("광배근 (등, Latissimus Dorsi Muscle)");}
							else if(part.equals("Quadriceps")){out.print("대퇴근 (다리앞면, Quadriceps)");}
							else if(part.equals("Hamstring")){out.print("슬굴곡근 (다리뒷면 , Hamstring)");}
							else if(part.equals("Gluteus_Maximus")){out.print("대둔근 (엉덩이, Gluteus Maximus)");}
						%>
					</span>
				</header>
				
				<%--DAO, VO 설정 시작 --%>
	
					<%
						WorkOutDAO dao=new WorkOutDAO();
						WorkOutVO vo=new WorkOutVO();
						
						//전체 게시물
						if(request.getParameter("part")==null && searchText.equals("X")){
							dao.selectAllWorkOut();
						}
						//전체 게시물 - part가 "All"인 경우
						/*else if(request.getParameter("part")!=null && request.getParameter("part").equals("All")){
							dao.selectAllWorkOut();
						}*/
						//부위별 게시물
						else if(request.getParameter("part")!=null && !request.getParameter("part").equals("All")){
							dao.selectAllWorkOut(request.getParameter("part"));
						}
						//검색을 한 경우
						else if(!searchText.equals("X")){
							dao.searchWorkOut(searchText);
						}
						
						//페이지설정부 시작
			            String strPg = request.getParameter("pg"); //list.jsp?pg=?
			            int rowSize = 5; //한페이지에 보여줄 글의 수
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
			            //페이지설정부 종료
					%>
				<%--DAO, VO 설정 종료 --%>
				
				<header class="workout_list_count">
					<span>게시물 개수&nbsp;:&nbsp;<span class="highlight"><%=dao.list.size() %></span>&nbsp;개</span>
				</header>
					<div class="workout_list_line_start">
						<div class="number"><span>글번호</span></div>
						<div class="title"><span>글 제목</span></div>
						<div class="part"><span>운동 부위</span></div>
						<div class="views"><span>조회수</span></div>
					</div>
					
				<!-- 출력 시작 -->
				<%if(dao.list.size()==0){%>
					<div class="workout_list_line">
							<span>등록된 글이 없습니다.</span>
					</div>
				<%}
				  else{
					for(int i=from-1;i<to;i++){
					vo=dao.list.get(i);
				%>
					<div class="workout_list_line">
						<div class="number"><span><%=vo.getNo() %></span></div>
						<div class="title"><a href="./view?no=<%=vo.getNo() %>"><span><%=vo.getName() %></span></a></div>
						<div class="part"><span><%=vo.getPartName() %></span></div>
						<div class="views"><span><%=vo.getViews() %></span></div>
					</div>
				<%}
				}
				%>
				<!-- 출력 종료  -->
				<footer class="workout_list_page">
					<span>
						<%
							 if(pg>block){ //처음, 이전 링크
								   if(allPage>20)
								   {
									   //전체 게시물
										if(request.getParameter("part")==null && searchText.equals("X"))
										{%>
											[<a href="list?pg=1">◀◀</a>]
									  <%}
										//부위별 게시물
										else if(request.getParameter("part")!=null && !request.getParameter("part").equals("All"))
										{%>
											[<a href="list?part=<%=request.getParameter("part")%>&pg=1">◀◀</a>]
									  <%}
										//검색을 한 경우
										else if(!searchText.equals("X"))
										{%>
										[<a href="list?search=<%=searchText%>&pg=1">◀◀</a>]
									  <%}
								    }//전체 페이지가 20개 이상인 경우에 대한 내부 if문 종료%>
								    <!-- 전으로 이동 시작 -->
									   <%//전체 게시물
										if(request.getParameter("part")==null && searchText.equals("X"))
										{%>
											[<a href="list?pg=<%=fromPage-1%>">◀</a>]
									  <%}
										//부위별 게시물
										else if(request.getParameter("part")!=null && !request.getParameter("part").equals("All"))
										{%>
											[<a href="list?part=<%=request.getParameter("part")%>&pg=<%=fromPage-1%>">◀</a>]
									  <%}
										//검색을 한 경우
										else if(!searchText.equals("X"))
										{%>
										[<a href="list?search=<%=searchText%>&pg=<%=fromPage-1%>">◀</a>]
									  <%}%>
								        <!-- 전으로 이동 종료 -->
								    <%     
							}//처음 부분에 대한 if문 종료
						
							for(int i=fromPage; i<= toPage; i++){
								if(i==pg)
								{ %>         
								     [<%=i%>]
								<% }
								else
								{%>
								    <!-- 각 숫자 페이지 부분 시작 -->
									   <%//전체 게시물
										if(request.getParameter("part")==null && searchText.equals("X"))
										{%>
											[<a href="list?pg=<%=i%>"><%=i%></a>]
									  <%}
										//부위별 게시물
										else if(request.getParameter("part")!=null && !request.getParameter("part").equals("All"))
										{%>
											[<a href="list?part=<%=request.getParameter("part")%>&pg=<%=i%>"><%=i%></a>]
									  <%}
										//검색을 한 경우
										else if(!searchText.equals("X"))
										{%>
										[<a href="list?search=<%=searchText%>&pg=<%=i%>"><%=i%></a>]
									  <%}%>
								        <!-- 각 숫자 페이지 부분 종료 -->
							 <% }
						   }//for문 종료
							
							if(toPage<allPage) //다음, 이후 링크
							{  %>
								    <!-- 다음으로 이동 시작 -->
									   <%//전체 게시물
										if(request.getParameter("part")==null && searchText.equals("X"))
										{%>
											[<a href="list?pg=<%=toPage+1%>">▶</a>]
									  <%}
										//부위별 게시물
										else if(request.getParameter("part")!=null && !request.getParameter("part").equals("All"))
										{%>
											[<a href="list?part=<%=request.getParameter("part")%>&pg=<%=toPage+1%>">▶</a>]
									  <%}
										//검색을 한 경우
										else if(!searchText.equals("X"))
										{%>
										[<a href="list?search=<%=searchText%>&pg=<%=toPage+1%>">▶</a>]
									  <%}%>
								        <!-- 다음으로 이동 종료 -->
								 <%if(allPage>20)
								   { 
									    //전체 게시물
										if(request.getParameter("part")==null && searchText.equals("X"))
										{%>
											[<a href="list?pg=<%=allPage%>">▶▶</a>]
									  <%}
										//부위별 게시물
										else if(request.getParameter("part")!=null && !request.getParameter("part").equals("All"))
										{%>
											[<a href="list?part=<%=request.getParameter("part")%>&pg=<%=allPage%>">▶▶</a>]
									  <%}
										//검색을 한 경우
										else if(!searchText.equals("X"))
										{%>
										[<a href="list?search=<%=searchText%>&pg=<%=allPage%>">▶▶</a>]
									  <%}
								   }//전체 페이지가 20개 이상인 경우에 대한 내부 if문 종료  
							}//다음 부분에 대한 if문 종료
						%>
					</span>
				</footer>
			</main>
		</div>
	</section>
	<!-- 컨텐츠 종료 -->
	
	<script src="../../../resources/js/workout.js"></script>		
	<script src="https://kit.fontawesome.com/34a8d510cf.js" crossorigin="anonymous" ></script>
</body>
</html>