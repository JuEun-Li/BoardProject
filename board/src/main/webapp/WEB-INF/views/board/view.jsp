<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
	/* 수정, 삭제 버튼 */
	.btn_shape {
		border-style: none;
		background-color: white;
		box-shadow: none;
		color: gray;
		font-size: 0.7vw;
		margin-bottom: 5%;	
	}
	
	#list {
/* 	 	border: 5px solid rgb(235, 233, 250);
	 	box-shadow: 5px 5px 5px rgb(235, 233, 250); */
	 	 padding: 2% 0% 0% 0%;
	}

	#list_btn {
		float: right;
		padding: 1% 2% 1% 2%;
		border: 1px solid rgb(164 174 210);
		background-color: rgb(164 174 210);
		color: white;
		border-radius: .25rem;
		margin-right: 0.5%;
	}
	#list_btn:hover {
	 background-color: rgba(0,0,0,0);
	 color: rgb(164 174 210);
	}
	#title {
		padding: 3% 0% 0% 15%;
		color: rgb(171 156 216);
	}
	.inputArea {
		min-height: 300px;
		margin-top: 5%;
	}
	
	/* 댓글 영역 */
	.reply_box {
		list-style: none;
		margin: 2% 0% 2% 0%;
	}
	/* 댓글 입력 박스 */
	.reply_write {
		margin: 0% 0% 5% 0%;
		background-color: rgb(247 246 255);
		padding: 1% 0% 1% 10%;
		box-shadow: 5px 5px 5px rgb(247 246 255);
	}
	.reply_write_btn {
		padding: 1% 2% 1% 2%;
		border: 1px solid rgb(164 174 210);
		background-color: rgb(164 174 210);
		color: white;
		border-radius: .25rem;
		vertical-align: bottom;
	}
	
	input, textarea {
		display: inline-block;
		border: none;
    	min-height: 50px;
    	box-shadow: 3px 2px 5px #afadad;
    	border-radius: 3%;
	}
</style>
<head>
<meta charset="UTF-8">
<link href="<c:url value="/resources/static/common.css"/>" rel='stylesheet' />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">

<!-- jquery 관련 태그들 -->	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>게시물 조회</title>
<script src="/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	
<form action="view" method="post" enctype="multipart/form-data">

<!-- 검색어 저장 관련 -->
<input type="hidden" id = "SearchType" name="SearchType" value="${page.searchType}" readonly="readonly"/>
<input type="hidden" id = "keyword" name="keyword" value="${page.keyword}" readonly="readonly"/>
<!-- 검색어 저장 관련 끝-->

<h2 id="title">
	<strong>상세 조회</strong>
</h2>
<br><hr>

	<div id="list" class="container col-lg-7 col-md-9 col-sm-9">
		<!-- 제목 -->
		<h2 style="text-align: center;"><strong>${view.title}</strong></h2><br>
		
		<!-- 작성자 -->
		<div style="float: right;">
			<i class="fas fa-user-circle fa-2x" style="color: gray;"></i>
			<strong><c:out value="${fn:escapeXml(view.writer)}" escapeXml="false"/></strong><br>
			등록일 : <fmt:formatDate value="${view.regDate}" pattern="yyyy-MM-dd" /><br>
			
			<!-- 게시물 삭제 -->
			<input type="button" class="btn_shape" value="게시물 삭제 ">  |
			
			<!-- 게시물 수정 -->
			<input type="button" class="btn_shape" value="게시물 수정">			
		</div>
		<br />
			
		<div style="display: inline-block; background-color: rgb(203 197 220); height: 3px;" class="col-lg-12"></div>
			<!-- 내용 출력 - 스크립트 막기 -->	
			<div class="inputArea">
				<div class="content">
				<%-- <c:out value="${view.content}" escapeXml="false"/> --%>
				<%--  <c:out value='${view.content.replaceAll("\\\<.*?\\\>","")}' escapeXml="false"/> --%>
				 ${view.content}
				</div>
			</div>

		
		<!-- 목록 -->
		<div><button type="button" id="list_btn">목록</button></div>
			
		<!-- 첨부 파일 표시 영역 -->
	    <%-- <c:if test="${board.fileName ne null}"> --%>
				<div>첨부 파일: <a href="/fileDownload.do?fileName=${view.fileName}">${view.fileName}</a></div><br>
		<%-- </c:if> --%>
		
		<!-- 댓글 시작 -->
		<hr />
		
		<ul class = "reply_box">
		    <c:forEach items="${reply}" var="reply">
				<li>
				    <div>
				        <p><i class="fas fa-user-circle fa-2x" style="color: gray;"></i>
				        <strong>${reply.writer}</strong> | <fmt:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd hh:mm:ss" /></p>
				        <p>${reply.content }</p>
				    </div>
				</li>    
			</c:forEach>
		</ul>
		<!-- 댓글 끝 -->
	</div>
</form>
			<!-- form 내부의 데이터를 post 형식으로 보내되, /reply/write 경로로 보냄. -->
		   <form method="post" action="/reply/write" class="container col-lg-7 col-md-9 col-sm-9 reply_write">	    
		        <p>
		                     작성자: <input type="text" name="writer">
		        </p>
		        <p>
		            <textarea rows="3" cols="70" name="content"></textarea>

		        	<!-- 게시물 고유 번호를 굳이 표시하지 않음, 개발 시 데이터를 다루기 위한 용도 -->
		        	<input type="hidden" name="bno" value="${view.bno}">
		            <button type="submit" class="reply_write_btn">댓글 작성</button>
		        </p>
		   </form>
		   
<script>
	/* 삭제, 수정 스크립트 */
	$(document).ready(function() {
		$('#moveModify').on('click', function() {
			location.href= "/board/modify?bno=${view.bno}"
					+ "&searchType=${page.searchType}&keyword=${page.keyword}";
				
		});
		
		$('#moveDelete').on('click', function() {
			location.href="/board/delete?bno=${view.bno}"
					+ "&searchType=${page.searchType}&keyword=${page.keyword}";
		});
	})
	
	// 목록 버튼 클릭
	 $("#list_btn").click(function() {
		location.href = "/board/listPageSearch?"
				+ "num=${1}"
				+ "&searchType=${page.searchType}&keyword=${page.keyword}";
	});
</script>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</html>