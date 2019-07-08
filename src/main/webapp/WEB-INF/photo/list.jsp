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
<script type="text/javascript" src="${root}/js/photo/photolist.js"></script>
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
											<img class="icon" src="${root }/image/common/down-arrow.png"></button>
											<div class="photolist-drop-down-menu">
												<ul class="photolist-dropdown-menu-list">
													<li class="photolist-dropdown-menu-item"><a href="#">인기순</a></li>
													<li class="photolist-dropdown-menu-item"><a href="#">최신순</a></li>
												</ul>
											</div>
										</div>
									</li>
									<li class="filter-bar__control-list__item">
										<div class="drop-down panel-drop-down filter-bar-control">
											<button class="button button--color-gray-4 button--size-50 button--shape-4 filter-bar-control__button">주거형태
											<img class="icon" src="${root }/image/common/down-arrow.png"></button>
											<div class="photolist-drop-down-menu">
												<ul class="photolist-dropdown-menu-list">
													<li class="photolist-dropdown-menu-item"><a href="#">원룸</a></li>
													<li class="photolist-dropdown-menu-item"><a href="#">투룸</a></li>
												</ul>
											</div>
											
										</div>
									</li>
									<li class="filter-bar__control-list__item">
										<div class="drop-down panel-drop-down filter-bar-control">
											<button class="button button--color-gray-4 button--size-50 button--shape-4 filter-bar-control__button">평수
											<img class="icon" src="${root }/image/common/down-arrow.png"></button>
											<div class="photolist-drop-down-menu">
												<ul class="photolist-dropdown-menu-list">
													<li class="photolist-dropdown-menu-item"><a href="#">10평미만</a></li>
													<li class="photolist-dropdown-menu-item"><a href="#">20평미만</a></li>
												</ul>
											</div>
										</div>
									</li>
								</ul>
							</div>
							<ul class="filter-bar_tag-list"></ul>
						</div>
					</div>
				</div>
			</div>
			<div class="virtualized-list card-feed__content row" style="padding-top: 0px;">
			<c:forEach var="pvo" items="${list}">
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
											<c:when test="${mvo.member_image eq null}">
											<img class="card-item-writer_image" src="${root }/image/common/user.png">
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
									<img class="image" src="${root }/image/common/room1.png" onclick="location.href='photodetail.do?num=${pvo.photo_seq_no }'">
									<span class="card-item-image_view-count">
										조회수 ${pvo.photo_hits }
									</span>
								</div>
								<aside class="card-item-action-list">
									<div class="card-item-action-list__action">
										<img src="${root }/image/common/heart.png" width="24" height="24">
										<span class="count">${pvo.photo_good }</span>
									</div>
									<div class="card-item-action-list__action">
										<img src="${root }/image/common/comment.png" width="24" height="24">
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
				</c:forEach>
			</div>
		</div>
	</main>
</body>
</html>
