<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모-메모입력</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
<div id="wrap">
	<c:import url="/WEB-INF/jsp/include/header.jsp"/>
	<section class="contents d-flex justify-content-center">
		<div class="input-box">
			<h1 class="text-center">메모 입력</h1>
			<div>
				<div class="d-flex justify-content-center mt-3">
					<h5 class="pt-2 font-weight-bold">제목 : </h5> <input type="text" class="form-control col-10 ml-5" id="titleInput">
				</div>
				<div class="d-flex justify-content-center mt-3">
					<textarea rows="10" cols="200" placeholder="내용을 입력해 주세요" class="form-control" id="contentInput"></textarea>
				</div>
					<input type=file class="mt-3" id="fileInput">
				<div class="d-flex justify-content-between">
					<a href="/post/list/view" class="btn btn-secondary col-2 mt-3">목록으로</a>
					<button type="button" id="saveBtn" class="btn btn-secondary col-2 mt-3">저장</button>
				</div>
			</div>
		</div>

	</section>
	<c:import url="/WEB-INF/jsp/include/footer.jsp"/>
	
</div>
	<script>
		$(document).ready(function() {
			$("#saveBtn").on("click", function() {
				let title = $("#titleInput").val();
				let content = $("#contentInput").val();
				let file = $("#fileInput")[0];
				
				if(title == "") {
					alert("제목을 입력해 주세요");
					return;
				}
				
				if(content.trim() == "") {
					alert("내용을 입력하세요");
					return;
				}
				
				var formData = new FormData();
				formData.append("title", title);
				formData.append("content", content);
				formData.append("file", file.files[0]);
				
				$.ajax({
					type:"post"
					, url:"/post/create"
					, data:formData
					, enctype:"multipart/form-data" // 파일 업로드 필수
					, processData:false // 파일 업로드 필수
					, contentType:false // 파일 업로드 필수
					, success:function(data) {
						if(data.result == "success") {
							location.href = "/post/list/view";
						} else {
							alert("글쓰기 실패");
						}
					}
					, error:function() {
						alert("게시물 저장 에러");
					}
				});
			});
		});
	</script>
	

</body>
</html>
		