<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<p>
<a href="/board/listPageSearch?num=1">게시물 목록</a><br>
<!-- <a href="/board/write">게시물 작성</a> -->
</p>

<!-- 회원가입 영역 -->
<form role="form" method="post" autocomplete="off">
	<p>
	  <label for="userId">아이디</label>
	  <input type="text" id="userId" name="userId" />
	</p>
	<p>
	  <label for="userPass">비밀번호</label>
	  <input type="password" id="userPass" name="userPass" />
	</p>
	<p><button type="submit">로그인</button></p>
	<p><a href="/member/register">회원가입</a></p>
</form>

</body>
</html>
