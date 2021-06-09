<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<style scoped>
	.write-box {
		text-align: center;
		vertical-align: middle;
		border: 5px solid aliceblue;
		padding: 1% 5% 3% 5%;
		margin-bottom: 5%;
	}
	li {
		list-style: none;
		float: right;
		margin: 5% 10% 5% 0;
	}
	input, textarea {
		display: inline-block;
		border: none;
    	min-height: 50px;
    	box-shadow: 3px 2px 5px #afadad;
    	border-radius: 3%;
    	
	}
	h2 {
		padding: 3% 0% 0% 15%;
		/* color: rgb(171 156 216); */
		color: lightblue;
	}
	div {
		margin: 3% 1% 1% 2%;
		font-size: 1.1vw;
		text-align: center;
	}
</style>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="<c:url value="/resources/static/common.css"/>" rel='stylesheet' />
<!-- jquery 관련 태그들 -->	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>게시물 작성</title>
<script src="/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	<%-- <div id="nav">
	 <%@ include file="../include/nav.jsp" %>
	</div> --%>
	
	<h2><strong>게시물 작성</strong></h2>
	<br><hr class=" col-lg-9">
	
	<c:if test="${msg == null }">
	<form action="write" method="post" enctype="multipart/form-data">
		<!-- input 과 textarea의 이름 속성의 값이 BoardVO와 일치해야한다. -->
		
		<div class="write-box container">
			<%-- <div class=" col-lg-9">제목
				<!-- form-control 클래스 값 넣어주면 됨. -->
				<input type="text" name="title" class=" col-lg-9"/>
			</div>
			
			<!-- 여기서 readonly는 읽기 전용(수정 불가) -->
			<div class=" col-lg-9">작성자		
				<input type="text" name="writer" 
				value="${member.userName}" readonly="readonly" class=" col-lg-9"/>
			</div><br /> --%>
			<table class="col-lg-9">
				<tr>
					<td class="col-lg-2"><div>제목</div></td>
					<td><input type="text" name="title" class="col-lg-12" style="margin: 3% 0% 3% 0%;"/></td>
				</tr>
				<tr>
					<td><div>작성자</div></td>
					<td><input type="text" name="writer" 
						value="${member.userName}" readonly="readonly"  class="col-lg-12" style="margin-bottom: 2%;"/></td>
				</tr>
			</table>
		
			<br>
			<textarea cols="80" rows="30" name="content" class=" col-lg-7" id = "content"></textarea><br />
 			<script>
				 var ckeditor_config = {
				   resize_enaleb : false,
				   enterMode : CKEDITOR.ENTER_BR,
				   shiftEnterMode : CKEDITOR.ENTER_P,
				   filebrowserUploadUrl : "/admin/goods/ckUpload"
				 };
				 
				 CKEDITOR.replace("content", ckeditor_config);
			</script>
			            
	 		<label><strong>업로드</strong></label>
			<input type="file" name="uploadFile" style="background-color: white;"/><br />
		    			
			<button type="submit" class="btn btn-default"
			 style="background-color: skyblue; color: white; font-size: 1.3vw;  margin-top: 5%;">
			 작성</button><br>
			 <a href="/board/listPageSearch?num=1" style="float:right;">취소</a>
		</div>
	</form>
	</c:if>

	<c:if test="${msg == false }">
		<p>로그인을 하셔야 글 작성이 가능합니다.</p>
		
		<li>
			<button type="button" class="btn btn-default" style="background-color: rgb(235, 233, 250);" >
				<a href="/board/listPageSearch?num=1">취소</a>
			</button>
		</li>
	</c:if>
	
</body>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</html>