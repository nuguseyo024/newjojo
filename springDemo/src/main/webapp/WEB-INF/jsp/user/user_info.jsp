<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
	crossorigin="anonymous"></script>
<script>
	function user_out() {
		if(!confirm('탈퇴하시겠습니까?')) return;
		$.ajax({
			url:'/user_out/${user.user_id}',
			method:'get',
			dataType:'json',
			success:function(res) {
				alert(res.userout ? '탈퇴 성공' : '탈퇴 실패');
				location.href='/main';
			},
			error:function(xhr,status,err) {
				alert('error:' + err);
			}
		});
		return false;
	}
</script>
</head>
<body>
	<h3>가입 정보</h3>
		<div>아이디 : ${user.user_id }</div>
		<div>이름 : ${user.user_name }</div>
		<div>전화번호 : ${user.user_phone }</div>
		<div>이메일 : ${user.user_email }</div>
		<div>성별 : ${user.user_sex }</div>
		<div>생년월일 : ${user.user_birth }</div>
		
		<p></p>
		<a href="/user_edit/${user.user_id }">정보 수정</a>
		<a href="javascript:user_out()">회원 탈퇴</a>
</body>
</html>