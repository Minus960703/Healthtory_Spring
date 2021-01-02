<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>자유게시판 글쓰기 | Healthory</title>
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
				<main class="community_write_main">
	            	<form method="post" name="write__form" action="writeDB" class="write__form">
		            	<header class="community_write_title">
		            		<div><span>제목</span></div>
		            		<input type="text" name="title">
		            	</header>
		            	<main class="community_write_content">
		            		<div><span>내용</span></div>
		            		<textarea name="text"></textarea>
		            	</main>               
	                    <input type="hidden" name="id" value="<%=session.getAttribute("ID")%>">
	                    <input type="hidden" name="nickname" value="<%=session.getAttribute("NICKNAME") %>">
					</form>
				</main>
				<footer class="community_write_footer">
					<div>
						<button OnClick="write_submit()" >글작성</button>
	                	<a href="list"><button OnClick="Button2_Click">작성취소</button></a>
	                	<a href="list"><button OnClick="Button3_Click">글목록</button></a>
	                </div>
				</footer>
			</div>
		</section>
			
			
	<script>
		function write_submit(){
			var Lf = document.write__form;
			var title = write__form.title.value;
			var text = write__form.text.value;
			if (!title)
			{
				alert("제목을 입력해주세요");
				write__form.title.focus();
				if (!text)
				{
					alert("글 내용을 입력해주세요");
					write__form.text.focus();
				}
			}
			else
			{
				Lf.submit();
			}
		}
	</script>
</body>
</html>