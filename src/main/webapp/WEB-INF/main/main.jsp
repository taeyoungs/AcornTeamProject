<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="<%=request.getContextPath() %>" />
<link rel="stylesheet" type="text/css" href="${root}/css/main/main_media.css">
<link rel="stylesheet" type="text/css" href="${root}/css/main/bucket_ui.css">
<link rel="stylesheet" type="text/css" href="${root}/css/main/components.css">
<script type="text/javascript" src="${root}/js/main.js"></script>
<body>
<div class="main_wrapper">
<!-- Main Image & Banner -->
	<section id="wrapper" class="container home-header">
		<div class="row">
			<!-- Main Image -->
			<div class="col-12 col-md-9 home-header__story">
				<article class="story-entry">
					<a href="/zipdle/gotoZipList" class="story-entry-link">
						<div class="story-entry__image-wrap">
							<div class="story-entry__image" style="background-image: url('${root}/image/common/main_image.jpg')">
							</div>
						</div>
						<div class="story-entry__content-wrap">
							<div class="story-entry__content">
								<div class="story-entry__content__title">내가 선택한 오늘의 행복.</div>
								<div class="story-entry__content__profile">
									<span class="story-entry__content__profile__image" style="background-image: url('${root}/uploadImage/dragon.png')">
									</span>
									<span class="story-entry__content__profile__name">sowon7912</span>
								</div>
							</div>
							<div class="home-header__story__more">보러가기</div>
						</div>
					</a>
				</article>
			</div>
			<div class="col-12 col-md-3 home-header__banner-col">
				<div class="home-header__banner-wrap">
					<div class="home-header__banner-container">
						<ul class="home-header__banner">
							<li class="home-header__banner__item">
								<a class="home-header__banner__item__link">
									<div class="pc-banner" style="background-image: url('/image/common/weired01.png'); background-size: cover;background-position: center;"></div>
								</a>
							</li>
						</ul>
						<ul class="home-header__banner-items">
							<li class="home-header__banner__item">
								<a class="home-header__banner__item__link">
									<div class="pc-banner" style="background-image: url('/image/common/weired01.png')"></div>
								</a>
							</li>
							<li class="home-header__banner__item">
								<a class="home-header__banner__item__link">
									<div class="pc-banner" style="background-image: url('/image/common/weired02.png')"></div>
								</a>
							</li>
							<li class="home-header__banner__item">
								<a class="home-header__banner__item__link">
									<div class="pc-banner" style="background-image: url('/image/common/weired03.png')"></div>
								</a>
							</li>
						</ul>
						
						<!--controls-->
						<div class="btns" id="next">
							<i class="fa fa-arrow-right"></i>
						</div>
						<div class="btns" id="previous">
							<i class="fa fa-arrow-left"></i>
						</div>
						<div id="pagination-wrap">
							<ul>
							</ul>
						</div>
						<!--controls-->
					</div>
				</div>
			</div>
		</div>
	</section>

<!-- Category -->
<nav class="container shortcut">
	<ul class="shortcut__list">
		<li class="shortcut__list__item">
			<a href="/store/store.do" class="shortcut__list__item__link">
				<div class="shortcut__list__item__link__image">
					<img class="shortcut__list__item__link__image__img" src="${root}/image/common/cart.png">
				</div>
				<div class="shortcut__list__item__link__title">쇼핑하기</div>
			</a>
		</li>
		<div class="blank_margin"></div>
		<li class="shortcut__list__item">
			<a href="/zipdle/gotoZipList" class="shortcut__list__item__link">
				<div class="shortcut__list__item__link__image">
					<img class="shortcut__list__item__link__image__img" src="${root}/image/common/dimensions.png">
				</div>
				<div class="shortcut__list__item__link__title">평수별집구경</div>
			</a>
		</li>
		<div class="blank_margin"></div>
		<li class="shortcut__list__item">
			<a href="photo/photolist.do?where=photo" class="shortcut__list__item__link">
				<div class="shortcut__list__item__link__image">
					<img class="shortcut__list__item__link__image__img" src="${root}/image/common/sofa.png">
				</div>
				<div class="shortcut__list__item__link__title">공간별사진</div>
			</a>
		</li>
		<div class="blank_margin"></div>
		<li class="shortcut__list__item">
			<a href="/store/category.do?codeVal=가구" class="shortcut__list__item__link">
				<div class="shortcut__list__item__link__image">
					<img class="shortcut__list__item__link__image__img" src="${root}/image/common/applications.png">
				</div>
				<div class="shortcut__list__item__link__title">카테고리별 상품보기</div>
			</a>
		</li>
		<div class="blank_margin"></div>
		<li class="shortcut__list__item">
			<a href="/board/list.do" class="shortcut__list__item__link">
				<div class="shortcut__list__item__link__image">
					<img class="shortcut__list__item__link__image__img" src="${root}/image/common/question.png">
				</div>
				<div class="shortcut__list__item__link__title">질문과답변</div>
			</a>
		</li>
		<div class="blank_margin"></div>
		<li class="shortcut__list__item">
			<a href="/main/story.do" class="shortcut__list__item__link">
				<div class="shortcut__list__item__link__image">
					<img class="shortcut__list__item__link__image__img" src="${root}/image/common/puzzle.png">
				</div>
				<div class="shortcut__list__item__link__title">About us</div>
			</a>
		</li>
	</ul>
