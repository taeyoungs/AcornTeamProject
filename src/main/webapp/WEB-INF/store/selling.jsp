<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<main role="main" id="root">
	<div id="product-data" class="hide" data-selling="true"></div>
	<div class="container">
		<div class="breadcrumb"></div>
		<div class="row">
			<div class="col-6 col-lg-7 images-lg">
				<div class="images">
					<div class="images__thumbnail-list">
						<div class="images__thumbnail-item active">
							<img src="">
						</div>
						<div class="images__thumbnail-item">
							<img src="">
						</div>
					</div>
					<div class="images__current">
						<img class="active" src="" data-index="">
						<img src="" data-index="">
					</div>
				</div>
			</div>
			<div class="col cover__info">
				<div class="cover__info__brand">
					<a href="">브랜드</a>
				</div>
				<div class="cover__info__name">
					<h1>상품명</h1>
				</div>
				<div class="cover__info__review cover__info__review--present">
					<a href="">
						<div class="cover__info__review__stars">
							<span class="icon icon-etc-star-fill-sm"></span>
							<span class="icon icon icon-etc-star-half-sm"></span>
						</div>
						<div>리뷰</div>
					</a>
				</div>
				<div class="cover__info__price">
					<div class="cover__info__price__discount-rate">
						<mark></mark>
						<span>%</span>
					</div>
					<div class="cover__info__price__price">
						<small>할인율</small>
						<del>가격</del>
						<b>
							<mark>최종가격</mark>
							<span>원</span>
						</b>
					</div>
				</div>
				<div class="cover__info__hr"></div>
			</div>
		</div>
	</div>
	
	<!-- content -->
	<section id="contents" class="container">
		<div id="selling-helper-wrap" class="sticky-top">
			<div id="selling-helper" class="sticky-content row absolute open">
				<section class="col-12">
					<nav id="product-contents-tab">
						<ul class="row align-flex-end">
							<li class="col active" data-target="product-info">상품정보</li>
							<li class="col" data-target="product-info">리뷰</li>
						</ul>
					</nav>
				</section>
			</div>
		</div>
		
		<div id="product-contents-wrap" class="row justify-center justify-lg-flex-start lg">
			<section id="product-contents" class="col-12 col-md-10 col-lg-8 selling-lg">
				<div class="selling-lg-wrap">
					<div id="product-info"></div>
				</div>
			</section>
		</div>
	</section>
</main>
</body>
</html>