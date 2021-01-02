/* 목록으로 이동 */
function go_list(){
	location.href="./list";
}

/* 글쓰기로 이동*/
function go_write(){
	location.href="./write";
}

/* 글 내용 보기으로 이동 */
function go_view(no){
	location.href="./view?no="+no;
}

/* 로그인 페이지로 이동 */
function go_login(){
	location.href="/user/login";
}

/* 댓글 페이지용 함수 */
var iframe = document.getElementById('community_view_comment_iframe');

window.addEventListener('DOMContentLoaded', function () {
	iframe.addEventListener('load', autoHeight);
});

function autoHeight() {
	var frame = iframe;
    var sub = frame.contentDocument ? frame.contentDocument : frame.contentWindow.document;
    iframe.height = sub.body.scrollHeight;
}

/* url 값 설정 */
var url=window.location.href;

/* url에서 value 값 가져오기*/
function getParameterByName(name) {
	name=name.replace(/[\[\]]/g,"\\$&");
	var regex=new RegExp("[?&]"+name+"(=([^&#]*)|&|#|$)");
	var result=regex.exec(url);
	return result[2];
}

/* url에서 변수 값을 가져옴 */
var no=getParameterByName("no");

/* 리뷰 패널 iframe */
const info_review_iframe=document.getElementById("community_view_comment_iframe");
community_view_comment_iframe.src="./comment?no="+no;