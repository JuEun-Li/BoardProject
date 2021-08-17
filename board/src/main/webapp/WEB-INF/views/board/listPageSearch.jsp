 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 날짜 포멧 추가 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">

<!DOCTYPE html>
<html>
<style scoped>
table {
	margin-left: auto;
	margin-right: auto;
	border-collapse: collapse;
	text-align: center;
	font-size: 1.0vw;
	margin-top: 2%;
}

button:active {
	-ms-transform: translateY(2px);
	-webkit-transform: translateY(2px);
	transform: translateY(2px);
	background: #ccc;
}
button {
	border: none;
	padding: 10px;
}

table td {
	padding: 15px;
	/* border: 1px solid lightgray; */
}

th:nth-child(2) {
	width: 40%;
}

table th {
	padding: 10px;
	border: 1px solid rgb(235, 233, 250);
	background-color: rgb(235, 233, 250);
	color: gray
}

h2 {
	padding-top: 40px;
	padding-bottom: 2%;
	color: rgb(171 156 216);
	text-align: center;
}
#searchBtn {
	background-color: lightgray;
	color: white;
	vertical-align: top;
	height: 38px;
}
.form-control {
	display: inline-block;
}

/* 글 작성, 목록, 회원 정보 수정 버튼 */
.write_btn, .list_btn{
	float: right;
	padding: 10px;
	border: 1px solid rgb(200, 196, 226);
	background-color: rgb(200, 196, 226);
	/* color: gray; */
	color: white;
	border-radius: .25rem;
	margin-right: 0.5%;
}
/*회원정보 수정, 로그인*/
.member_modify_btn, .login_btn {
	float: left;
	background-color: rgb(200, 196, 226);
	border:  rgb(200, 196, 226);
	color: white;
	border-radius: .25rem;
}

/* 글 작성 ㅡㄴ */
.write_btn {
	border: 1px solid rgb(164 174 210); 
	background-color:rgb(164 174 210);
}
.write_btn:hover, .list_btn:hover, .member_modify_btn:hover{
	 background-color: rgba(0,0,0,0);
	 color: rgb(171 156 216);
	 cursor: pointer;
}

/* 폼 서식 */
.con {
    width: 100%;
    height: calc(1.5em + .75rem + 2px); 
    padding: .375rem .75rem; 
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: .25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}

/* --------미디어 서식-------- */
@media (max-width: 767px) {
  /* 스마트폰 사이즈 */
  .table td, .table th {
  	height: 40px;
  	font-size: 1.9vw;
  }
  .write_btn, .list_btn, .member_modify_btn {
  	min-width: 90px;
  	height: 40px;
  	font-size: 1.9vw;
  }
  .main {
	padding: 1% 1% 0% 1%;
  }

  
 }
  
@media all and (min-width: 768px ) and (max-width: 991px) {
  /* 태블릿 */
  .table td, .table th {
  	height: 60px;
  	font-size: 1.7vw;
  }
  .write_btn, .list_btn, .member_modify_btn {
  	min-width: 130px;
  	height: 60px;
  	font-size: 1.9vw;
  }
  .main {
	padding: 1% 5% 0% 5%;
  }

}
@media (min-width: 992px) {
  /* 컴퓨터 */
	 .main {
		padding: 1% 15% 0% 15%;
	}

}
</style>

