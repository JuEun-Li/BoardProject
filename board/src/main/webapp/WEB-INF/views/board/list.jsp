<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 날짜 포멧 추가 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<style scoped>
	table {
		margin-left: auto; margin-right: auto;
		border-collapse: collapse; 
		text-align: center;
		font-size: 1.0vw;
		margin-top: 5%;
	}
	button:active { -ms-transform: translateY(2px); -webkit-transform: translateY(2px); transform: translateY(2px); background: #ccc; }
 	table td { 
 		padding: 15px; 
 		/* border: 1px solid lightgray; */ 
 	}
 	/* td:nth-child(2):hover {
 		background-color: lightblue;
 	} */
 	th:nth-child(2) {
 		width: 40%;
 	}
 	
	table th { padding: 10px; border: 1px solid aliceblue; background-color: aliceblue; color: gray }
	
	h1 {
		padding-top: 50px;
		text-align: center;
	}
	 a:link {text-decoration: none;}
	 a:visited {text-decoration: none;}
	 a:active {text-decoration: none;}
	 a:hover {text-decoration: underline;}
 
 	button {
 		color: white;
 	}


</style>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<!-- <link rel="stylesheet" type="text/css" href="/common.css" /> -->
<%-- <link href="<c:url value="/resources/static/common.css"/>" rel='stylesheet' /> --%>

<title>게시물 목록</title>
</head>
<body class="container">
	<h1>게시판</h1>
	
	<table class="table table-hover col-lg-12 col-md-9">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.bno}</td>
			
					<td>
						<a href="/board/view?bno=${list.bno}">${list.title}</a>
					</td>
					<td>
						<fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" />
					</td>
					<td>${list.writer}</td>
				<%-- 	<td>${list.viewCnt}</td> --%>
					<td><c:out value="${list.viewCnt}" /></td>
				</tr>
			</c:forEach>
		</tbody>

	</table>
	
	<%-- <div id="nav">
		<%@ include file="../include/nav.jsp"%>
	</div> --%>

</body>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</html>