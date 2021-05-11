<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %> 
<!DOCTYPE html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
<p> 
	<a href="<c:url value="/listPageSearch?num=1/i18n.do?lang=ko" />">한국어</a> 
	<a href="<c:url value="/listPageSearch?num=1/i18n.do?lang=zh" />">중문</a> 
	</p>
	
	<h1><spring:message code="site.board" /></h1>

	<table class="table table-hover col-lg-12 col-md-9">
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
					<td>${list.bno}</td>
					<td><a href="/board/view?bno=${list.bno}">${list.title}</a></td>
					<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd" /></td>
					<td>${list.writer}</td>
					<td>${list.viewCnt}</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>
</body>
</html> --%>