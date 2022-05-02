<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
	crossorigin="anonymous"></script>
<script>
	function logout() {
		if(!confirm('로그아웃 하시겠습니까?')) return;
		$.ajax({
			url:'/logout',
			method:'get',
			dataType:'json',
			cache:false,
			success:function(res) {
				alert(res.logoutok ? '로그아웃 성공' : '로그아웃 실패');
				if (res.logoutok) {
					location.href="/main";
				}
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
<h1>메인 페이지</h1>
	<c:if test="${user_id == null }">
		WELCOME!
		<a href="/login">로그인</a>
	</c:if>
	
	<c:if test="${user_id != null }">
		WELCOME, ${user_id }!
		<a href="/user_info/${user_id}">회원 정보</a>
		<a href="javascript:logout();">로그아웃</a>
	</c:if>
		
</body>
</html>