</nav>

<!-- 오늘의 스토리-->
<section class="container home-section home-stories">
	<header class="row home-section__header">
		<h2 class="col-12 home-section__header__content">오늘의 스토리</h2>
	</header>
	<ul class="row home-stories__content">
	<c:forEach var="zip" items="${zipList}">
		<li class="col-6 col-md-3 home-stories__content__item">
			<article class="story-entry story-story-item">
				<a class="story-entry-link" href="/zipdle/${zip.zipSeqNo}/zipdleDetail">
					<div class="story-entry__image-wrap">
						<img class="story-entry__image lazyload" src="${zip.zipImage}">
					</div>
					<div class="story-entry__content-wrap">
						<div class="story-entry__content">
							<div class="story-entry__content__title">${zip.zipTitle}</div>
							<div class="story-entry__content__profile">
								<c:if test="${empty zip.memberImage}">
									<span class="story-entry__content__profile__image" style="background-image: url('/image/common/user.png')"></span>
								</c:if>
								<c:if test="${!empty zip.memberImage}">
									<span class="story-entry__content__profile__image" style="background-image: url('/uploadImage/${zip.memberImage}')"></span>
								</c:if>
								<span class="story-entry__content__profile__name">${zip.memberNickname}</span>
							</div>
						</div>
					</div>
				</a>
			</article>
		</li>
		</c:forEach>
		<div class="col-6 col-md-3 home-stories__content__menu-wrap">
			<div class="home-stories__content__menu">
				<a class="home-stories__content__menu__entry" href="/zipdle/gotoZipList">
					<div class="description">예쁜 집 구경하기</div>
					<div class="title">
						<span class="text">집들이</span>
						<span class="caret icon-page-home__g-1"></span>
					</div>
				</a>
				<a class="home-stories__content__menu__entry">
					<div class="description">전문가 시공사례</div>
					<div class="title">
						<span class="text">전문가 집들이</span>
						<span class="caret icon-page-home__g-1"></span>
					</div>
				</a>
				<a class="home-stories__content__menu__entry">
					<div class="description">인테리어 꿀팁 총 집합</div>
					<div class="title">
						<span class="text">노하우</span>
						<span class="caret icon-page-home__g-1"></span>
					</div>
				</a>
			</div>
		</div>
	</ul>
</section>

<!-- 오늘의 인기사진 -->
<section class="container home-section home-cards">
	<header class="row home-section__header">
		<h2 class="col home-section__header__content">오늘의 인기사진</h2>
		<a class="home-section__header__more home-hide-sm" href="photo/photolist.do?where=photo">더보기</a>
	</header>
	<ul class="row home-cards__content">
		<c:forEach var="photo" items="${photoList}" varStatus="status">
		<li class="col-6 col-md-3 home-cards__content__item">
			<article class="story-entry story-card-item">
				<a class="story-entry-link" onclick="location.href='photo/photodetail.do?num=${photo.photoSeqNo}'">
					<div class="story-entry__image-wrap">
						<img class="story-entry__image lazyload" src="${photo.photoImage}">
						<span class="icon-common-etc__a-4" style="z-index: 1;position: absolute;top: 10px;right: 10px;"></span>
					</div>
					<div class="story-entry__content-wrap">
						<div class="story-entry__content">
							<div class="story-entry__content__profile">
								<c:if test="${empty photo.memberImage}">
									<span class="story-entry__content__profile__image" style="background-image: url('/image/common/user.png')"></span>
								</c:if>
								<c:if test="${!empty photo.memberImage}">
									<span class="story-entry__content__profile__image" style="background-image: url('/uploadImage/${photo.memberImage}')"></span>
								</c:if>
								<span class="story-entry__content__profile__name">${photo.memberNickname}</span>
							</div>
						</div>
						<c:if test="${status.count < 4}">
						<div class="home-rank-icon">
							<span class="pc icon-page-home__a-2">${status.count}</span>
							<span class="mobile icon-page-home__b-2">${status.count}</span>
						</div>
						</c:if>
					</div>
				</a>
			</article>
		</li>
		</c:forEach>
	</ul>
	<div class="row home-section__more-wrap">
		<div class="col home-section__more">
			<a class="col home-section__more__btn" href="photo/photolist.do?where=photo">인기 사진 더보기</a>
		</div>
	</div>
