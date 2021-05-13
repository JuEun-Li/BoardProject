<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style scoped>
	h1 {
		padding: 5% 0 5% 1%;
		text-align: center;
	}
	#moveMove {
		border-style: none;
		background-color: rgb(235, 233, 250);
		box-shadow: 3px 3px 3px rgb(235, 233, 250);
		color: gray;
		float: right;
		
		margin: 5% 5% 0 0;
	}
	#list {
	 	border: 5px solid rgb(235, 233, 250);
	 	box-shadow: 5px 5px 5px rgb(235, 233, 250);
	 	padding: 3%;
	 	min-height: 500px;
	}
	#moveModify, #moveDelete, .complete_btn  {
		border-style: none;
		background-color: rgb(235, 233, 250);
		color: gray;
		padding: 2%;
		margin-right: 1%;
		
		float: right;
	}
	.cancel_btn {
		border-style: none;
		background-color: rgb(235, 233, 250);
		color: gray;
		padding: 1%;
		
		float: right;
		margin: 3% 5% 0 0;
	}
</style>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>게시물 수정</title>
</head>
<body>
	<h1>게시물 수정</h1>
	<%-- <form method="post">		
		 
		<label>제목</label>
		<input type="text" name="title" value="${view.title}"/><br />
		
		<label>작성자</label>
		<input type="text" name="writer" value="${view.writer}"/><br />
		
		<label>내용</label>
		<textarea cols="50" rows="5" name="content">${view.content}</textarea><br />
	
		<button type="submit" class="btn">완료</button>
		
		<input type="button" id="moveMove" class="btn_shape btn btn-default" value="취소">
	
	</form> --%>
	
	<form method="post">

		<div id="list" class="container col-lg-6 col-md-6">
			<!-- 제목 -->
			<h2 style="text-align: center;"><input type="text" name="title" value="${view.title}"/></h2><br>
			
			<label style="float: right;">작성자 : <input type="text" name="writer" value="${view.writer}"/></label><br />
			
			<!-- 내용 -->		
			<span style="display:inline-block; min-height: 250px;">
				<textarea cols="90" rows="10" name="content">${view.content}</textarea>
			</span><br />
	

				<button type="submit" class="complete_btn btn_shape btn btn-default">완료</button>
		</div>
	</form>
	
				<input type="button" id="moveMove" class="cancel_btn rounded" value="취소">
</body>
<script>

	/* 글 목록 이동 스크립트 */
	$(document).ready(function() {
		$('#moveMove').on('click', function() {
			location.href='/board/listPageSearch?num=1';
		});
	})
</script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</html>