<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
</head>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<link rel="stylesheet" type="text/css" href="/css/store/ranks.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
<body>
<main role="main" id="root">
	<div class="RankingFeed">
		<section class="ranking-feed">
			<div class="ranking-feed-group">
				<p class="ranking-feed-group__title container">전체상품 BEST 50</p>
				<div class="ranking-feed-group__card-wrap">
					<div class="ranking-feed-card">
						<div class="container">
							<p class="ranking-feed-card__title"></p>
							<div class="ranking-feed-card__product-wrap">
								<c:forEach items="${list }" var="plist" varStatus="status" begin="0" end="49">
								<div class="ranking-product-item-wrap">
									<div class="product-item">
										<div class="product-item__image">
											<a href="#">
												<img class="image" src="${root }${plist.prodImage }">
												<div class="product-item__image__number">${status.count }</div>
											</a>
											<button type="button">
												<img src="/image/common/bookmark-gray.png" style="width:24px;height:24px;">
											</button>
										</div>
									</div>
									<a href="#">
										<div class="project-item__info">
											<div class="product-item__info__title">
												<p class="product-item__info__title__brand">${plist.prodSeller }</p>
												<p>${plist.prodTitle }</p>
											</div>
											<div class="product-item__info__col">
												<div class="product-item__info__price">
													<span class="discount-rate">
													${plist.discountRate }%
													</span>
													<strong>
													<fmt:formatNumber value="${plist.prodPrice }" pattern="#,###"/>
													</strong>
												</div>
											</div>
											<c:if test="${plist.reviewCnt!=0}">
											<div class="product-item__info__col">
												<img src="/image/common/star.png" style="width:12px;height:12px;">
												<strong>${plist.starGrade }</strong>&nbsp;
												 리뷰 ${plist.reviewCnt }
											</div>
											</c:if>
										</div>
									</a>
								</div>
								</c:forEach>
							</div>
							<a href="/store/ranksDetail.do?num=0">
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
								<c:forEach items="${flist }" var="flist" varStatus="status" begin="0" end="9">
								<div class="ranking-product-item-wrap">
									<div class="product-item">
										<div class="product-item__image">
											<a href="#">
												<img class="image" src="${root }${flist.prodImage }">
												<div class="product-item__image__number">${status.count}</div>
											</a>
											<button type="button">
												<img src="/image/common/bookmark-gray.png" style="width:24px;height:24px;">
											</button>
										</div>
									</div>
									<a href="#">
										<div class="project-item__info">
											<div class="product-item__info__title">
												<p class="product-item__info__title__brand">${flist.prodSeller }</p>
												<p>${flist.prodTitle }</p>
											</div>
											<div class="product-item__info__col">
												<div class="product-item__info__price">
													<span class="discount-rate">
													${flist.discountRate }%
													</span>
													<strong><fmt:formatNumber value="${flist.prodPrice }" pattern="#,###"/></strong>
												</div>
											</div>
											<c:if test="${flist.reviewCnt!=0}">
											<div class="product-item__info__col">
												<img src="/image/common/star.png" style="width:12px;height:12px;">
												<strong>3.2</strong>&nbsp;
												리뷰 4
											</div>
											</c:if>
										</div>
									</a>
								</div>
								</c:forEach>
							</div>
							<a href="/store/ranksDetail.do?num=1">
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
							<c:forEach items="${alist }" var="alist" begin="0" end="9" varStatus="status">
								<div class="ranking-product-item-wrap">
									<div class="product-item">
										<div class="product-item__image">
											<a href="#">
												<img class="image" src="${root }${alist.prodImage }">
												<div class="product-item__image__number">${status.count }</div>
											</a>
											<button type="button">
												<img src="/image/common/bookmark-gray.png" style="width:24px;height:24px;">
											</button>
										</div>
									</div>
									<a href="#">
										<div class="project-item__info">
											<div class="product-item__info__title">
												<p class="product-item__info__title__brand">${alist.prodSeller }</p>
												<p>${alist.prodTitle }</p>
											</div>
											<div class="product-item__info__col">
												<div class="product-item__info__price">
													<span class="discount-rate">
													${alist.discountRate }%
													</span>
													<strong><fmt:formatNumber value="${alist.prodPrice }" pattern="#,###"/></strong>
												</div>
											</div>
											<c:if test="${alist.reviewCnt!=0}">
											<div class="product-item__info__col">
												<img src="/image/common/star.png" style="width:12px;height:12px;">
												<strong>3.2</strong>&nbsp;
												리뷰 20
											</div>
											</c:if>
										</div>
									</a>
								</div>
								</c:forEach>
							</div>
							<a href="/store/ranksDetail.do?num=2">
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
							<c:forEach items="${ilist }" var="ilist" begin="0" end="9" varStatus="status">
								<div class="ranking-product-item-wrap">
									<div class="product-item">
										<div class="product-item__image">
											<a href="#">
												<img class="image" src="${root }${ilist.prodImage }">
												<div class="product-item__image__number">${status.count }</div>
											</a>
											<button type="button">
												<img src="/image/common/bookmark-gray.png" style="width:24px;height:24px;">
											</button>
										</div>
									</div>
									<a href="#">
										<div class="project-item__info">
											<div class="product-item__info__title">
												<p class="product-item__info__title__brand">${ilist.prodSeller }</p>
												<p>${ilist.prodTitle }</p>
											</div>
											<div class="product-item__info__col">
												<div class="product-item__info__price">
													<span class="discount-rate">
													${ilist.discountRate }%
													</span>
													<strong><fmt:formatNumber value="${ilist.prodPrice }" pattern="#,###"/></strong>
												</div>
											</div>
											<c:if test="${ilist.reviewCnt!=0}">
											<div class="product-item__info__col">
												<img src="/image/common/star.png" style="width:12px;height:12px;">
												<strong>4.2</strong>&nbsp;
												리뷰 14
											</div>
											</c:if>
										</div>
									</a>
								</div>
								</c:forEach>
							</div>
							<a href="/store/ranksDetail.do?num=3">
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