</section>

<!-- 오늘의 딜 -->
<section class="container home-section home-recommends home-section--scroll">
	<header class="row home-section__header">
		<h2 class="col home-section__header__content">오늘의 딜</h2>
		<a class="home-section__header__more" href="/store/store.do">더보기</a>
	</header>
	<div class="scroller-wrap home-recommends__content-wrap">
		<div class="scroller scroller--enable">
			<div class="scroller__content home-scroll-wrap">
				<ul class="row home-recommends__content home-scroll">
					<c:forEach items="${dealList}" var="deal">
						<li class="col-5 col-md-3 col-xl-2 home-recommends__content__item scroller__item">
							<div class="product-simplified home-production-item">
								<a class="product-item" href="/store/selling.do?prodNo=${deal.prodNo}">
									<div class="img-wrap square">
										<img class="lazyload" src="${deal.prodImage}">
									</div>
									<div class="info">
										<p class="product-name text-caption-1 line-height-normal">${deal.prodTitle}</p>
										<p class="price text-caption-3">
											<span class="discount-ratio text-blue text-body-1 bold">${deal.discountRate}%</span>
											<strong class="selling-price text-body-1 text-black">
												<fmt:formatNumber value="${deal.prodPrice-(deal.prodPrice*deal.discountRate/100)}" pattern="#,###"/>
											</strong>
										</p>
									</div>
								</a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="scroller__ui">
				<div class="scroller__ui__left">
					<span class="unselected icon-page-home__a-1"></span>
					<span class="selected icon-page-home__c-1"></span>
				</div>
				<div class="scroller__ui__right">
					<span class="unselected icon-page-home__b-1"></span>
					<span class="selected icon-page-home__d-1"></span>
				</div>
			</div>
		</div>
	</div>
