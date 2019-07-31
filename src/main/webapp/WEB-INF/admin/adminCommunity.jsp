<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.community-table-wrap {
		margin-right: auto;
    	margin-left: auto;
    	padding-top: 60px;
    	width: calc(100% - 120px);
	}

	.community-table {
		width: 100%;
		padding-top: 30px;
	}
	
	.search-right {
		float: right;
	}
	table th, td{
		font-weight: normal;
	}
	
	table {
		width: 100%;
	}
	
	table thead td {
		background-color: #35C5F0;
		color: white;
		border-bottom: 1px solid white;
		border-right: 1px solid white;
		border-top: 1px solid white;
		text-align: center;
		height: 40px;
	}
	
	.condition-status {
		float: left;
	}
	
	input[type=text] {
		outline: 0;
		height: 20px;
		border: 1px solid #757575;
		border-radius: 3px;
	}
</style>
</head>
<body>
<div class="container">
	<div class="community-table-wrap">
		<div class="condition-status">
			<c:if test="${condition == 'photo'}">
				<span>사진 게시글 목록</span>
			</c:if>
			<c:if test="${condition == 'zip'}">
				<span>집들이 게시글 목록</span>
			</c:if>
			<c:if test="${condition == 'qna'}">
				<span>질문과답변 게시글 목록</span>
			</c:if>
		</div>
		<div class="search-right">
			<form>
				검색 : <input type="text" class="search-community">
			</form>
		</div>
		<div class="community-table">
			<table>
				<thead>
					<tr>
						<td style="width: 10%; border-top-left-radius: 5px;">번호</td>
						<td style="width: 40%;">게시글 제목</td>
						<td style="width: 15%;">작성자</td>
						<td style="width: 20%;">작성 날짜</td>
						<td style="width: 15%; border-top-right-radius: 5px;"></td>
					</tr>
				</thead>
				<tbody>
					<c:if test="${condition == 'photo'}">
						<c:forEach var="pvo" items="${plist}">
						<tr>
							<td>${no}</td>
							<c:set var="no" value="${no-1}"/>
							<td style="text-overflow: ellipsis;">${pvo.photo_content}</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						</c:forEach>
					</c:if>
					<c:if test="${condition == 'zip'}">
						<c:forEach var="zvo" items="${zlist}">
						
						</c:forEach>
					</c:if>
					<c:if test="${condition == 'board'}">
						<c:forEach var="bvo" items="${blist}">
						
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>