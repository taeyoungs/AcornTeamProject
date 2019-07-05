<%@page import="java.io.Console"%>
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
<c:set var="root" value="<%=request.getContextPath() %>"/>
<link rel="stylesheet" href="${root}/css/photo/photo_list.css">
<meta name="viewport" content="width=device-width, user-scalable=no"/>
</head>
<body>
	<main id="root" role="main">
		<div class="container card-feed">
			<div class="sticky-container card-feed__filter-container" style="position: sticky; top: 0px;">
				<div class="sticky-child card-feed__filter-wrap" style="position: sticky;">
					<div class="filter card-feed__filter">
						<div class="filter-bar">
							<div class="filter-bar_control-list">
								<ul class="filter-bar__control-list__left">
									<li class="filter-bar__control-list__item">
										<div class="drop-down panel-drop-down filter-bar-control">
											<button class="button button--color-gray-4 button--size-50 button--shape-4 filter-bar-control__button">정렬
											<img class="icon" src="${root }/image/down-arrow.png"></button>
											<ul class="dropdown-menu">
												<li class=""><a href="#">인기순</a></li>
											</ul>
										</div>
									</li>
									<li class="filter-bar__control-list__item">
										<div class="drop-down panel-drop-down filter-bar-control">
											<button class="button button--color-gray-4 button--size-50 button--shape-4 filter-bar-control__button">주거형태
											<img class="icon" src="${root }/image/down-arrow.png"></button>
										</div>
									</li>
									<li class="filter-bar__control-list__item">
										<div class="drop-down panel-drop-down filter-bar-control">
											<button class="button button--color-gray-4 button--size-50 button--shape-4 filter-bar-control__button">평수
											<img class="icon" src="${root }/image/down-arrow.png"></button>
										</div>
									</li>
								</ul>
							</div>
							<ul class="filter-bar_tag-list"></ul>
						</div>
					</div>
				</div>
			</div>
			<c:forEach var="pvo" items="${list}">
			<div class="virtualized-list card-feed__content row" style="padding-top: 0px;">
				<div class="card-feed__item-wrap col-12 col-md-4 col-lg-3">
					<div class="card-feed_item">
						<article class="card-item">
							<c:forEach var="mvo" items="${mlist}">
							<c:if test="${pvo.member_no == mvo.member_no}">
							<div class="card-item-writer">
								<address class="card-item-writer_content">
									<div class="card-item-writer_header">
										<div class="card-item-writer_link">
											<c:choose>
											<c:when test="${null eq mvo.member_image }">
											<img class="card-item-writer_image" src="${root }/image/user.png">
											</c:when>
											<c:otherwise>
											<img class="card-item-writer_image" src="${root }/image/${mvo.member_image}">
											</c:otherwise>
											</c:choose>
											<span class="card-item-writer_name">${mvo.member_nickname }</span>
										</div>
									</div>
									<p class="card-item-writer_introduction">${mvo.member_comment }
								</address>
							</div>
							</c:if>
							</c:forEach>
							<div class="card-item_content">
								<div class="card-item-image">
									<img class="image" src="${root }/image/room1.png" onclick="location.href='photodetail.do?num=${pvo.photo_seq_no }'">
									<span class="card-item-image_view-count">
										조회수 ${pvo.photo_hits }
									</span>
								</div>
								<aside class="card-item-action-list">
									<div class="card-item-action-list__action">
										<img src="${root }/image/heart.png" width="24" height="24">
										<span class="count">${pvo.photo_good }</span>
									</div>
									<div class="card-item-action-list__action">
										<img src="${root }/image/comment.png" width="24" height="24">
										<span class="count"></span>
									</div>
								</aside>
								<div class="expandable-text card-item-description card-item__description">
									<div class="card-item-description__content">
										${pvo.photo_content }
									</div>
								</div>
							</div>
						</article>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</main>
</body>
</html>
