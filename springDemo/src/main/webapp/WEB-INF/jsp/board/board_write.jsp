<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.io.PrintWriter"%>

<%
	String b_user_id  = (String) session.getAttribute("b_user_id");
	String user_id = null;
	if(session.getAttribute("user_id")!=null){
		user_id = (String) session.getAttribute("user_id");
	}else if(user_id==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요!')");
		script.println("location.href='/login'");
		script.println("</script>");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_write</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
   integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
   crossorigin="anonymous"></script>
<style>
div { border : 2px solid grey; }
</style>
<script>

	function writeAction(){
		var serData = $('#write_form').serialize();
		$.ajax({
			url:'/board/write',
			method:'post',
			cache:false,
			data:serData,
			dataType:'json',
			success:function(res){
				alert(res.inserted?'성공':'실패');
				location.href='/board/board_list/1';
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
	<c:if test="${user_id == null }">
		<div>로그인을 해주세요 ~  <a href="/login">로그인</a> </div>		
	</c:if>
	
	<c:if test="${user_id != null }">
		WELCOME, ${user_id }! 
		
		
 <form id="write_form">
	  		<input type="hidden"  id="board_num" name="board_num" value="0">
			<input type="hidden"  id="board_date" name="board_date" value="now()">
			<input type="hidden"  id="board_hit" name="board_hit" value="1">
			<input type="hidden"  id="b_user_id" name="b_user_id" value="${user_id }">
	<div>
  		<label>제목</label>
  		<input type="text" id="board_title" name="board_title" placeholder="제목을 입력하세요">
	</div>
	<div>
	  <label >글 내 용 </label>
	  <textarea id="board_content" name="board_content" rows="3"></textarea>
	</div>
	<button type="button" onclick="writeAction();">작성 </button>
</form>
		
		
	</c:if>
	
</div>



</body>
</html>