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
<div id="body" class="projects detail" data-s_id="${zvo.zip_seq_no}">
	<div id="content">
		<div id="cover_image" style="background-image: url('/uploadImage/zipdle/zipimage001.jpg')"></div>
		<div id="user_action" class="right">
			<div id="project_id" class="hide">15</div>
			<div id="image_url" class="hide"></div>
			<div class="contents">
				<div class="category">
					<div class="category">온라인 집들이</div>
					<a class="report" href="/">신고</a>
				</div>
				<div class="title"></div>
				<div class="created_at">
					<fmt:formatDate value="${zvo.reg_date}" pattern="yyyy년 MM월 dd일 HH:mm"/>
				</div>
				<div class="buttons">
					<a class="">
						<img class="icon like prject_${zvo.zip_seq_no}" src="/image/common/like-gray.png">
						<div class="label">좋아요 <span class="count">${zvo.zip_good}</span></div>
					</a>
					<div class="btn-project-scrap" data-project-id="${zvo.zip_seq_no}"
						data-image-url="/uploadImage/zipdle/zipimage001.jpg">
						<img class="icon scrap exhibition_15" src="/image/common/banner-gray.png" width="23"></img>
						<div class="label">스크랩 <span class="count">20</span></div>
					</div>
				</div>
			</div>
			<div id="writer" class="right">
				<div class="wrap">
					<a href="/">
						<div class="profile_image" style="background-image: url('/uploadImage/${mvo.member_image}')"></div>
					</a>
					<a class="btn btn-follow-user">
						<span class="icon icon-etc-check-white-sm"></span>
						<span class="btn-follow-user_text">팔로우</span>
					</a>
					<a class="">
						<div class="other">
							<input type="hidden" class="memberNo" value="${sessionScope.member_no}">
							<div class="nickname">${mvo.member_nickname}</div>
							<div class="introduction">${mvo.member_comment}</div>
						</div>
					</a>
				</div>
			</div>
		</div>
		<div id="description_wrap">
			<div class="information">
				<div class="residence">
					<div class="label">건물</div>
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
		<div id="contents_panel">
		</div>
		<div id="metadata_wrap">
			<dl>
				<dt>좋아요</dt>
				<dd>${zvo.zip_good}</dd>
				<dt>댓글</dt>
				<dd>5</dd>
				<dt>조회수</dt>
				<dd>${zvo.zip_hits}</dd>
			</dl>
		</div>
		<div id="comment_panel" class="ui-comment">
			<div class="wrap">
				<section class="comment-feed">
					<h1 class="comment-feed_header">댓글&nbsp;
						<span class="comment-feed_header_count">6</span>
					</h1>
					<form class="comment-feed_form">
					<c:if test="${sessionScope.loginok ne 'login'}">
						<a href="/member/gotoSignin" class="comment-feed_form_cover"></a>
						<div class="comment-feed_form_user">
							<img src="/image/common/smile.png">
						</div>
						<div class="comment-feed_form_input">
							<div class="comment-feed_form_content">
								<div class="comment-content-input">
									<div class="comment-feed_form_content_text" data-ph="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다 :)"
										contenteditable="true"></div>
								</div>
							</div>
							<div class="comment-feed_form_actions">
								<button class="comment-feed_form_submit" type="submit" aria-label="작성" disabled="disabled">
									<img src="/image/common/right-arrow-button.png">
								</button>
							</div>
						</div>
					</c:if>
					<c:if test="${sessionScope.loginok eq 'login'}">
						<div class="comment-feed_form_user">
							<img src="/uploadImage/${sessionScope.mvo.member_image}">
						</div>
						<div class="comment-feed_form_input">
							<div class="comment-feed_form_content">
								<div class="comment-content-input">
									<div class="comment-feed_form_content_text" data-ph="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다 :)"
										contenteditable="true"></div>
								</div>
							</div>
							<div class="comment-feed_form_actions">
								<button class="comment-feed_form_submit" type="submit" aria-label="작성" disabled="disabled">
									<img src="/image/common/right-arrow-button.png">
								</button>
							</div>
						</div>
					</c:if>
					</form>
					<ul class="comment-feed_list">
						<li class="comment-feed_list_item">
							<article class="comment-feed_item">
								<p class="comment-feed_item_content">
									<a class="comment-feed_item_content_author" href="/">
										<img src="/uploadImage/THUMB_2.jpg" class="comment-feed_item_content_author_image">
										<span class="comment-feed_item_content_author_name">테스트하는 사람</span>
									</a>
									<span class="comment-feed_item_content_content">여기에 작성한 댓글 내용이 출력</span>
								</p>
								<footer class="comment-feed_item_footer"></footer>
							</article>
						</li>
					</ul>
					<ul class="list_paginator"></ul>
				</section>
			</div>
		</div>
	</div>
</div>
</body>
</html>