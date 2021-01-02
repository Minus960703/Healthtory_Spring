/* 메뉴 열기 */
function openNav() {
	document.getElementById("workout_nav").style.width = "100%";
	//document.getElementById("workout_nav").style.marginLeft="0px";
}

/* 메뉴 닫기 */
function closeNav() {
	document.getElementById("workout_nav").style.width = "0%";
	//document.getElementById("workout_nav").style.marginLeft="-"+(document.getElementById("workout_nav").offsetWidth+300)+"px";
}

/* 초기화 */
//document.getElementById("workout_nav").style.marginLeft="-"+(document.getElementById("workout_nav").offsetWidth+300)+"px";

/* 폼 전송 */
function submit_searchForm(){
	document.searchForm.submit();
}

/* 목록 이동 */
function change_textList(text){
	location.href="./list?part="+text;
}