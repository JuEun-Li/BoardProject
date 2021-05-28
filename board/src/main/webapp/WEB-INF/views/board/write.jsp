<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<style scoped>
	.write-box {
		text-align: center;
		vertical-align: middle;
		border: 5px solid azure;
		box-shadow: 10px 10px 10px azure;
	/* 	left: 25%; */
		padding: 3% 2% 3% 2%;
		margin-bottom: 5%;
		background-color: aliceblue;
	}
	li {
		list-style: none;
		float: right;
		margin: 5% 10% 5% 0;
	}
	input, textarea {
		display: inline-block;
		margin-left: auto;
		margin-right: auto;
		/* left: 25%; */
		border: none;
    	/* background-color: aliceblue; */
    	min-height: 50px;
    	box-shadow: 5px 5px 8px #f1f1f1;
    	border-radius: 3%;
	}
	h1 {
		padding: 3% 0 3% 10%;
		color: navy;
	}
	label {
		margin: 3%;
		font-size: 1.3vw;
	}
</style>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="<c:url value="/resources/static/common.css"/>" rel='stylesheet' />
<title>게시물 작성</title>
</head>
<body>
	<%-- <div id="nav">
	 <%@ include file="../include/nav.jsp" %>
	</div> --%>
	
	<h1><strong>게시물 작성</strong></h1>
	
	<c:if test="${msg == null }">
	<form action="write" method="post" enctype="multipart/form-data">
		<!-- input 과 textarea의 이름 속성의 값이 BoardVO와 일치해야한다. -->
		<div class="write-box container">
			<label>제목</label><br>
			
			<!-- form-control 클래스 값 넣어주면 됨. -->
			<input type="text" name="title" class=" col-lg-6 col-md-6"/><br />
			
			<!-- 여기서 readonly는 읽기 전용(수정 불가) -->
			<label>작성자</label><br>
			
			<input type="text" name="writer" 
			value="${member.userName}" readonly="readonly"
			class=" col-lg-6 col-md-6"/><br />
			
			<label>내용</label><br>
			<textarea cols="100" rows="10" name="content" class=" col-lg-8 col-md-8"></textarea><br />
 			
	 		<label><strong>업로드</strong></label>
			<input type="file" name="uploadFile" style="background-color: white;"/><br />
		    			
			<button type="submit" class="btn btn-default"
			 style="background-color: skyblue; color: white; font-size: 1.5vw;  margin-top: 5%;">
			 작성</button>
		</div>
	</form>
	</c:if>

	<c:if test="${msg == false }">
		<p>로그인을 하셔야 글 작성이 가능합니다.</p>
		
		<li>
			<button type="button" class="btn btn-default" style="background-color: rgb(235, 233, 250);" >
				<a href="/board/listPageSearch?num=1">글 목록</a>
			</button>
		</li>
	</c:if>
</body>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</html>