<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<c:url value="/resources/static/common.css"/>" rel='stylesheet' />
<title>게시물 작성</title>
</head>
<body>
	<div id="nav">
	 <%@ include file="../include/nav.jsp" %>
	</div>
<form method="post">

<!-- input 과 textarea의 이름 속성의 값이 BoardVO와 일치해야한다. -->

	<label>제목</label>
	<input type="text" name="title" /><br />
	
	<label>작성자</label>
	<input type="text" name="writer" /><br />
	
	<label>내용</label>
	<textarea cols="50" rows="5" name="content"></textarea><br />
	
	<button type="submit" class="btn">작성</button>

</form>
</body>
</html>