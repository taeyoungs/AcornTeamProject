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
<script type="text/javascript" src="${root}/js/admin/adminMember.js"></script>
<style type="text/css">
	.member-delete-btn {
		border: 1px solid white;
		border-radius: 3px;
		background-color: #757575;
		color: white;
		width: 50px;
		height: 35px;
		font-family: inherit;
		cursor: pointer;
	}
	.member-delete-btn:hover {
		opacity: 0.5;
	}
	
	.member-detail-link:hover {
		opacity: 0.5;
	}
	button {
		outline: 0;
	}
</style>
</head>
<body>
<div class="container">
	<div class="community-table-wrap">
		<div class="condition-status">
			<span>집들이 게시글 목록 </span>
		</div>
		<div class="search-right">
			검색 : <input type="text" class="search-community" placeholder=" 회원 아이디 또는 별명" value="">
		</div>
		<div class="community-table">
			<table>
				<thead>
					<tr>
						<td style="width: 10%; border-top-left-radius: 5px;">번호</td>
						<td style="width: 30%;">아이디</td>
						<td style="width: 25%;">도메인</td>
						<td style="width: 20%;">별명</td>
						<td style="width: 15%; border-top-right-radius: 5px;"></td>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		<div id="page">
		</div>
		<span style="float: right;"><a href="adminList">목록으로 돌아가기</a></span>
	</div>
</div>
</body>
</html>