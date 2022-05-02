<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>board_read</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<style>
td {
	border: 1px dotted grey;
}
</style>
<script>

function del(num){
	if(!confirm('삭제한 게시글은 되돌릴 수 없습니다. 정말로 삭제하시겠어요?')){
		return;
	}
	$.ajax({
		url:'/board/delete?board_num='+num,
		method:'post',
		cache:false,
		dataType:'json',
		success:function(res){
			alert(res.deleted ? '게시글이 삭제되었습니다 ':'삭제 실패 ');
			location.href='/board/board_list/1';
		},
		error:function(xhr,status,error){
			alert('에러 : ' + err);
		}
	});
}
function delReply(num){
	if(!confirm('댓글을 정말로 삭제하시겠어요?')){
		return;
	}
	$.ajax({
		url:'/reply/delete?reply_num='+num,
		method:'post',
		cache:false,
		dataType:'json',
		success:function(res){
			alert(res.deleted ? '댓글이 삭제되었습니다 ':'삭제 실패 ');
			location.href='/board/board_read/${board.board_num}';
		},
		error:function(xhr,status,error){
			alert('에러 : ' + err);
		}
	});
}

</script>
</head>
<body>
	<div>
		<table>
			<tbody>
				<tr>
					<td>제목</td>
					<td>${board.board_title }</td>
					<td>no. ${board.board_num }</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${board.b_user_id }</td>
					<td>${board.board_date }</td>
					<td>조회수 ${board.board_hit }</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>${board.board_content }</td>
				</tr>
			</tbody>
		</table>

	</div>
	<hr>

	<!-- 로그인한 아이디와 글 작성자가 다른 경우 : 수정/삭제 버튼 안 보임   -->
	<c:if test="${user_id ne board.b_user_id }">
		<div>
			<a href="history.back()">이전</a>
		</div>
	</c:if>
	
	<!-- 로그인한 아이디와 글 작성자가 같은 경우에만 수정/삭제 버튼 보임  -->
	<c:if test="${user_id eq board.b_user_id }">
		
	<div>
		<a href="/board/board_update/${board.board_num }">수정 </a>
	</div>
	<div>
		<a href="javascript:del(${board.board_num })">삭제 </a>
	</div>
	<div>
		<div>
			<a href="history.back()">이전</a>
		</div>
	</div>
	</c:if>	




	<!-- 댓글 출력 영역  -->
	<c:forEach items="${replyList }" var="replyList">
		<table>
		<tr>
			<td>${replyList.r_user_id }</td>
			<td>${replyList.reply_content }</td>
			<td><small>${replyList.reply_date }</small></td>
		<td>
		
		<c:if test="${user_id eq replyList.r_user_id }">
		<div>
			<button type="button" id="deleteReply"
				onclick="javascript:delReply(${replyList.reply_num})"
					data-reply_number="${replyList.reply_num}">삭제</button>
			</div>
		</c:if>	
		
		</td>	
		</tr>
		</table>	
		<!--  <button type="button" id="updateReply" class="btn " onclick="javascript:updateReply(${replyList.reply_num})">수정</button> -->
		
	</c:forEach>
	
	<!-- 댓글 작성 영역  -->
	<hr>
	<div >
		<form class="form form" method="post" action="/reply/write">
			<input type="hidden" id="reply_num" name="reply_num" value="0"> 
			<input type="hidden" id="r_board_num" name="r_board_num" value="${board.board_num}">
			<input type="hidden" id="r_user_id" name="r_user_id" value="${user_id}"> 
			<input type="hidden" id="reply_date" name="reply_date" value="now()"> 
			<strong>${user_id}</strong>
			<input type="text"   id="reply_content" name="reply_content" required
				placeholder="댓글을 작성할 때에는 상대방을 배려하는 친절한 언어를 사용해주세요.">
			<button type="submit">작성</button>
		</form>
	</div>


</body>
</html>