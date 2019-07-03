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
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/photo/photo_detail.css">
<link rel="shortcut icon" href="#">
</head>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
<main id="root" role="main">
	<div class="card-detail container">
		<article class="row">
			<section class="col-12 col-lg-8">
				<header>
					<p class="category">
						<span class="category__item">${pvo.photo_pyeong }</span>
						<span class="category__item">${pvo.photo_hometype }</span>
					</p>
					<time>어제</time>
				</header>
				<section class="card-section">
					<figure>
						<div class="card-img card">
							<div class="card-img__bg" style="padding-top: 65%"></div>
							<img src="${root }/image/room1.png">
						</div>
						<figcaption>
							${pvo.photo_content }
						</figcaption>
					</figure>
					<ul class="keyword">
						<li class="keyword__item">
							<div class="keyword__item__badge">${pvo.hashtag }</div>
						</li>
					</ul>
				</section>
				<section class="footer">
					<div class="footer__stats">
						<div class="footer__stats__item">
							<span>
							조회  ${pvo.photo_hits }
							</span>
						</div>
						<div class="footer__stats__item">
							<span>
							댓글 1
							</span>
						</div>
					</div>
					<hr class="section-divider">
				</section>
				<div>
					<section class="comment-feed">
						<h1 class="comment-feed__header">댓글
							<span class="comment-feed__header__count">1</span>
						</h1>
						<form class="comment-feed__form">
							<div class="comment-feed__form__user">
								<img src="">
							</div>
							<div class="comment-feed__form__input">
								<div class="comment-feed__form__content">
									<div class="comment-content-input">
										<input type="text" class="comment-content-input__text comment-feed__form__content__text">
									</div>
								</div>
								<div class="comment-feed__form__actions">
									<button class="comment-feed__form__submit" type="submit" disabled="disabled"></button>
								</div>
							</div>
						</form>
						<ul class="comment-feed__list">
							<li class="comment-feed__list__item">
								<article class="comment-feed__item">
									<p class="comment-feed__item__content">
										<a class="comment-feed__item__content__author">
											<img class="comment-feed__item__content__author__image" src="">
											<span class="comment-feed__item__content__author__name">${cvo.member_nickname }</span>
										</a>
										<span class="comment-feed__item__content__content">${cvo.p_reply_content }</span>
									</p>
									<footer class="comment-feed__item__footer">
										<time class="comment-feed__item__footer__time">14시간</time>
									</footer>
								</article>
							</li>
						</ul>
						<ul class="list-paginator">
							<li>
							
							</li>
						</ul>
					</section>
				</div>
			</section>
			<aside class="col-4 sidebar">
						<div class="sticky-container sidebar__sticky" style="position:sticky; top:132px;">
							<div class="sticky-child" style="position: relative;">
								<div class="sidebar__container" style="height: 750px;">
									<div style="padding-top: 40px;">
										<section class="sidebar__action">
											<div>
												<button class="sidebar__action__btn" type="button">
													<span class="icon--common-action" style="vertical-align: middle; 
													margin-right: 8px; background-position: -240px -280px; width: 24px; height: 24px;">
													<img src="../image/heart.png" width="24" height="24">
													</span>
													1
												</button>
											</div>
											<!-- <div>
												<button class="sidebar__action__btn" type="button">
													<span class="icon--common-action" style="vertical-align: middle; 
													margin-right: 8px; background-position: -240px -280px; width: 24px; height: 24px;">
													<img src="../image/bookmark.png" width="24" height="24">
													</span>
													1
												</button>
											</div> -->
										</section>
										<section class="sidebar__writer writer-info">
											<div class="writer-profile">
												<div class="writer-profile__img">
													<a href="">
														<img src="">
													</a>
												</div>
												<div>
													<a href="">
														<strong class="writer-profile__name">${mvo.member_nickname }</strong>
													</a>
													<a href="">
														<p class="writer-profile__about">d</p>
													</a>
												</div>
											</div>
										</section>
										<section class="sidebar_others">
											<div class="sidebar__others__list">
												<div class="sidebar__others__thumbnail">
													<div class="sidebar__others__thumbnail__img">
														<a href="">
															<img src="">
														</a>
													</div>
												</div>
											</div>
										</section>
									</div>
								</div>
							</div>
						</div>
					</aside>
		</article>
	</div>
</main>
</body>
</html>
x