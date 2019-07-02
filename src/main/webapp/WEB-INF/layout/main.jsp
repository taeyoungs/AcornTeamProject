<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="<%=request.getContextPath() %>" />
<link rel="stylesheet" type="text/css" href="${root}/css/main.css">
<script type="text/javascript" src="${root}/js/main.js"></script>
<body>
<div class="main_wrapper">
<!-- Main Image & Banner -->
	<div id="wrapper">
		<div class="row">
			<!-- Main Image -->
			<a href="#" class="main_header">
				<div class="main_header_image-wrap">
					<div class="main_header_image">
						<img src="../image/main_image.jpg">
					</div>
				</div>
				<div class="main_header_content-wrap">
					<div class="main_header_more">보러가기</div>
				</div>
			</a>
		</div>
		<!-- Banner -->
		<div id="slider-wrap" class="row2">
			<ul id="slider">
				<li data-color="#1abc9c">
					<div>
						<h3>Slide #1</h3>
						<span>Sub-title #1</span>
					</div> 
					<img src="../image/placehold01.jpg">
				</li>

				<li data-color="#3498db">
					<div>
						<h3>Slide #2</h3>
						<span>Sub-title #2</span>
					</div> 
					<img src="../image/placehold02.jpg">
				</li>

				<li data-color="#9b59b6">
					<div>
						<h3>Slide #3</h3>
						<span>Sub-title #3</span>
					</div> 
					<img src="../image/placehold03.jpg">
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

<!-- Category -->
<section class="main_category_wrapper">
	<div class="main_category_container">
	<ul class="main_category_list">
		<li class="main_category_item">
			<a class="main_category_icon_link">
			<div class="main_category_icon_img"><img src="../image/cart.png"></div>
			<div class="main_category_icon_title">쇼핑하기</div>
			</a>
		</li>
		<li class="main_category_item">
			<a class="main_category_icon_link">
			<div class="main_category_icon_img"><img src="../image/dimensions.png"></div>
			<div class="main_category_icon_title">평수별집구경</div>
			</a>
		</li>
		<li class="main_category_item">
			<a class="main_category_icon_link">
			<div class="main_category_icon_img"><img src="../image/sofa.png"></div>
			<div class="main_category_icon_title">공간별사진</div>
			</a>
		</li>
		<li class="main_category_item">
			<a class="main_category_icon_link">
			<div class="main_category_icon_img"><img src="../image/teacher.png"></div>
			<div class="main_category_icon_title">전문가와상담</div>
			</a>
		</li>
		<li class="main_category_item">
			<a class="main_category_icon_link">
			<div class="main_category_icon_img"><img src="../image/question.png"></div>
			<div class="main_category_icon_title">질문과답변</div>
			</a>
		</li>
	</ul>
	</div>
</section>

<!-- 오늘의 스토리-->
<section class="main_zip_wrapper">
	<div class="main_zip_container">
		<header class="main_zip_header">
			<h3 class="main_zip_header-content">오늘의 스토리</h3>
		</header>
		<ul class="main_zip_content_item">
			<li class="main_zip_content">
				<a class="main_zip_content_link">
					<div class="main_zip_image-wrap"></div>
					<div class="main_zip_content-wrap"></div>
				</a>
			</li>
			<li class="main_zip_content">
				<a class="main_zip_content_link">
					<div class="main_zip_image-wrap"></div>
					<div class="main_zip_content-wrap"></div>
				</a>
			</li>
			<li class="main_zip_content">
				<a class="main_zip_content_link">
					<div class="main_zip_image-wrap"></div>
					<div class="main_zip_content-wrap"></div>
				</a>
			</li>
			<li class="main_zip_content">
				<a class="main_zip_content_menu">
				<div class="main_zip_content_menu_title">예쁜 집 구경하기</div>
				</a>
				<a class="main_zip_content_link_menu">
				<div class="main_zip_content_menu_title">인테리어 꿀 팁</div>
				</a>
			</li>
		</ul>
	</div>
</section>


<!-- 오늘의 인기사진 -->
<section class="main_photo_wrapper">
	<div class="main_photo_container">
		<header class="main_photo_header">
			<h3 class="main_photo_header_content">오늘의 인기사진</h3>
			<a class="main_photo_header_more">더보기</a>
		</header>

		
		<div class="main_photo_list_wrap">
			<ul class="main_photo_list">
				<li class="main_photo_items">
					<article class="main_photo_item_card">
						<a class="main_photo_item_link">
							<div class="main_photo_item">
								<img src="">
							</div>					
						</a>
					</article>
				</li>
				<li class="main_photo_items">
					<article class="main_photo_item_card">
						<a class="main_photo_item_link">
							<div class="main_photo_item">
								<img src="">
							</div>					
						</a>
					</article>
				</li>
				<li class="main_photo_items">
					<article class="main_photo_item_card">
						<a class="main_photo_item_link">
							<div class="main_photo_item">
								<img src="">
							</div>					
						</a>
					</article>
				</li>
				<li class="main_photo_items">
					<article class="main_photo_item_card">
						<a class="main_photo_item_link">
							<div class="main_photo_item">
								<img src="">
							</div>					
						</a>
					</article>
				</li>
				<li class="main_photo_items">
					<article class="main_photo_item_card">
						<a class="main_photo_item_link">
							<div class="main_photo_item">
								<img src="">
							</div>					
						</a>
					</article>
				</li>
				<li class="main_photo_items">
					<article class="main_photo_item_card">
						<a class="main_photo_item_link">
							<div class="main_photo_item">
								<img src="">
							</div>					
						</a>
					</article>
				</li>
				<li class="main_photo_items">
					<article class="main_photo_item_card">
						<a class="main_photo_item_link">
							<div class="main_photo_item">
								<img src="">
							</div>					
						</a>
					</article>
				</li>
				<li class="main_photo_items">
					<article class="main_photo_item_card">
						<a class="main_photo_item_link">
							<div class="main_photo_item">
								<img src="">
							</div>					
						</a>
					</article>
				</li>
			</ul>
		</div>
	</div>
