<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<div class="container">
	<div class="well">
		<select class="form-control" id="testBox">
			<option>선택</option>
			<option value="ko">한국어</option>
			<option value="en">English</option>
		</select>
		
		
		<p>site.title : <spring:message code="msg.title" text="default text" /></p>
		<p>site.count : <spring:message code="msg.count" arguments="첫번째" text="default text" /></p> 
		<p>site.count using EL : <spring:message code="msg.count" arguments="${siteCount}" text="default text" /></p>
		<p>not.exist : <spring:message code="msg.exist" text="default text" /></p>

	</div>
</div>

	<script>
		$(document).ready(function(){
		
			$('#testBox').on('change', function(){
				var lan = $('#testBox').val();
				
				location.href='<c:url value="?lang='+lan+'"/>';	
			});
			
			
		});
	</script>

</body>
</html> --%>