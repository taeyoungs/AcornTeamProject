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
<link rel="stylesheet" type="text/css" href="${root}/css/writelist.css">
<link rel="stylesheet" type="text/css" href="${root}/css/common.css">
<script type="text/javascript" src="${root}/js/admin/adminList.js"></script>
</head>
<body>
	<main role="main">
		<section class="container upload-types">
			<h2 style="font-weight: bold; font-size: 30px;">관리자 페이지</h2>
			<div class="row">
				<section class="upload-types_item_wrap">
					<a href="${root}/admin/communityList?condi=photo" class="upload-types_item upload-types_item_photo">
						<div class="upload-types_item_pictogram">
							<div class="upload-types_item_pictogram_contents">
								<img src="${root}/image/common/camera.png" style="width: 70px;">
								<p>사진</p>
							</div>
						</div>
						<p class="upload-types_item_caption">사진 게시글 관리</p>
					</a>
				</section>
				<section class="upload-types_item_wrap">
					<a href="${root}/admin/communityList?condi=zip" class="upload-types_item upload-types_item_project">
						<div class="upload-types_item_pictogram">
							<div class="upload-types_item_pictogram_contents">
								<img src="${root}/image/common/zipdle.png" style="width: 70px;">
								<p>집들이</p>
							</div>
						</div>
						<p class="upload-types_item_caption">집들이 게시글 관리</p>
					</a>
				</section>
				<section class="upload-types_item_wrap">
					<a href="${root}/admin/communityList?condi=qna" class="upload-types_item upload-types_item_qna">
						<div class="upload-types_item_pictogram">
							<div class="upload-types_item_pictogram_contents">
								<img src="${root}/image/common/question mark.png" style="width: 70px;">
								<p>질문과답변</p>
							</div>							
						</div>
						<p class="upload-types_item_caption">질문과 답변 게시글 관리</p>
					</a>
				</section>
				<section class="upload-types_item_wrap">
					<a href="${root}/admin/communityList?condi=member" class="upload-types_item upload-types_item_member">
						<div class="upload-types_item_pictogram">
							<div class="upload-types_item_pictogram_contents">
								<img src="${root}/image/common/member.png" style="width: 70px;">
								<p>회원</p>
							</div>
						</div>
						<p class="upload-types_item_caption">회원 목록 관리</p>
					</a>
				</section>
			</div>
		</section>
	
	</main>
</body>
</html>