</section>

	<!-- 베스트 100 -->
	<section class="container home-section home-rank">
		<header class="row home-section__header">
			<h2 class="col home-section__header__content">베스트 100</h2>
			<a class="home-section__header__more" href="/store/ranks.do">더보기</a>
		</header>
		<div class="production-rank-feed ">
			<ul class="production-rank-feed__category">
				<li class="production-rank-feed__category__item" onclick="changeBestCategory('all')">전체</li>
				<li class="production-rank-feed__category__item" onclick="changeBestCategory('furniture')">가구</li>
				<li class="production-rank-feed__category__item" onclick="changeBestCategory('electronics')">가전</li>
				<li class="production-rank-feed__category__item" onclick="changeBestCategory('interior')">인테리어</li>
			</ul>
			<!-- 전체 -->
			<div class="row production-rank-feed__group">
				<div class="col production-rank-feed__list-wrap" id="all">
					<ul class="row production-rank-feed__list">
					<c:forEach items="${rankListAll}" var="rank" varStatus="status">
						<input type="hidden" id="categoryNm" name="categoryNm" value="${categoryNm}">						
						<div class="col-4 production-rank-feed__item">
							<div class="product-simplified home-production-item">
								<a class="product-item" href="/store/selling.do?prodNo=${rank.prodNo}">
									<div class="img-wrap square">
										<img class="lazyload" src="${root}${rank.prodImage}">
									</div>
									<div class="info">
										<p class="product-name text-caption-1 line-height-normal">${rank.prodTitle}</p>
										<p class="price text-caption-3">
											<span class="discount-ratio text-blue text-body-1 bold">${rank.discountRate}%</span>
											<strong class="selling-price text-body-1 text-black">
												<fmt:formatNumber value="${rank.prodPrice-(rank.prodPrice*rank.discountRate/100)}" pattern="#,###"/>
											</strong>
										</p>
									</div>
									<c:if test="${status.count < 4}">
									<div class="home-rank-icon">
										<span class="pc icon-page-home__a-2">${status.count}</span>
										<span class="mobile icon-page-home__b-2">${status.count}</span>
									</div>
									</c:if>
								</a>
							</div>
						</div>
					</c:forEach>
					</ul>
				</div>
				<!-- 가구 -->
				<div class="col production-rank-feed__list-wrap" id="furniture" style="display:none">
					<ul class="row production-rank-feed__list">
					<c:forEach items="${rankListFurniture}" var="rank" varStatus="status">
						<div class="col-4 production-rank-feed__item">
							<div class="product-simplified home-production-item">
								<a class="product-item" href="/store/selling.do?prodNo=${rank.prodNo}">
									<div class="img-wrap square">
										<img class="lazyload" src="${rank.prodImage}">
									</div>
									<div class="info">
										<p class="product-name text-caption-1 line-height-normal">${rank.prodTitle}</p>
										<p class="price text-caption-3">
											<span class="discount-ratio text-blue text-body-1 bold">${rank.discountRate}%</span>
											<strong class="selling-price text-body-1 text-black">
												<fmt:formatNumber value="${rank.prodPrice-(rank.prodPrice*rank.discountRate/100)}" pattern="#,###"/>
											</strong>
										</p>
									</div>
									<c:if test="${status.count < 4}">
									<div class="home-rank-icon">
										<span class="pc icon-page-home__a-2">${status.count}</span>
										<span class="mobile icon-page-home__b-2">${status.count}</span>
									</div>
									</c:if>
								</a>
							</div>
						</div>
					</c:forEach>
					</ul>
				</div>
				
				<!-- 가전 -->
				<div class="col production-rank-feed__list-wrap" id="electronics" style="display:none">
					<ul class="row production-rank-feed__list">
						<c:forEach items="${rankListElectronics}" var="rank" varStatus="status">
						<div class="col-4 production-rank-feed__item">
							<div class="product-simplified home-production-item">
								<a class="product-item" href="/store/selling.do?prodNo=${rank.prodNo}">
									<div class="img-wrap square">
										<img class="lazyload" src="${rank.prodImage}">
									</div>
									<div class="info">
										<p class="product-name text-caption-1 line-height-normal">${rank.prodTitle}</p>
										<p class="price text-caption-3">
											<span class="discount-ratio text-blue text-body-1 bold">${rank.discountRate}%</span>
											<strong class="selling-price text-body-1 text-black">
												<fmt:formatNumber value="${rank.prodPrice-(rank.prodPrice*rank.discountRate/100)}" pattern="#,###"/>
											</strong>
										</p>
									</div>
									<c:if test="${status.count < 4}">
									<div class="home-rank-icon">
										<span class="pc icon-page-home__a-2">${status.count}</span>
										<span class="mobile icon-page-home__b-2">${status.count}</span>
									</div>
									</c:if>
								</a>
							</div>
						</div>
						</c:forEach>
					</ul>
				</div>
				
				<!-- 인테리어 -->
				<div class="col production-rank-feed__list-wrap" id="interior" style="display:none">
					<ul class="row production-rank-feed__list">
						<c:forEach items="${rankListInterior}" var="rank" varStatus="status">
						<div class="col-4 production-rank-feed__item">
							<div class="product-simplified home-production-item">
								<a class="product-item" href="/store/selling.do?prodNo=${rank.prodNo}">
									<div class="img-wrap square">
										<img class="lazyload" src="${rank.prodImage}">
									</div>
									<div class="info">
										<p class="product-name text-caption-1 line-height-normal">${rank.prodTitle}</p>
										<p class="price text-caption-3">
											<span class="discount-ratio text-blue text-body-1 bold">${rank.discountRate}%</span>
											<strong class="selling-price text-body-1 text-black">
												<fmt:formatNumber value="${rank.prodPrice-(rank.prodPrice*rank.discountRate/100)}" pattern="#,###"/>
											</strong>
										</p>
									</div>
									<c:if test="${status.count < 4}">
									<div class="home-rank-icon">
										<span class="pc icon-page-home__a-2">${status.count}</span>
										<span class="mobile icon-page-home__b-2">${status.count}</span>
									</div>
									</c:if>
								</a>
							</div>
						</div>
						</c:forEach>
					</ul>
				</div>
				
				<!-- 더보기 -->
				<div class="col-12 col-md-3 home-rank__more-wrap">
					<div class="home-rank__more-container">
						<a class="home-rank__more" href="/store/ranks.do">
							<div class="home-rank__more__text">베스트 100 보기
								<div class="home-rank__more__text__icon">
									<span class="unselected icon-page-home__b-1"></span>
									<span class="selected icon-page-home__d-1"></span>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="col-12 home-section__more-wrap">
					<div class="home-section__more">
						<a class="home-section__more__btn" href="/store/ranks.do">카테고리 BEST 100 보기</a>
					</div>
				</div>
			</div>
			
		</div>
	</section>
</div>
<div id="flash_messages">
    <c:if test="${loginCondition eq 'logout'}">
        <div id="flash_notice" class="flash_message">
        	정상적으로 로그아웃이 되었습니다.
        </div>
    </c:if>
    <c:if test="${loginCondition eq 'login'}">
        <div id="flash_notice" class="flash_message">
        	정상적으로 로그인 되었습니다.
        </div>
    </c:if>
    <c:if test="${loginCondition eq 'signup'}">
        <div id="flash_notice" class="flash_message">
        	회원가입이 완료되었습니다. 로그인 해주세요.
        </div>
    </c:if>
</div>
</body>
