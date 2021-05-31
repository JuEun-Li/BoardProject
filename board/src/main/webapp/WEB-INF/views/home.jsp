<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<!-- jquery 관련 태그들 -->	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<html>
<head>
	<title>Home</title>
</head>
<style scoped>
	.main-box {
		margin-left: auto; margin-right: auto;
		text-align: center;
		margin-top: 10%;
		
		padding: 2% 3% 3%;
	    margin-top: 5%;
	    margin-bottom: 3%;
	    /* border: 7px solid rgb(202, 232, 229); */
	    border: 7px solid rgb(252, 231, 221);
	    margin-left:auto; margin-right:auto;
	    color: rgb(247, 148, 72);
	    box-shadow: 3px 3px 7px rgb(252, 231, 221);
	    font-size: 1.2vw;
	}
	.sub_box {
		/* display: inline-block; */
	}
	/* 폼 서식 */
	.con {
	    height: calc(1.5em + .75rem + 5px);
	    padding: .375rem .75rem ;
	    margin: 2%;
	    font-size: 1rem;
	    font-weight: 400;
	    line-height: 1.5;
	    color: #495057;
	    background-color: #fff;
	    background-clip: padding-box;
	    border: 1px solid #ced4da;
	    border-radius: .25rem;
	    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
	    box-shadow: 3px 3px 3px rgb(252, 231, 221);
	  
	    /* margin-top: 5%; */
	}
	.con:click {
		border: 3px solid rgb(247, 148, 72);
		box-shadow: 3px 3px 3px rgb(247, 148, 72);
	}
	h1 {
		margin: 3% 0% 5% 0%;
	}
	button {
	  /* border: 1.5px solid rgb(215, 223, 35); */
	  /* width: 20%; */
	  border: 1.5px solid rgb(203, 231, 211);
	  box-shadow: 2px 2px 2px lightgray;
	  color:white;
	  /* background-color: rgb(215, 223, 35); */
	  background-color: rgb(203, 231, 211);
	  padding: 0.7vw 1.5vw;
	  margin: 1%;
	  border-radius: 8px;
	  outline: 0; /* 클릭시 테두리 삭제 */
	  font-size: 1.0vw;
	}
	.button2 {
	  /* border:1.5px solid rgb(161, 208, 120);
	  background-color: rgb(161, 208, 120); */
	  border:1.5px solid rgb(200, 196, 226);
	  box-shadow: 2px 2px 2px lightgray;
	  background-color: rgb(200, 196, 226);
	  margin-bottom: 10%; /*바닥과 좀 떨어지게*/
	}
	button:hover {
	  background-color: rgba(0,0,0,0);
	  color: rgb(203, 231, 211);
	  cursor: pointer;
	}
	.button2:hover {
	  color: rgb(200, 196, 226);
	}
	table {
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 5%;
	}
	a {
		float: right;
	}
	label {
		color: rgb(247, 148, 72);
	}
</style>
<body>
<div class="container col-lg-6 col-md-6 main-box">
	<h1>Login</h1>
	
	<!-- member의 값이 null이라면 로그인 안됨, 로그인 폼을 보여준다. -->
	<c:if test="${member == null }">
		<!-- 회원가입 영역 -->
		<form role="form" method="post" autocomplete="off" action="/member/login">
			<table>
				<tr>
					<td><label for="userId">아이디</label></td>
					<td><input type="text" id="userId" name="userId" class="con"/></td>
				</tr>
				<tr>
					<td><label for="userPass">비밀번호</label></td>
					<td><input type="password" id="userPass" name="userPass" class="con"/></td>
				</tr>
			</table>
			
				<button type="submit">로그인</button>
				<button type="button" class="button2" onclick="location.href='/member/register'">회원가입</button>		

		</form>
			<p>
				<a href="/board/listPageSearch?num=1">게시물 목록</a><br>
			</p>
	</c:if>
	
	<c:if test="${msg == false}">
		<p style="color:#f00">로그인에 실패하였습니다. 아이디 또는 패스워드를 다시 입력해주십시오</p>
	</c:if>
	
	<!-- member의 값이 null이 아닐 경우,로그인 성공인 상황. 하단 텍스트를 보여준다. -->
	<c:if test="${member !=null }">
		<p>${member.userName}님 환영합니다.</p>
		
		<a href="member/modify_pass">회원정보 수정</a><br />
		<a href="member/logout">로그아웃</a>
		<a href="/board/listPageSearch?num=1">게시물 목록</a><br>
	</c:if>
</div>
</body>
</html>

