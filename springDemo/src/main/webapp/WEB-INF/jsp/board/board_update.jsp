<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_write</title> 
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
   integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
   crossorigin="anonymous"></script>
<style>

td { border : 1px dotted grey; }

</style>
<script>
function updateAction(){
	var title = $('#board_title').val();
	var content = $('#board_content').val();
	if(title=='' || content==''){
		alert('필수항목을 입력주세요');
		return false;
	}
	var serData = $('#update_form').serialize();
	$.ajax({
		url:'/board/update',
		method:'post',
		cache:false,
		data:serData,
		dataType:'json',
		success:function(res){
			alert(res.updated?'글 수정 성공':'실패');
			location.href='/board/board_read/${board.board_num}';
		},
		error:function(xhr,status,err){
			alert('에러:'+err);
		}
	});
	return false;
}
</script>
</head>
<body>
<div>
 <form id="update_form">
	  		<input type="hidden"  id="board_num" name="board_num" value="${board.board_num} ">
			<input type="hidden"  id="board_date" name="board_date" value="${board.board_date}">
			<input type="hidden"  id="board_hit" name="board_hit" value="${board.board_hit}">
			<input type="hidden"  id="b_user_num" name="b_user_num" value="${board.board_hit}"> 
	<div>
	  		<label>제목</label>
		  <input type="text" id="board_title" name="board_title" value="${board.board_title }">  
	</div>
	<div>
	  <label >글 내 용 </label>
	<textarea id="board_content" name="board_content" rows="3">${board.board_content}</textarea>
	</div>
	<button type="button" onclick="updateAction();">수정  </button>
</form>
</div>
<hr>


<div >
	<div >
		<a href="history.back()">취소 </a>
	</div>
</div>



</body>
</html>