<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- jquery 관련 태그들 -->	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>게시물 목록</title>
</head>
<body class="container-fluid">
<div class="main">
		<c:if test="${member !=null }">			
			<button type="button" class="member_modify_btn" onclick="location.href='/member/modify_pass'">회원정보 수정</button>		
			<button type="button" class="btn default" onclick="location.href='/member/logout'">로그아웃</button>
			<a href="/member/withdrawal">회원탈퇴</a>		
		</c:if>
		
		<c:if test="${member == null }">			
			<button type="button" class="login_btn" onclick="location.href='/'">
				<!-- 로그인 페이지 -->
				로그인
			</button>
		</c:if>
		
		<!-- 언어 선택 영역 -->
	<div class="col-lg-2 col-md-4 col-sm-5 col-xs-5" style="float: right;">
	<select class="form-control" id="testBox">
		<option>언어 선택</option>
		<option value="ko">한국어</option>
		<option value="en">영어</option>
		<option value="zh">중국어</option>
	</select>
	</div>
	
	<!-- 환영합니다! -->
	<h2><strong><spring:message code="site.board" /></strong></h2>
	<br>
	
		<!-- 검색 영역 -->
		<div style="display: inline;">
			 <select name="searchType" class="con col-lg-2 col-md-3 col-sm-4 col-xs-3">
			 	<!-- test 내부에 조건이 들어감, 이 조건이 참일 경우 selected를 출력, 거짓인 경우 아무 것도 출력하지 않음 -->
			     <option value="title" <c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
			     <option value="content" <c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
			     <option value="title_content" <c:if test="${page.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
			     <option value="writer" <c:if test="${page.searchType eq 'writer'}">selected</c:if>>작성자</option>
			 </select>
	 	
			 <input type="text" name="keyword" value="${page.keyword}" class="con col-lg-3 col-md-3 col-sm-4 col-xs-3"/>
			 
			 <button type="button" id="searchBtn" class="btn btn-default"><i class="fas fa-search"></i></button>
		</div>
		<!-- 검색 영역 끝 -->
		
	<span style="float: right; color: #8a8989; font-size: 1.0vw;">
		총 ${count}개의 게시물이 있습니다.
	</span>
	<table class="table table-hover col-lg-12">
		<thead>
			<tr>
				<!-- 번호 -->
				<th><spring:message code="site.num" /></th>
				<!-- 제목 -->
				<th><spring:message code="site.title" /></th>
				<!-- 작성일 -->
				<th><spring:message code="site.date" /></th>
				<!-- 작성자 -->
				<th><spring:message code="site.writer" /></th>
				<!-- 조회수 -->
				<th><spring:message code="site.count" /></th>
			</tr>
		</thead>
		
		<!-- 리스트 출력 영역 -->
		<tbody>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.rowno}</td>
					
					<!-- 아래 a태그 클릭시 상세 조회 -->
					<td>
						<a href="/board/view?bno=${list.bno}&
											searchType=${page.searchType}&
											keyword=${page.keyword}">${list.title} </a>
											
											<!-- 첨부파일이 있는 게시물은 아이콘 표시 처리 -->
											<c:if test="${list.fileName ne null}">
												<i class="fas fa-paperclip" style="color: darkgray;"></i>
											</c:if>
					</td>
					
					<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" /></td>
					<td>${list.writer}</td>
					<td>${list.viewCnt}</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>

	<div>
		<!-- 페이징 영역 -->
		<div style="text-align: center; font-size: 1.5vw; color: rgb(171 156 216);">
			<c:if test="${page.prev}">
				<span style="font-size: 1.1vw; color: gray; vertical-align: center;">[ <a href="/board/listPageSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a> ]</span>
			</c:if>
	
			<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
				 <span>
					<!-- 만약 select의 값이 num과 다를 경우 링크 그대로 출력 -->
					  <c:if test="${select != num}">
					   <a href="/board/listPageSearch?num=${num}${page.searchTypeKeyword}">${num}</a>
					  </c:if>    
					  
					  <!-- 만약 select의 값이 num과 같을 경우 굵은 글자로 출력 -->
					  <c:if test="${select == num}">
					   <b style="padding: 0.5%; font-size: 1.7vw">${num}</b>
					  </c:if>
					    
				 </span>
			</c:forEach>
	
			<c:if test="${page.next}">
				 <span style="font-size: 1.1vw; color: gray; vertical-align: center;">
				 	[<a href="/board/listPageSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a>]
				 </span>
			</c:if>
		</div>
		<!-- 페이징 영역 끝 -->
		
		
				
				<!-- 글 작성 -->
				<button type="button" class="write_btn" onclick="location.href='/board/write'">
					<spring:message code="site.write" />
				</button>		
				
				<!-- 글 목록 -->
				<button type="button" class="list_btn" onclick="location.href='/board/listPageSearch?num=1'">
					<spring:message code="site.list" />
				</button>	
		
	</div>
</div>
	<%-- <div id="nav">
		<%@ include file="../include/nav.jsp"%>
	</div> --%>
	
<script>
	/* 검색 링크 구간 */
 	document.getElementById("searchBtn").onclick = function () {
   
	  	let searchType = document.getElementsByName("searchType")[0].value;
	  	let keyword =  document.getElementsByName("keyword")[0].value;
	  
	  	/* 해당 url로 이동하는 기능 */
	  	location.href = "/board/listPageSearch?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
 	};
 	
 	/* 번역 링크 구간 */
 	$(document).ready(function(){
		
		$('#testBox').on('change', function(){
			var lan = $('#testBox').val();
			location.href='<c:url value="/i18n.do?lang='+lan+'" />';
		});
	});
</script>
</body>
</html>