</section>

<!-- 오늘의 딜 -->
<section class="main_recommends_wrapper">
	<div class="main_recommends_container">
		<header class="main_recommends_header">
			<h3 class="main_recommends_header_content">오늘의 딜</h3>
			<a class="main_recommends_header_more">더보기</a>
		</header>
		
		<!-- Slider -->
		<div id="main_recommends_slider_wrap">
			<ul id="main_recommends_product_list">
				<li class="main_recommends_product_items">
					<div class="main_recommends_pruduct_wrap">
						<a class="main_recommends_product_item">
							<div class="img-wrap-square">
								<img src="../image/deal01.jpg"></div>
							<div class="img-wrap-info">not yet
							</div>					
						</a>
					</div>
				</li>
				<li class="main_recommends_product_items">
					<div class="main_recommends_pruduct_wrap">
						<a class="main_recommends_product_item">
							<div class="img-wrap-square">
								<img src="../image/deal02.jpg"></div>
							<div class="img-wrap-info">not yet
							</div>					
						</a>
					</div>
				</li>
				<li class="main_recommends_product_items">
					<div class="main_recommends_pruduct_wrap">
						<a class="main_recommends_product_item">
							<div class="img-wrap-square">
								<img src="../image/deal03.jpg"></div>
							<div class="img-wrap-info">not yet
							</div>					
						</a>
					</div>
				</li>
				<li class="main_recommends_product_items">
					<div class="main_recommends_pruduct_wrap">
						<a class="main_recommends_product_item">
							<div class="img-wrap-square">
								<img src="../image/deal04.jpg"></div>
							<div class="img-wrap-info">not yet
							</div>					
						</a>
					</div>
				</li>
				<li class="main_recommends_product_items">
					<div class="main_recommends_pruduct_wrap">
						<a class="main_recommends_product_item">
							<div class="img-wrap-square">
								<img src="../image/deal05.jpg"></div>
							<div class="img-wrap-info">not yet
							</div>					
						</a>
					</div>
				</li>
				<li class="main_recommends_product_items">
					<div class="main_recommends_pruduct_wrap">
						<a class="main_recommends_product_item">
							<div class="img-wrap-square">
								<img src="../image/deal06.jpg"></div>
							<div class="img-wrap-info">not yet
							</div>					
						</a>
					</div>
				</li>
 				<li class="main_recommends_product_items">
					<div class="main_recommends_pruduct_wrap">
						<a class="main_recommends_product_item">
							<div class="img-wrap-square">
								<img src="../image/deal07.jpg"></div>
							<div class="img-wrap-info">not yet
							</div>					
						</a>
					</div>
				</li>
				<li class="main_recommends_product_items">
					<div class="main_recommends_pruduct_wrap">
						<a class="main_recommends_product_item">
							<div class="img-wrap-square">
								<img src="../image/deal08.jpg"></div>
							<div class="img-wrap-info">not yet
							</div>					
						</a>
					</div>
				</li>
			</ul>		
		<div id="recommends_pagination-wrap">
			<ul>
			</ul>
		</div>
		</div>
		<!--BUTTONS -->
		<div class="recommends_btns_wrapper">
			<div class="recommends_btns next" id="recommends_next">
				<span>></span>
			</div>
			<div class="recommends_btns previous" id="recommends_previous">
				<span><</span>
			</div>
		</div>
	</div>
</section>


<!-- 베스트 100 -->
<section class="main_rank_wrapper">
	<div class="main_rank_container">
		<header class="main_rank_header">
			<h3 class="main_rank_header_content">베스트 100</h3>
			<a class="main_rank_header_more">더보기</a>
		</header>
		<ul class="main_rank_list">
			<li class="main_rank_item">
				<a class="main_rank_item_link">
					<div class="main_rank_item_image"></div>
					<div class="main_rank_item_content"></div>
				</a>
			</li>
			<li class="main_rank_item">
				<a class="main_rank_item_link">
					<div class="main_rank_item_image"></div>
					<div class="main_rank_item_content"></div>
				</a>
			</li>
			<li class="main_rank_item">
				<a class="main_rank_item_link">
					<div class="main_rank_item_image"></div>
					<div class="main_rank_item_content"></div>
				</a>
			</li>
			<li class="main_rank_item">
				<a class="main_rank_more">
				<div class="main_rank_more_title">베스트100 보기</div>
				</a>
			</li>
		</ul>
	</div>
</section>
</div>
</body>
