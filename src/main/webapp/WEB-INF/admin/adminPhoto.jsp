<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<link rel="stylesheet" type="text/css" href="${root}/css/admin/adminPhoto.css">
<script type="text/javascript" src="${root}/js/admin/adminPhoto.js"></script>
</head>
<body>
<div class="container">
	<div class="community-table-wrap">
		<div class="condition-status">
			<span>사진 게시글 목록 (${totalCount}개)</span>
		</div>
		<div class="search-right">
			<form>
				검색 : <input type="text" class="search-community" placeholder=" 게시글 제목">
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
					<c:forEach var="pvo" items="${plist}">
					<tr>
						<td>${no}</td>
						<c:set var="no" value="${no-1}"/>
						<td style="text-overflow: ellipsis;">
							<a class="photo-detail-link" href="${root}/photo/photodetail.do?num=${pvo.photo_seq_no}" target="_blank">${pvo.photo_content}</a>
						</td>
						<td>${pvo.member_nickname}</td>
						<td>
							<fmt:formatDate value="${pvo.reg_date}" pattern="yyyy년 MM월 dd일 HH:mm"/>
						</td>
						<td>
							<input type="hidden" class="photo_seq_no" value="${pvo.photo_seq_no}">
							<button type="button" class="photo-delete-btn">삭제</button>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div id="page">
			<c:if test="${startPage > 1}">
				<li style="display: inline-block; vertical-align: bottom;">
					<button class="list-paginator_prev" type="button">
						<img src="/image/common/left-arrow-outline-button.png">
					</button>
				</li>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${i == currentPage}">
					<li style="display: inline-block; vertical-align: bottom;">
						<button class="list-paginator_page sm selected" type="button">${i}</button>
					</li>
				</c:if>
				<c:if test="${i != currentPage}">
					<li style="display: inline-block; vertical-align: bottom;">
						<button class="list-paginator_page sm" type="button">${i}</button>
					</li>
				</c:if>
			</c:forEach>
			<c:if test="${endPage < totalPage}">
				<li style="display: inline-block; vertical-align: bottom;">
					<button class="list-paginator_next" type="button">
						<img src="/image/common/right-arrow-outline-button.png">
					</button>
				</li>
			</c:if>
		</div>
		<span style="float: right;"><a href="adminList">목록으로 돌아가기</a></span>
	</div>
</div>
</body>
</html>