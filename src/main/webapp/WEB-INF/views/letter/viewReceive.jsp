<%@page import="com.control.dao.LetterDAO"%>
<%@page import="com.control.vo.LetterVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%int no=0;
	if(request.getParameter("no")!=null){no = Integer.parseInt(request.getParameter("no"));}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은 쪽지 보기 | Healthory</title>
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet" type="text/css">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/image/icon/icon.jpg">
</head>
	<%
		Object nick = session.getAttribute("NICKNAME");
		String nickname = (String)nick;
	%>
<body>
	<!-- 네비게이션 시작 -->
		<%@ include file="../include/nav.jsp" %>
	<!-- 네비게이션 종료 -->
	
	<%--DAO, VO 설정 시작 --%>
	<%
		LetterDAO dao = new LetterDAO();
		LetterVO vo = new LetterVO();
		dao.setoneLetter(no);
		vo=dao.list.get(0);
	%>
		<%--받은 쪽지에 대한 설정--%>
	<%--DAO, VO 설정 종료 --%>
	
	<!-- 컨텐츠 시작 -->
		<section class="letter_section">
			<div class="letter_content_ver_view">
				<main class="letter_write_main">
	            	<form method="post" name="write__form" action="writeDB" class="write__form">
		            	<header class="letter_view_title">
		            		<div><span>보낸 사람</span></div>
		            		<input type="text" name="Tonickname" value="<%= vo.getFromnickname() %>" readonly="readonly">
		            	</header>
		            	<main class="letter_write_content">
		            		<div><span>내용</span></div>
		            		<textarea name="text" readonly="readonly"><%= vo.getText() %></textarea>
		            	</main>               
	                    <input type="hidden" name="Fromid" value="<%=session.getAttribute("ID")%>">
	                    <input type="hidden" name="Fromnickname" value="<%=session.getAttribute("NICKNAME") %>">
					</form>
				</main>
				<footer class="letter_write_footer">
					<div>
	                	<a href="list"><button>쪽지 목록</button></a>
	                	<a href="delete?no=<%=vo.getNo()%>"><button>삭제하기</button></a>
	                	<a href="write?to=<%= vo.getFromnickname() %>"><button>답장하기</button></a>
	                </div>
				</footer>
			</div>
		</section>
</body>
</html>