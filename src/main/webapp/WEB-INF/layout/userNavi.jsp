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
<c:set var="root" value="<%=request.getContextPath()%>"/>
<link rel="stylesheet" type="text/css" href="${root}/css/top/userNavi.css">
</head>
<body>
<div class="myhome-nav">
	<nav class="page-navi">
		<ul>
			<li class="page-navi_item">
				<a href="${root}/users/userPhoto" class="${pageType eq 'userPhoto' ? 'active' : ''}">사진</a>
			</li>
			<li class="page-navi_item">
				<a href="${root}/users/userZipdle" class="${pageType eq 'userZipdle' ? 'active' : ''}">집들이</a>
			</li>
			<li class="page-navi_item">
				<a href="${root}/users/userQna" class="${pageType eq 'userQna' ? 'active' : ''}">질문과답변</a>
			</li>
			<li class="page-navi_item">
				<a href="${root}/users/userLike" class="${pageType eq 'userLike' ? 'active' : ''}">좋아요</a>
			</li>
			<li class="page-navi_item">
				<a href="${root}/users/userUpdate" class="${pageType eq 'userUpdate' ? 'active' : ''}">회원정보수정</a>
			</li>
			<li class="page-navi_item">
				<a href="${root}/users/userChange" class="${pageType eq 'userChange' ? 'active' : ''}">비밀번호 변경</a>
			</li>
		</ul>
	</nav>
</div>
<script type="text/javascript">
	$(".page-navi>ul li").click(function(){
		$(this).siblings().removeClass("active");
		$(this).addClass("active");
	});
</script>
</body>
</html>