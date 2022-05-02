<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% 
   response.setHeader("Cache-Control","no-store"); 
   response.setHeader("Pragma","no-cache"); 
   response.setDateHeader("Expires",0); 
   if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>사원정보 수정폼</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>
   function formCheck(){
      if($('#dept').val()=='' || $('#salary').val()==''){
         alert('모든 항목을 입력하세요');
         return false;
      }
      if(!confirm('정말로 수정하시겠어요?')){
         return false;
      }
      var serData = $('#formData').serialize();
      $.ajax({
         url:'/emp/update',
         method:'post',
         cache:false,
         data:serData,
         dataType:'json',
         success:function(res){
            alert(res.updated? "수정 성공!!" : "수정 실패..");
            location.href="/emp/detail?no=${detail.no}";
         },
         error:function(xhr, status, err){
            alert('에러: '+err);
         }         
      });         
      return false;
   }
</script>
</head>
<body>
<h3>사원정보 수정폼</h3>
<form id="formData" onsubmit="return formCheck();">
   <div>사번<input type="text" id="no" name="no" value="${detail.no}" readonly></div>
   <div>이름<input type="text" id="name" name="name" value="${detail.name}" readonly></div>
   <div>부서<input type="text" id="dept" name="dept" value="${detail.dept}"></div>
   <div>급여<input type="text" id="salary" name="salary" value="${detail.salary}"></div>
   <div><button type="submit">저장</button><button type="reset">취소</button></div>
</form>
</body>
</html>