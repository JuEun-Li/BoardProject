<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style scoped>
	label {
		/* border: 1px solid aliceblue; */
		text-align: center;
		display: block;
		padding: 1%;
	}
	h1 {
		padding: 3% 0 5% 1%;
	}

</style>
<head>
<meta charset="UTF-8">
<link href="<c:url value="/resources/static/common.css"/>" rel='stylesheet' />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<title>게시물 조회</title>
</head>
<body>
	<%-- <div id="nav">
	 <%@ include file="../include/nav.jsp" %>
	</div><br /> --%>
	
	<h1> 게시물 조회 </h1><hr/>
	
	
<form method="post">

	<label>제목 |</label>
	${view.title}<br />
	
	<label>작성자 |</label>
	${view.writer}<br />
	
	<label>내용 |</label>
	${view.content}<br /><hr />
	
	
	<div>
		<a href="/board/modify?bno=${view.bno}">게시물 수정</a>
		<a href="/board/delete?bno=${view.bno}">게시물 삭제</a>
	</div>
	
	<li>
		<button type="button" class="button rounded">
			<a href="/board/listPageSearch?num=1" >글 목록(페이징 + 검색)</a>
		</button>
	</li>

</form>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</html>