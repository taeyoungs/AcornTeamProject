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
<script type="text/javascript" src="${root}/js/zipdle/zipdleDetail.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/zipdle/zipdleDetail.css">
</head>
<body>
<div id="body" class="projects detail" data-s_id="">
	<div id="content">
		<div id="cover_image" style="background-image: url('/uploadImage/zipdle/zipimage001.jpg')"></div>
		<div id="user_action" class="right" style="position: fixed; right: 61.8px; top: 164px;">
			<div id="project_id" class="hide">15</div>
			<div id="image_url" class="hide"></div>
			<div class="contents">
				<div class="category">
					<div class="category">온라인 집들이</div>
					<a class="report" href="/">신고</a>
				</div>
				<div class="title">집들이 게시글 테스트 1</div>
				<div class="created_at">2019년 07월 23일 10:05</div>
				<div class="buttons">
					<a class="">
						<div class="icon like project_15"></div>
					</a>
				</div>
			</div>
		</div>
		<div id="description_wrap">
			<div class="information">
				<div class="residence">
					<div class="label">거주형태</div>
					<div class="value"></div>
				</div>
				<div class="area">
					<div class="label">평수</div>
					<div class="value"></div>
				</div>
				<div class="period">
					<div class="label">기간</div>
					<div class="value"></div>
				</div>
				<div class="budget">
					<div class="label">예산</div>
					<div class="value"></div>
				</div>
				<div class="fmtype">
					<div class="label">가족형태</div>
					<div class="value"></div>
				</div>
				<div class="region">
					<div class="label">지역</div>
					<div class="value"></div>
				</div>
			</div>
			<div class="divider"></div>
		</div>
		<div class="contents_panel">
			<div class="contents">
				<div class="title"></div>
				
			</div>
			<div class="card">
				<div class="image_panel"></div>
			</div>
			<div class="image_description">
				
			</div>
		</div>
		<div id="metadata_wrap">
			<dl>
				<dt>좋아요</dt>
				<dd></dd>
				<dt>댓글</dt>
				<dd></dd>
				<dt>조회수</dt>
				<dd></dd>
			</dl>
		</div>
		<div id="commnet_panel" class="ui-comment">
			<div class="wrap">
				<section class="comment-feed">
					<h1 class="comment-feed_header">댓글&nbsp;
						<span class="comment-feed_header_count">6</span>
					</h1>
				</section>
			</div>
		</div>
	</div>
</div>
</body>
</html>