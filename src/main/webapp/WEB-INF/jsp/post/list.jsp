<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	<div id="wrap">
	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
	<section class="contents">
		<h1 class="text-center">메모 리스트</h1>
		<table class="table text-center">
			<thead class="bg-secondary">
				<tr class="bg-light">
					<th>No.</th>
					<th>제목</th>
					<th>시간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="post" items="${postList }">
				<tr>
					<td>${post.id }</td>
					<td> <a href="/post/detail/view?id=${post.id }">${post.title }</a> </td>
					<td><fmt:formatDate value="${post.createdAt }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="d-flex justify-content-between mt-5">
		    <div></div>	
			<a href=/post/input/view class="btn btn-primary">글쓰기</a>
		</div>
	</section>
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
	
	</div>

</body>
</html>
			