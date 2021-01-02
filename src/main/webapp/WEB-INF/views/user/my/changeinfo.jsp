<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>내 정보 | Healthory</title>
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
				<div class="mypage_info_panel">
					<header>
						<span>개인정보 수정</span>
					</header>
					<main>
						<form name="form1" action="changeinfoDB" method="post" runat="server">
							<div class="mypage_info_line">
								<div><span>비밀번호</span></div>
								<input type="password" name="pw">
							</div>
							<div class="mypage_info_line">
								<div><span>비밀번호확인</span></div>
								<input type="password" name="pwcheck">
							</div>
							<div class="mypage_info_line">
								<div><span>핸드폰번호</span></div>
								<input type="text" name="phone">
							</div>
							
							<input type="hidden" name="id" value="<%= session.getAttribute("ID")%>"/> 
							<input type="hidden" name="jobtype" value=""/> 
						</form>
					</main>
					<footer>
						<div>
							<button OnClick="Button1_Click()">비밀번호 수정</button>
							<button OnClick="Button2_Click()">핸드폰 번호 수정</button>
						</div>
					</footer>
				</div>
			</div>
    	</section>
    	
<script>
function Button1_Click(){
	   
	   var Jf = document.form1;	   
	   var pw = form1.pw.value;
	   var pwCheck = form1.pwcheck.value;
	   var phone = form1.phone.value;
	   var jobtype = form1.jobtype.value;
	   
	   form1.jobtype.value ="pw";
	   
	   if(!pw)
	   {
	      alert("비밀번호를 입력해 주세요.");
	      pw = "";
	      join__form.pw.focus();
	      return false;
	   }
	   
	   else if(pwCheck != pw)
	   {
	      alert("비밀번호 확인이 동일하지 않습니다.");
	      return false;
	   }
	   else{
		   
	   }
	   form1.submit();
	   
	   
	   
}

function Button2_Click(){
	   
	   var Jf = document.form1;	   
	   var pw = form1.pw.value;
	   var pwCheck = form1.pwcheck.value;
	   var phone = form1.phone.value;
	   var jobtype = form1.jobtype.value;
	   
	   form1.jobtype.value ="phone";
	   
	   if(!phone)
	   {
	      alert("전화번호를 입력해 주세요.");
	      phone = "";
	      join__form.phone.focus();   
	      return false;      
	   }
	   else if(isNaN(콜)) //문자인지 숫자인지 체크
	   {
	      alert("연락처는 숫자만 입력가능합니다.");
	      phone = "";
	      join__form.phone.focus();   
	      return false;
	   }
	   else{		   
		  
	   }
	   form1.submit();
}
</script>	
</body>
</html>