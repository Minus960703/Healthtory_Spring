/*운동 게시판으로 이동*/
function go_workout_list(){
	location.href="/workout/list";
}

/*부위별 운동 게시판으로 이동*/
function go_workout_list_part(part){
	location.href="/workout/list?part="+part;
}

/*몸짱 게시판으로 이동*/
function go_screen_list(){
	location.href="/screencommunity/list";
}

/*몸짱 게시판의 해당하는 게시글로 이동*/
function go_screen_view(no){
	location.href="/screencommunity/view?no="+no;
}

/*동호회 홍보 게시판으로 이동*/
function go_promotion_list(){
	location.href="/promotioncommunity/list";
}

/*동호회 홍보 게시판의 해당하는 게시글로 이동*/
function go_promotion_view(no){
	location.href="/promotioncommunity/view?no="+no;
}