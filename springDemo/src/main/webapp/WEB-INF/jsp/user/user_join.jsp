<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Join</title>
<style>
	*{ margin:0; padding: 0;}
    body{background-color: #F5F6F7;}
    div{margin-top: 60px;margin-left: 38%;}
    ul,li{ list-style: none;}
    li{margin-bottom: 20px; text-align: left;}
    	.box{width: 450px; height: 50px; border: 1px solid #666; padding: 10px;}
        .pbox{width: 120px; height: 50px; border: 1px solid #666; padding: 10px;}
        .necessary{font-size: small; color:red;}    
    button{background:#00C850; color:white; width: 450px; border: 1px solid #666; height:50px; font-size: x-large;}

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
	crossorigin="anonymous"></script>
<script>
	function join() { 
		var serData = $('#join_form').serialize();
		$.ajax({
			url:'/join',
			method:'post',
			cache:false,
			data:serData,
			dataType:'json',
			success:function(res) {
				alert(res.joined ? '회원가입 성공' : '회원가입 실패');
				if (res.joined == true) {
					alert('로그인 페이지로 이동합니다!')
					location.href = '/login';
				}
			},
			error:function(xhr,status,err) {
				alert('error?' + err);
			}
		});
		return false;
	}
</script>
</head>
<body>
   <form id="join_form" onsubmit="return join();">
      <div>
      	<ul>
      		<li><span>아이디</span><br><input type="text" id="user_id" name="user_id" class='box'></li>
     		<li><span>비밀번호</span><input type="password" id="user_pwd" name="user_pwd" class='box'></li>
     	    <li><span>이름</span><input type="text" id="user_name" name="user_name" class='box'></li>
   			<li><span>전화번호</span><input type="text" id="user_phone" name="user_phone" class='box'></li>
  			<li><span>이메일</span><input type="email" id="user_email" name="user_email" class='box'></li>
			<li><span>성별</span><br>남성<input type="radio" id="user_sex" name="user_sex" value="1">
            여성<input type="radio" id="user_sex" name="user_sex" value="2"></li>
      		<li><span>생년월일</span><input type="date" id="user_birth" name="user_birth" required></li>
       </ul>
      </div>
      <p></p>
      <button type="submit">회원가입</button>
      <button type="reset">초기화</button>
   </form>
</body>
</html>