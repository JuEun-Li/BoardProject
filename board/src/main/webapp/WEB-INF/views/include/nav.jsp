<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	li {
		list-style:none;
		font-size: 1vw;
		float: right;
	}
	button {
		border: none;
		background-color: lightblue;
		color: white;
		margin-top: 10%;
	}
	button a {
		display: block;
		padding: 10px;
	}
		 a:link {text-decoration: none;}
 a:visited {text-decoration: none;}
 a:active {text-decoration: none;}
 a:hover {text-decoration: underline;}
 
</style>

<ul> 
 <li>
 	<a href="/board/listPage?num=1">글 목록(페이징)</a> 
</li>
 <li>
  	<button type="button" class="rounded bg-warning"><a href="/board/list">글 목록</a></button> 
 </li>
 
 <li>
  <button type="button" class="button rounded bg-info"><a href="/board/write">글 작성</a></button>
 </li> 
</ul>