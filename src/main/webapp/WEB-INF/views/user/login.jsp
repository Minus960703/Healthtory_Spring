<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 | Healthory</title>
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet" type="text/css">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/image/icon/icon.jpg">
</head>
<body>
	<!-- 네비게이션 시작 -->
		<%@ include file="../include/nav.jsp" %>
	<!-- 네비게이션 종료 -->
	
	<section class="login_section">
		<div class="login_content">
			<!-- 아이디 비밀번호 틀릴시 알림 -->
			<% 
				String messege = (String)request.getAttribute("messege"); 
			%>
			<form method="post" name="login__form" action="loginDB" class="login__form">
						<%
						if(messege == "login fail")
						{%>
						<div class="login_fail_line">
							<h1>아이디와 비밀번호를 다시 입력해주세요.</h1>
						</div>
						<%}%>
					<div class="login_line">
						<div><span>아이디</span></div>
						<input onkeyup="login__submit2()" type="text" placeholder="아이디" name="id" class="login_text"/>
					</div>
					<div class="login_line">
						<div><span>비밀번호</span></div>
						<input onkeyup="login__submit2()" type="password" placeholder="비밀번호" name="pw" class="login_text"/>
					</div>
			</form>
			<div class="login_submit_line">
				<button OnClick="login__submit()" class="login_btn">로그인</button>
			</div>
		</div>
	</section>
	
	<script>
	function login__submit(){
		var Lf = document.login__form;
		var id2 = login__form.id.value;
		var pw2 = login__form.pw.value;
	
		if(!id2 || !pw2){
			alert("아이디와 비밀번호를 모두 입력해주세요.")
		}
		else{
			Lf.submit();
		}
	}
	
	function login__submit2(){
		   
		   var Lf = document.login__form;
		   var id2 = login__form.id.value;
		    var pw2 = login__form.pw.value;
		    
		    if (window.event.keyCode == 13) {
		        
		        // 엔터키가 눌렸을 때 실행할 내용
		        if(!id2 || !pw2)
		        {
		           alert("아이디와 비밀번호를 모두 입력해주세요.")
		        }
		        else
		        {
		           Lf.submit();
		        }     
		         }
	}
	</script>
</body>
</html>