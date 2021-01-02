<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지 쓰기 | Healthory</title>
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet" type="text/css">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/image/icon/icon.jpg">
</head>
<body>
	<!-- 네비게이션 시작 -->
		<%@ include file="../include/nav.jsp" %>
	<!-- 네비게이션 종료 -->
	
	<!-- 컨텐츠 시작 -->
		<section class="letter_section">
			<div class="letter_content_ver_write">
				<main class="letter_write_main">
	            	<form method="post" name="write__form" action="writeDB" class="write__form">
		            	<header class="letter_write_title">
		            		<div class="left"><span>받는 사람</span></div>
		            		<%if (request.getParameter("to")==null){ %>
		            			<input type="text" name="Tonickname" placeholder="쪽지를 받을 사람의  닉네임 입력">
		            		<%}else { %>
		            			<input type="text" name="Tonickname" value="<%=request.getParameter("to")%>">
		            		<% } %>
		            		<div class="right">
		            			<input type="button" value="닉네임검색 " name="confirm_nickname" onClick="confirmNICKNAME(this.form)"/>
		            		</div>
		            		<input type="hidden" name="nicknameDuplication" value="nicknameUncheck">
		            	</header>
		            	<main class="letter_write_content">
		            		<div><span>내용</span></div>
		            		<textarea name="text"></textarea>
		            	</main>               
	                    <input type="hidden" name="Fromid" value="<%=session.getAttribute("ID")%>">
	                    <input type="hidden" name="Fromnickname" value="<%=session.getAttribute("NICKNAME") %>">
					</form>
				</main>
				<footer class="letter_write_footer">
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
			var who = write__form.Tonickname.value;
			var text = write__form.text.value;
			var nicknamecheck = write__form.nicknameDuplication.value;
			
			if(nicknamecheck != "nicknameCheck"){
				   alert("닉네임 중복체크를 해주세요.");
				   return false;
			   }
			
			if (!who)
			{
				alert("쪽지를 받는 사람의 닉네임을 입력해주세요");
				write__form.Tonickname.focus();
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
		function confirmNICKNAME(){
			var nickname = write__form.Tonickname.value;
			if(!nickname){
				alter("닉네임을 입력하세요");
				return;
			}
			
			url = "nicknameCheck?nickname=" + nickname;
			open(url, "ChkNickForm", "width=500, height=300, resizable=no, scrollbars=no, menubar=no, status=no, location=no, toolbar=no");
		}
	</script>
</body>
</html>