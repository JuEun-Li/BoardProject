<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

<!-- member의 값이 null이라면 로그인 안됨, 로그인 폼을 보여준다. -->
<c:if test="${member == null }">
	<!-- 회원가입 영역 -->
	<form role="form" method="post" autocomplete="off" action="/member/login">
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
</c:if>

<c:if test="${msg == false}">
	<p style="color:#f00">로그인에 실패하였습니다. 아이디 또는 패스워드를 다시 입력해주십시오</p>
</c:if>

<!-- member의 값이 null이 아닐 경우,로그인 성공인 상황. 하단 텍스트를 보여준다. -->
<c:if test="${member !=null }">
	<p>${member.userName}님 환영합니다.</p>
	
	<a href="member/logout">로그아웃</a>
</c:if>
 
</body>
</html>

