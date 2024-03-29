<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<html>
<head>
 <title>회원가입</title> 
</head>
<style>
.main-box {
		text-align: center;
		margin-top: 10%;
		padding: 2% 3% 3%;
	    margin-top: 5%;
	    margin-bottom: 3%;
	    border: 7px solid rgb(252, 231, 221);
	    color: rgb(247, 148, 72);
	    box-shadow: 3px 3px 7px rgb(252, 231, 221);
	    font-size: 1.2vw;
	}
	/* 폼 서식 */
	.con, .con1 {
		width: 300px;
	    height: calc(1.5em + .75rem + 10px);
	    padding: .375rem .75rem ;
	    margin: 1%;
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
		margin: 3% 0% 5% 5%;
		text-align: left;
	}
	button {
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
	button:hover {
	  background-color: rgba(0,0,0,0);
	  color: rgb(203, 231, 211);
	  cursor: pointer;
	}
	/* 중복확인 버튼 */
	#idCheck {
		display: inline;
		background-color: rgb(200, 196, 226);
		border: none;
		font-size: 0.8vw;
		padding: 0.4vw 0.6vw;
	}
	label {
		color: rgb(247, 148, 72);
	}
	table {
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 5%;
	}
	table th {
		text-align: center;
		padding: 3%;
	}
</style>
<body>
<div class="container col-lg-6 col-md-8 main-box">
<h1>회원 가입</h1>
<hr>
<form role="form" method="post" autocomplete="off">	 
	 <table>
		 <tr>
			 <th>
			 	<label for="userId">아이디</label>
			 </th>
		 </tr>
		 
	 	<tr>
	 		<td><input type="text" id="userId" name="userId" class="con1"/>
	 		</td>
	 	</tr>
	 	<tr>
	 		<td>
	 			<button type="button" id="idCheck" onclick="fn_idOverlap();">중복확인</button>
	 		</td>
	 	</tr>
	 	
	 	<tr>
			 <th>
			 	<label for="userPass">패스워드</label>
			 </th>
		 </tr>
		 
	 	<tr>
	 		<td><input type="password" id="userPass" name="userPass" class="con"/></td>
	 	</tr>
	 	
	 	<tr>
			 <th>
			 	<label for="userName">닉네임</label>
			 </th>
		 </tr>
		 
	 	<tr>
	 		<td><input type="text" id="userName" name="userName" class="con"/></td>
	 	</tr>
	 </table>
	 
	 <p>
	   	  <button type="submit" id="submit" disabled="disabled">가입</button>  
	 </p>
	 <p>
	  	  <a href="/">처음으로</a>
	 </p>
</form>
</div>
<script>
//아이디 중복검사

function fn_idOverlap() {
	$.ajax({
		url : "/member/idCheck",
		type : "post",
		dataType : "json",
		data : { "userId" : $("#userId").val()},
		error:function(request,status,error){
	        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
	       },
		success : function(data) {
			if(data == 1) {
				alert("중복된 아이디 입니다.");
				$("#submit").attr("disabled", "disabled");
			} else if(data == 0) {
				alert("사용가능한 아이디 입니다.");
				$("#submit").removeAttr("disabled");
			}
		}
	})
}
</script>
</body>
</html>