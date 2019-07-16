<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<link rel="stylesheet" type="text/css" href="${root}/css/store/ranks.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
<body>
<main id="root" role="main">
	<div class="RankingFeed">
		<section class="ranking-feed">
			<div class="ranking-feed-group">
				<p class="ranking-feed-group__title container">카테고리 BEST 100</p>
				<div class="ranking-feed-group__card-wrap">
					<div class="ranking-feed-card">
						<div class="container">
							<p class="ranking-feed-card__title"></p>
							<div class="ranking-feed-card__product-wrap">
								<div class="ranking-product-item-wrap">
									<div class="product-item">
										<div class="product-item__image">
											<a href="#">
												<img class="image" src="#">
												<div class="product-item__image__number"></div>
											</a>
											<button type="button">
												<img src="#" style="width:24px;height:24px;">
											</button>
										</div>
									</div>
									<a href="#">
										<div class="project-item__info">
											<div class="product-item__info__title">
												<p class="product-item__info__title__brand"></p>
												<p></p>
											</div>
											<div class="product-item__info__col">
												<div class="product-item__info__price">
													<span class="discount-rate">
													
													</span>
													<strong></strong>
												</div>
											</div>
											<div class="product-item__info__col">
												<img src="#">
												<strong></strong>
											</div>
										</div>
									</a>
								</div>
							</div>
							<a href="#">
								<button class="ranking-feed-card__more-btn" type="button">더보기</button>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="ranking-feed-group">
				<p class="ranking-feed-group__title container">가구 인기 상품 TOP 10</p>
				<div class="ranking-feed-group__card-wrap">
					<div class="ranking-feed-card">
						<div class="container">
							<p class="ranking-feed-card__title"></p>
							<div class="ranking-feed-card__product-wrap">
								<div class="ranking-product-item-wrap">
									<div class="product-item">
										<div class="product-item__image">
											<a href="#">
												<img class="image" src="#">
												<div class="product-item__image__number"></div>
											</a>
											<button type="button">
												<img src="#" style="width:24px;height:24px;">
											</button>
										</div>
									</div>
									<a href="#">
										<div class="project-item__info">
											<div class="product-item__info__title">
												<p class="product-item__info__title__brand"></p>
												<p></p>
											</div>
											<div class="product-item__info__col">
												<div class="product-item__info__price">
													<span class="discount-rate">
													
													</span>
													<strong></strong>
												</div>
											</div>
											<div class="product-item__info__col">
												<img src="#">
												<strong></strong>
											</div>
										</div>
									</a>
								</div>
							</div>
							<a href="#">
								<button class="ranking-feed-card__more-btn" type="button">더보기</button>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="ranking-feed-group">
				<p class="ranking-feed-group__title container">가전 인기 상품 TOP 10</p>
				<div class="ranking-feed-group__card-wrap">
					<div class="ranking-feed-card">
						<div class="container">
							<p class="ranking-feed-card__title"></p>
							<div class="ranking-feed-card__product-wrap">
								<div class="ranking-product-item-wrap">
									<div class="product-item">
										<div class="product-item__image">
											<a href="#">
												<img class="image" src="#">
												<div class="product-item__image__number"></div>
											</a>
											<button type="button">
												<img src="#" style="width:24px;height:24px;">
											</button>
										</div>
									</div>
									<a href="#">
										<div class="project-item__info">
											<div class="product-item__info__title">
												<p class="product-item__info__title__brand"></p>
												<p></p>
											</div>
											<div class="product-item__info__col">
												<div class="product-item__info__price">
													<span class="discount-rate">
													
													</span>
													<strong></strong>
												</div>
											</div>
											<div class="product-item__info__col">
												<img src="#">
												<strong></strong>
											</div>
										</div>
									</a>
								</div>
							</div>
							<a href="#">
								<button class="ranking-feed-card__more-btn" type="button">더보기</button>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="ranking-feed-group">
				<p class="ranking-feed-group__title container">인테리어 인기 상품 TOP 10</p>
				<div class="ranking-feed-group__card-wrap">
					<div class="ranking-feed-card">
						<div class="container">
							<p class="ranking-feed-card__title"></p>
							<div class="ranking-feed-card__product-wrap">
								<div class="ranking-product-item-wrap">
									<div class="product-item">
										<div class="product-item__image">
											<a href="#">
												<img class="image" src="#">
												<div class="product-item__image__number"></div>
											</a>
											<button type="button">
												<img src="#" style="width:24px;height:24px;">
											</button>
										</div>
									</div>
									<a href="#">
										<div class="project-item__info">
											<div class="product-item__info__title">
												<p class="product-item__info__title__brand"></p>
												<p></p>
											</div>
											<div class="product-item__info__col">
												<div class="product-item__info__price">
													<span class="discount-rate">
													
													</span>
													<strong></strong>
												</div>
											</div>
											<div class="product-item__info__col">
												<img src="#">
												<strong></strong>
											</div>
										</div>
									</a>
								</div>
							</div>
							<a href="#">
								<button class="ranking-feed-card__more-btn" type="button">더보기</button>
							</a>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</main>
</body>
</html>