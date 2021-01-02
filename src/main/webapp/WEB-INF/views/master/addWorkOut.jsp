<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>운동 게시글 추가 | Healthory</title>
	<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet" type="text/css">
	<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/image/icon/icon.jpg">
</head>
<body>
	<!-- 네비게이션 시작 -->
		<%@ include file="../include/nav.jsp" %>
	<!-- 네비게이션 종료 -->
	
	<!-- 컨텐츠 시작 -->
	<section class="addWorkOutSection">
		<div class="addWorkOutContent">
			<form name="addWorkOut__form" action="addWorkOutDB" method="post" accept-charset="utf-8">
				<div class="addWorkOut_write_line">
					<div><span>운동명</span></div>
					<input type="text" name="name">
				</div>
				<div class="addWorkOut_write_line">
					<div><span>운동부위</span></div>
					<select name="part">
						<option value="">----------------&nbsp;&nbsp;&nbsp;선택&nbsp;&nbsp;&nbsp;----------------</option>
						<option value="Pectoral">대흉근 (가슴, Pectoral)</option>
						<option value="Deltoid">삼각근 (어깨, Deltoid)</option>
						<option value="Abs">복근 (복부, Abs)</option>
						<option value="Arms">상완이두근 & 상완삼두근 (팔, Arms)</option>
						<option value="Latissimus_Dorsi_Muscle">광배근 (등, Latissimus Dorsi Muscle)</option>
						<option value="Quadriceps">대퇴근 (다리앞면, Quadriceps)</option>
						<option value="Hamstring">슬굴곡근 (다리뒷면 , Hamstring)</option>
						<option value="Gluteus_Maximus">대둔근 (엉덩이, Gluteus Maximus)</option>
					</select>
				</div>
				
				<div class="addWorkOut_write_line">
					<div><span>영상 주소</span></div>
					<input type="text" name="url">
				</div>
				<div class="addWorkOut_write_textarea_line">
					<div><span>운동 설명</span></div><textarea name="explain"></textarea>
				</div>
			</form>
			<footer>
					<button OnClick="addWorkOut_submit()">게시글 추가</button>
			</footer>
		</div>
	</section>
	<!-- 컨텐츠 종료 -->
	
	<script>
	function addWorkOut_submit(){
		   var name=document.addWorkOut__form.name.value;
		   var part = document.addWorkOut__form.part
		   var part_value = part.options[part.selectedIndex].value;
		   var url=document.addWorkOut__form.url.value;
		   var explain=document.addWorkOut__form.explain.value;
			
		   if(!name)
		   {
		      alert("운동명을 입력해 주세요.");
		      document.addWorkOut__form.name.focus();
		      return false;
		   }
		   
		   if(part_value=="")
		   {
		      alert("운동 부위를 선택해 주세요.");
		      document.addWorkOut__form.part.focus();
		      return false;
		   }
		   
		   if(!url)
		   {
		      alert("영상 주소를 입력해 주세요.");
		      document.addWorkOut__form.url.focus();
		      return false;
		   }
		   
		   if(!explain)
		   {
		      alert("운동 설명을 입력해 주세요.");
		      document.addWorkOut__form.explain.focus();
		      return false;
		   }
		   
		   document.addWorkOut__form.submit();
	}
	</script>
</body>
</html>