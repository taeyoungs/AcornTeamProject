<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문하기</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="../css/board/board.css">
</head>
<body>
<div class="container">
	<form action="write.do" method="post" enctype="multipart/form-data">
		<div id="head">
			<h1>질문하기</h1>
		</div>
		<div class="title">
			<input type="text" maxlength="61" size="60" name="board_title"
			placeholder="제목을 적어주세요" required="required">
		</div>
		<div class="maincon">
			<textarea required="required" class="maincon"
			placeholder="내용을 적어주세요" style="height:400px;
			width:860px;" name="board_content"></textarea>
			<div>
				<input type="file" name="imagename" class="form-control"
						style="width:210px;">
			</div>
		</div>
		<footer>
			<div>
				<input type="submit" name="commit" value="질문 저장하기"
				 class="sbtn">
			</div>	
		</footer>
	</form>
</div>
</body>
</html>