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
		padding: 5% 0 3% 1%;
		text-align: center;
	}
	.btn_shape {
		border-style: none;
		background-color: rgb(235, 233, 250);
		box-shadow: 3px 3px 3px rgb(235, 233, 250);
		color: gray;
		float: right;
		
		margin: 5% 20% 0 0;
	}
	
	#list {
	 	border: 5px solid rgb(235, 233, 250);
	 	box-shadow: 5px 5px 5px rgb(235, 233, 250);
	 	padding: 3%;
	 	min-height: 500px;
	}
	#moveModify, #moveDelete {
		border-style: none;
		background-color: rgb(235, 233, 250);
		color: gray;
		padding: 2%;
		margin: 0 1% 0 0;
		
		float: right;
	}

</style>
<head>
<meta charset="UTF-8">
<link href="<c:url value="/resources/static/common.css"/>" rel='stylesheet' />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<!-- jquery 관련 태그들 -->	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>게시물 조회</title>
</head>
<body>
	
	<h1> 게시물 조회 </h1>
	
	
<form method="post">

	<div id="list" class="container col-lg-6 col-md-6">
		<!-- 제목 -->
		<h2 style="text-align: center;">${view.title}</h2><br>
		
		<label style="float: right;">작성자 : ${view.writer}</label>
		<br />
		
		<!-- 내용 -->		
		<span style="display:inline-block; min-height: 250px;">${view.content}</span><br />

			<%-- <a href="/board/modify?bno=${view.bno}">게시물 수정</a> --%>
			<input type="button" id="moveModify" class="btn_shape btn btn-default" value="게시물 수정">
			
			<%-- <a href="/board/delete?bno=${view.bno}">게시물 삭제</a> --%>
			<input type="button" id="moveDelete" class="btn_shape btn btn-default"  
				style="background-color: pink;" 
				value="게시물 삭제">
	</div>

		<!-- 뒤로 가기 버튼(데이터 유지) -->		
		<input type="button" value="글 목록" class="btn_shape btn btn-default" onclick="history.back(-1)">

</form>

<script>

	/* 글 목록 이동 스크립트 */
	$(document).ready(function() {
		$('#moveModify').on('click', function() {
			location.href='/board/modify?bno=${view.bno}';
		});
		
		$('#moveDelete').on('click', function() {
			location.href='/board/delete?bno=${view.bno}';
		});
		
	/* 	$('#moveMove').on('click', function() {
			location.href='/board/listPageSearch?num=1';
		}); */
	})
</script>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</html>