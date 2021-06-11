<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<style scoped>
	h2 {
		padding: 3% 0 3% 1%;
		color: rgb(171 156 216);
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
	.complete_btn {
		border-style: none;
		background-color: rgb(200, 196, 226);
		color: white;
		padding: 1%;
		margin: 0% 0% 5% 0;
	}
	.cancel_btn {
		border-style: none;
		background-color: rgba(235, 233, 250);
		color: gray;
		padding: 1%;
		
		float: right;
		margin: 2% -5% 5% 0;
	}
</style>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>게시물 수정</title>

<!-- ckeditor 사용을 위해 js 파일 연결 -->
<script src="/resources/ckeditor/ckeditor.js"></script>

</head>
<body>
	<h2 class="title"><strong>게시물 수정</strong></h2><hr>
	
	<form method="post" enctype="multipart/form-data">
	
<input type="hidden" id = "SearchType" name="SearchType" value="${page.searchType}" readonly="readonly"/>
<input type="hidden" id = "keyword" name="keyword" value="${page.keyword}" readonly="readonly"/>

		<div id="list" class="container col-lg-7 col-md-9">
			<!-- 제목 -->
			<h2 style="text-align: center;">
				제목: <input type="text" name="title" value="${view.title}"/>
			</h2><br>
			
			<label style="float: right;">
				작성자 : <input type="text" name="writer" value="${view.writer}" readonly="readonly"/>
			</label><br />
			
			<!-- 내용 -->		
			<span style="display:block; min-height: 250px; margin-top: 5%;">
				<textarea cols="90" rows="30" name="content" id="content">${view.content}</textarea>
			</span>
			
			<script>
				//CKEDITOR.replace("description"); //태그의 id
				//이미지 업로드를 할 경우
				CKEDITOR.replace("content",{
				
				//CKEDITOR.replace와 id("description")를 잘 적어주면 그 태그가 smart editor 스타일로 바뀌게 된다. 
					width:'100%',
 		            height:'400px',
				    filebrowserUploadUrl : "${path}/imageUpload.do",
				
				//파일을 업로드 해야하기 때문에 filebrowserUploadUrl을 사용하고, 서버쪽에 코드를 완성해주어야 한다.
				
				});
			</script>
			
			<br />

			<!-- 파일 업로드 -->			
			<label>업로드</label>
			<input type="file" name="uploadFile" style="background-color: white;"/><br />
			
			<div><a href="fileDownload.do?fileName=${view.fileName}">${view.fileName}</a></div>
			<button type="submit" class="complete_btn rounded">완료</button>
			
		</div>
	</form>
	<button type="submit" id="cancel_btn" class="cancel_btn rounded">취소</button>

</body>
<script>

	/* 글 목록 이동 스크립트 */
	$(document).ready(function() {
		$('#moveMove').on('click', function() {
			location.href='/board/listPageSearch?num=1';
			/* location.href='/board/listPageSearch?num=1" + "&searchType=" + searchType + "&keyword=" + keyword'; */
		});
	})
	
	//취소 버튼 클릭
 	$('#cancel_btn').click(function() {
		self.location = "/board/listPageSearch?"
				+ "num=${1}"
				+ "&searchType=${page.searchType}&keyword=${page.keyword}";
	}) 
</script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</html>