<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="<c:url value="/resources/static/common.css"/>" rel='stylesheet' />
<title>게시물 수정</title>
</head>
<body>
	<div id="nav">
	 <%@ include file="../include/nav.jsp" %>
	</div>
	<form method="post">
	
		<!-- input 과 textarea의 이름 속성의 값이 BoardVO와 일치해야한다. -->
		
		<label>제목</label>
		<input type="text" name="title" value="${view.title}"/><br />
		
		<label>작성자</label>
		<input type="text" name="writer" value="${view.writer}"/><br />
		
		<label>내용</label>
		<textarea cols="50" rows="5" name="content">${view.content}</textarea><br />
		
		<button type="submit" class="btn">완료</button>
	
	</form>
</body>
</html>