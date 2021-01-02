<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">

<script src="${pageContext.request.contextPath}/resources/js/summernote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernote/summernote-lite.css">

<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/image/icon/icon.jpg">
<link href="${pageContext.request.contextPath}/resources/css/index.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
function uploadImageFile(file, editor) {
	data = new FormData();
	data.append("file", file);
	
	$.ajax({
		data : data,
		type : "POST",
		url : "image",	
		dataType:'json',
	    async: true,
		processData: false,		
		contentType: false,				
		success : function(data) {
	    	//항상 업로드된 파일의 url이 있어야 한다.
	    	alert("업로드에 지연시간이 있습니다..");
	    	setTimeout(function(){
	    		   // 1초 후 작동해야할 코드
	    		alert(data.url);
	    		$(editor).summernote('insertImage', data.url);
	    		if(document.getElementById('sumnail').value=="null"){
	    			document.getElementById('sumnail').value=data.url;	
	    		}
	    		
	    		   }, 1000);  	
	    	
		},
		error:function(request,status,error){			
			alert("code = "+ request.status);
			alert(" message = " + request.responseText);
			alert(" error = " + error);			 	
			$(editor).summernote('insertImage', '');
		}
	
	});
	}
	
$(document).ready(function() {
	$('#summernote').summernote({
		height: 300,                 // 에디터 높이
		minHeight: null,             // 최소 높이
		maxHeight: null,             // 최대 높이
		focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		lang: "ko-KR",					// 한글 설정
		placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
		callbacks: {	//여기 부분이 이미지를 첨부하는 부분
			onImageUpload : function(files) {
				uploadImageFile(files[0],this);				
			},
			onPaste: function (e) {
				var clipboardData = e.originalEvent.clipboardData;
				if (clipboardData && clipboardData.items && clipboardData.items.length) {
					var item = clipboardData.items[0];
					if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
						e.preventDefault();
					}
				}
			}
		}
});

});
</script>
<style type="text/css">
		.note-toolbar>div>div>button>i{color: black;}
		.note-toolbar>div>div>button>span{color: black;}
		.note-toolbar>div>button>i{color: black;}
	</style>
<title>몸짱 게시판 글쓰기 | Healthory</title>
</head>
<body>
	<!-- 네비게이션 시작 -->
		<%@ include file="../include/nav.jsp" %>
	<!-- 네비게이션 종료 -->
		
		<section class="community_section">
			<div class="community_content">
				<div class="community_list_blank"></div>
				<main class="community_write_main_plus">
					<form method="post" name="write__form" action="writeDB" class="write__form">
						<header class="community_write_title">
				            		<div><span>제목</span></div>
				            		<input type="text" name="title">
				        </header>
				        <main class="community_write_content_plus">
							<textarea id="summernote" name="editordata" class="editordata"></textarea>
				        </main>
				        <input type="hidden" name="id" value="<%=session.getAttribute("ID")%>">
				        <input type="hidden" id="sumnail" name="sumnail" value="null">
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
			var comment = write__form.editordata.value;
			if (!title)
			{
				alert("제목을 입력해주세요");
				write__form.title.focus();
				if (!comment)
				{
					alert("글 내용을 입력해주세요");
					write__form.editordata.focus();
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