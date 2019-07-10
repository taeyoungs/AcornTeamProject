<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/store/commerce.css">
<link rel="stylesheet" type="text/css" href="${root}/css/common.css">
<link rel="stylesheet" type="text/css" href="${root}/css/main/main_media.css">
<link rel="stylesheet" type="text/css" href="${root}/css/main/bucket_ui.css">
<link rel="stylesheet" type="text/css" href="${root}/css/main/components.css">
</head>
<body>
<!-- 카테고리 whole wrap -->
<div class="category-feed-container">
	<div class="category-feed-wrap container">
		<div class="category-feed row">
			<!-- left menu-bar [S]-->
			<div class="category-feed__side-bar col-12 col-md-3">
				<section class="commerce-category-list">
					<h2 class="commerce-category-list__title">
						<a class="commerce-category-list__title"></a>
					</h2>
					<ul class="commerce-category-tree commerce-category-list__categories">
						<!-- First Category List -->
						<li class="commerce-category-tree__entry">
							<div class="commerce-category-tree__entry__header">
								<a class="commerce-category-tree__entry__title selected">가구</a>
								<button class="commerce-category-tree__entry__expand open" title="펼치기">
									<svg class="icon">
										<path></path>
									</svg>
								</button>
							</div>
							<div class="open expanded">
								<ul class="commerce-category-tree commerce-category-tree__entry__children">
									<!-- Second Category List [S] -->
									<li class="commerce-category-tree__entry">
										<div class="commerce-category-tree__entry__header">
											<a class="commerce-category-tree__entry__title selected">second 카테고리 * 2</a>
										</div>
									</li>
									<!-- Second Category List [E] -->
								</ul>
							</div>
						</li>
					</ul>
					<ul class="commerce-category-list__others">
						<li class="commerce-category-list__others__item">
							<a>가전</a>
						</li>
						<li class="commerce-category-list__others__item">
							<a>인테리어</a>
						</li>
					</ul>
				</section>
			</div>
			<!-- left menu-bar [E]-->
			
			<!-- right main content [S]-->
			<div class="category-feed__content col-12 col-md-9">
				<div class="commerce-category-header category-feed__content__header">
					<div class="commerce-category-header__breadcrumb-wrap">
						<nav class="commerce-category-breadcrumb-wrap commerce-category-header__breadcrumb">
							<ol class="commerce-category-breadcrumb">
								<li class="commerce-category-breadcrumb__entry">
									<a class="link" href=""></a>
									<svg class="icon"></svg>
								</li>
							</ol>
						</nav>
					</div>
					<nav class="commerce-category-header__menu-wrap"></nav>
				</div>
				<div class="sticky-container category-feed__content__filter-container"></div>
				<!-- 상품 출력 -->
				<ul class="category-feed__content__content row">
					<li class="col-6 col-lg-4">
						<div class="product-item">
							<div class="product-item__image">
								<a href="">
									<img class="image" src=""/>
								</a>
							</div>
							<a href=""></a>
						</div>
					</li>
				</ul>
			</div>
			<!-- right main content [S]-->
		</div>
	</div>
</div>
</body>
</html>