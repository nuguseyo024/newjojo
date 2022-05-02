<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
	crossorigin="anonymous"></script>
<script>
	function user_edit() {
		var serData = $('#user_edit').serialize();
		$.ajax({
			url:'/user_update',
			method:'post',
			cache:false,
			data:serData,
			dataType:'json',
			success:function(res) {
				alert(res.userupdated ? '수정 성공' : '수정 실패');
				location.href='/user_info/${user_id}';
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
	<h3>가입 정보 수정</h3>
		<form id="user_edit" onsubmit="return user_edit();">
			<div><label>아이디 ${user.user_id } <input type="hidden" id="user_id" name="user_id" value="${user.user_id }" readonly></label></div>
			<div><label><input type="hidden" id="user_pwd" name="user_pwd" value="${user.user_pwd }" readonly></label></div>
			<div><label>이름 ${user.user_name } <input type="hidden" id="user_name" name="user_name" value="${user.user_name }" readonly></label></div>
			<div><label>전화번호 <input type="text" id="user_phone" name="user_phone" value="${user.user_phone }" required></label></div>
			<div><label>이메일 <input type="text" id="user_email" name="user_email" value="${user.user_email }" required></label></div>
			<div>성별  ${user.user_sex } </div>
			<div><label>생년월일  ${user.user_birth }</label></div>
			<p></p>
			<button type="submit">수정하기</button>
		</form>
		
</body>
</html>