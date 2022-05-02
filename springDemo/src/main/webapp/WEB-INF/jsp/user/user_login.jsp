<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Log In</title>
        <meta charset="utf-8">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" 
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
		crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../resources/css/style.css">
        <script>
         
        function login() {
        	var serData = $('#login_form').serialize();
        	$.ajax({
        		url:'/login',
        		method:'post',
        		cache:false,
        		data:serData,
        		dataType:'json',
        		success:function(res) {
        			alert(res.loginsuccess ? '로그인 성공' : '로그인 실패');
        			if (res.loginsuccess == true) {
        				location.href = '/main';
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
    	<form id="login_form" onsubmit="return login();">
	        <div class="wrapper">
	            <h1>Log In</h1>
	            <div class="ID">
	                <input type="text" id="user_id" name="user_id" placeholder="ID" required><br>
	                
	            </div>
	            <div class="password">
	                <input type="password" id="user_pwd" name="user_pwd" placeholder="Password" required><br><br>
	            </div>
	            <div class="div_button">
	                <button class="button" type="submit">Log In</button>
	                <button class="button" type="button" onclick="location.href='/join' ">회원가입</button>
	            </div>
	        </div>
		</form>
    </body>
</html> 