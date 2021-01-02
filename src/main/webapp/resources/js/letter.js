/* 글쓰기로 이동*/
function go_write(){
	location.href="./write";
}

/* 로그인 페이지로 이동 */
function go_login(){
	location.href="/user/login";
}

/* 받은 쪽지함으로 변경 */
function go_receive(){
	location.href="/letter/list?type=receive";
}

/* 보낸 쪽지함으로 변경 */
function go_send(){
	location.href="/letter/list?type=send";
}