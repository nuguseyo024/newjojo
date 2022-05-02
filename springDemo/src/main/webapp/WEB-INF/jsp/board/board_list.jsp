<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_list</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
   integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" 
   crossorigin="anonymous"></script>
<style>
td { border : 1px dotted grey; }
</style>
<script>
	function search(){
		var keyword = $('#keyword').val();
		alert(keyword);
		location.href="/board/board_searchList/"+keyword;
	}
</script>    
</head>
<body>
<div>
	<h2>board_list</h2>
</div>
	<div >
		<table>
			<thead>
				<tr>
					<th>번호 </th>
					<th>제목 </th>
					<th>작성자 </th>
					<th>날짜 </th>
					<th>조회수 </th>			
				</tr>
			</thead>
			<tbody>
		<tbody>
				
			<!-- 게시판 목록 출력 영역   -->
			<c:forEach var="board" items="${pageInfo.list }">				
				<tr>
					<td>${board.board_num }</td>
					<td><a href="/board/board_read/${board.board_num }" 
					style="text-decoration:none; color:black;"> ${board.board_title }</a></td>
					<td> ${board.b_user_id }</td>
					<td>${board.board_date }</td>
					<td>${board.board_hit }</td>						
				</tr>
			</c:forEach>					
			</tbody>
		</tbody>
	</table>
		<!-- ------------------------- 게시판 영역 끝 --------------------------------- -->
		
		<!-- ------------------------- 페이징 처리 영역 시작  --------------------------------- -->
<nav aria-label="Page navigation example">
  <ul class="pagination">
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Previous">
        <span aria-hidden="true">&laquo;</span>
      </a>
    </li>    
     <c:forEach var="i" items="${pageInfo.navigatepageNums}">
	      <c:choose>
	         <c:when test="${i==pageInfo.pageNum}">
	           <a href="/board/board_list/${i}" class="page-link">${i}</a>
	         </c:when>
	         <c:otherwise>
	            <a href="/board/board_list/${i}" class="page-link">${i}</a>
	         </c:otherwise>
	      </c:choose> 
	   </c:forEach>
    <li class="page-item">
      <a class="page-link" href="#" aria-label="Next">
        <span aria-hidden="true">&raquo;</span>
      </a>
    </li>
  </ul>
</nav>
</div>
		<!-- ------------------------- 페이징 처리 영역 끝  --------------------------------- -->

<div>
	<a href="/board/write_view" >글 쓰기</a>
</div>
<div>
	<form id="search_form" method="get" action="/board/board_searchList">
		<input type="text" id="keyword" name="keyword" placeholder="Search">
		<button type="submit">search </button>
    </form>
</div>
</body>
</html>