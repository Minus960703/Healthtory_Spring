const changeInfo=document.querySelector(".changeInfo");
const postList=document.querySelector(".postList");
const commentList=document.querySelector(".commentList");

/* 정보 변경으로 변경 */
function go_changeInfo(){
	location.href="/user/my/changeinfo";
	localStorage.setItem("mypageMode","changeInfo");
}

/* 내 게시글 목록으로 이동  */
function go_postList(){
	location.href="/user/my/mylist";
	localStorage.setItem("mypageMode","postList");
}

/* 내 댓글 목록으로 이동 */
function go_commentList(){
	location.href="/user/my/mycomment";
	localStorage.setItem("mypageMode","commentList");
}

/* 로컬 스토리지 값에 따라서 값 변경 */
const mypageMode = localStorage.getItem("mypageMode");
if(mypageMode==="changeInfo"){
	changeInfo.classList.add("selected");
	postList.classList.remove("selected");
	commentList.classList.remove("selected");
}
else if(mypageMode==="postList"){
	changeInfo.classList.remove("selected");
	postList.classList.add("selected");
	commentList.classList.remove("selected");
}
else if(mypageMode==="commentList"){
	changeInfo.classList.remove("selected");
	postList.classList.remove("selected");
	commentList.classList.add("selected");
}