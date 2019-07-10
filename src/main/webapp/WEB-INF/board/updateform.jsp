<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
<form action="update.do" method="post">
	<table style="width: 400px;" class="table table-bordered">
		<caption><b>방명록 수정</b></caption>
		<tr>
			<td>제 목: ${vo.board_title}</td>
		</tr>
		<tr>
			<td>
				<textarea style="width: 380px;height: 130px;" 
				name="content" class="form-control">${vo.board_content}</textarea>
			</td>
		</tr>
		<tr>
			<td align="center">
				<input type="hidden" name="board_seq_no" value="${vo.board_seq_no}">
				<input type="hidden" name="pageNum" value="${pageNum}">
				<button type="submit" style="width: 100px;"
				 class="btn btn-basic btn-sm">방명록 수정</button>
				 <button type="button" style="width: 100px;"
				 class="btn btn-basic btn-sm"
				 onclick="history.back()">취 소</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>