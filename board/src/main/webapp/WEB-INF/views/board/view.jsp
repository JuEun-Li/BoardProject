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
	 	padding-bottom: 5%;
	 	margin-top
	}
	#moveModify, #moveDelete {
		border-style: none;
		background-color: rgb(200, 196, 226);
		color: white;
		padding: 2%;
		margin: 0 1% 0 0;
		
		float: right;
	}
	#list_btn {
		float: right;
		padding: 2%;
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
		min-height: 400px;
		margin-top: 5%;
	}
</style>
<head>
<meta charset="UTF-8">
<link href="<c:url value="/resources/static/common.css"/>" rel='stylesheet' />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<!-- jquery 관련 태그들 -->	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>게시물 조회</title>
<script src="/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	
<form action="view" method="post" enctype="multipart/form-data">

<!-- 검색어 저장 관련 -->
<%-- <input type="hidden" id = "num" name="num" value="${page.num}" readonly="readonly"/> --%>
<input type="hidden" id = "SearchType" name="SearchType" value="${page.searchType}" readonly="readonly"/>
<input type="hidden" id = "keyword" name="keyword" value="${page.keyword}" readonly="readonly"/>
<!-- 검색어 저장 관련 끝-->
<h2 id="title"><strong>상세 조회</strong></h2><br><hr>
	<div id="list" class="container col-lg-7 col-md-9">
		<!-- 제목 -->
		<h2 style="text-align: center;">${view.title}</h2><br>
		
		<!-- 작성자 -->
		<div style="float: right;">
		작성자 : <c:out value="${fn:escapeXml(view.writer)}" escapeXml="false"/>
		</div>
		<br />
			
			<!-- 내용 출력 - 스크립트 막기 -->	
			<div class="inputArea">
				<div class="content">
				<%-- <c:out value="${view.content}" escapeXml="false"/> --%>
				<%--  <c:out value='${view.content.replaceAll("\\\<.*?\\\>","")}' escapeXml="false"/> --%>
				 ${view.content}
				</div>
			</div>

		<!-- 게시물 수정 -->
		<input type="button" id="moveModify" class="btn_shape btn btn-default" value="게시물 수정">
			
		<!-- 게시물 삭제 -->
		<input type="button" id="moveDelete" class="btn_shape btn btn-default"  
			style="background-color: pink;" 
			value="게시물 삭제">
		<!-- 목록 -->
		<div><button type="button" id="list_btn">목록</button></div>
			
			
		<!-- 문제 부분 -->
	    <%--  <c:if test="${board.fileName ne null}"> --%>
				<div>첨부 파일: <a href="/fileDownload.do?fileName=${view.fileName}">${view.fileName}</a></div><br>
		<%--  </c:if> --%>
		
	</div>
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