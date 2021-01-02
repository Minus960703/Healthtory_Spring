<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 | Healthory</title>
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet" type="text/css">
</head>
<body>
	<!-- 네비게이션 시작 -->
		<%@ include file="../include/nav.jsp" %>
	<!-- 네비게이션 종료 -->
	<section class="join_section">
		<div class="join_content">
			<form method="post" name="join__form" action="joinDB" accept-charset="utf-8">
				<!-- 아이디 -->
				<div class="join_line">
					<div>
						<h3>아이디</h3>
					</div>
					<input type="text" placeholder="4~8자 내외" name="id" id="id" maxlength="10" />	
					<footer>
						<input type="button" value="중복확인 " name="confirm_id" onClick="confirmID(this.form)"/>
					</footer>
					<input type="hidden" name="idDuplication" value="idUncheck">
				</div>
				<!-- 닉네임 -->
				<div class="join_line">
					<div>
						<h3>닉네임</h3>
					</div>
					<input type="text" placeholder="4~8자 내외" name="nickname" id="nickname" maxlength="10"/>	
					<footer>
						 <input type="button" value="중복확인 " name="confirm_nickname" onClick="confirmNICKNAME(this.form)"/>
					</footer>
					<input type="hidden" name="nicknameDuplication" value="nicknameUncheck">
				</div>
				<!-- 비밀번호 -->
				<div class="join_line">
					<div>
						<h3>비밀번호</h3>
					</div>
					<input type="password" placeholder="비밀번호" name="pw"/>
					<footer></footer>
				</div>
				<!-- 비밀번호 확인 -->
				<div class="join_line">
					<div>
						<h3>비밀번호</h3>
					</div>
					<input type="password" placeholder="비밀번호확인" name="pwcheck"/>
					<footer></footer>
				</div>
				<!-- 이름 -->
				<div class="join_line">
					<div>
						<h3>이름</h3>
					</div>
					<input type="text" placeholder="이름" name="name" />	
					<footer></footer>
				</div>
				<!-- 연락처 -->
				<div class="join_line">
					<div>
						<h3>연락처</h3>
					</div>
					<input type="text" placeholder="-은빼고 입력해주세요." name="phone" />	  
					<footer></footer>
				</div>
				<!-- 이메일 -->
				<div class="join_line">
					<div>
						<h3>이메일</h3>
					</div>
					<input type="text" placeholder="@까지 입력해주세요" name="email" />
					<footer></footer>
				</div>
			</form>
			<footer class="join_submit">
				<div class="join_line">
					<div></div>
					<button OnClick="Button1_Click()">회원가입</button>
					<footer></footer>
				</div>
			</footer>
		</div>
	</section>
	

<script>

function confirmID(){
	var id = join__form.id.value;
	if(!id){
		alter("ID를 입력하세요");
		return;
	}
	
	url = "idCheck?id=" + id;
	open(url, "ChkForm", "width=500, height=300, resizable=no, scrollbars=no, menubar=no, status=no, location=no, toolbar=no");

}

function confirmNICKNAME(){
	var nickname = join__form.nickname.value;
	if(!nickname){
		alter("닉네임을 입력하세요");
		return;
	}
	
	url = "nicknameCheck?nickname=" + nickname;
	open(url, "ChkNickForm", "width=500, height=300, resizable=no, scrollbars=no, menubar=no, status=no, location=no, toolbar=no");
}

function Button1_Click(){
	   var Jf = document.join__form;
	   var id = join__form.id.value;
	   var idcheck = join__form.idDuplication.value;
	   var nickname = join__form.nickname.value;
	   var nicknamecheck = join__form.nicknameDuplication.value;
	   var pw = join__form.pw.value;
	   var pwCheck = join__form.pwcheck.value;
	   var name = join__form.name.value;
	   var phone = join__form.phone.value;
	   var email = join__form.email.value;
		
	   if(!id)
	   {
	      alert("아이디를 입력해 주세요.");
	      id = "";
	      join__form.id.focus();
	      return false;
	   }
	   
	   if(idcheck != "idCheck"){
		   alert("아이디 중복체크를 해주세요.");
		   return false;
	   }
	   
	   if(!nickname)
	   {
	      alert("닉네임을 입력해 주세요.");
	      nickname = "";
	      join__form.nickname.focus();
	      return false;
	   }
	   
	   if(nicknamecheck != "nicknameCheck"){
		   alert("닉네임 중복체크를 해주세요.");
		   return false;
	   }
	   
	   if(!pw)
	   {
	      alert("비밀번호를 입력해 주세요.");
	      pw = "";
	      join__form.pw.focus();
	      return false;
	   }
	   
	   if(pwCheck != pw)
	   {
	      alert("비밀번호 확인이 동일하지 않습니다.");
	      return false;
	   }
	   
	   if(!name)
	   {
	      alert("이름을 입력해 주세요.");
	      name = "";
	      join__form.name.focus();
	      return false;
	   }
	   
	   if(!phone)
	   {
	      alert("전화번호를 입력해 주세요.");
	      phone = "";
	      join__form.phone.focus();   
	      return false;      
	   }
	   if(isNaN(phone)) //문자인지 숫자인지 체크
	   {
	      alert("연락처는 숫자만 입력가능합니다.");
	      phone = "";
	      join__form.phone.focus();   
	      return false;
	   }
	   
	   if(!email)
	   {
		  alert("이메일을 입력해 주세요.");
		  email = "";
		  join__form.email.focus();
		  return false;
	   }
	
	
	   Jf.submit();
}
</script>
</body>
</html>