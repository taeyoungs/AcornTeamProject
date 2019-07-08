<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="<%=request.getContextPath() %>" />
<link rel="stylesheet" type="text/css" href="${root}/css/main.css">
<body>
<div class="main_wrapper">
<!-- Main Image & Banner -->
	<div id="wrapper">
		<div class="row">
			<!-- Main Image -->
			<article class="main_header-wrap">
				<a href="photo/photolist.do" class="main_header">
					<div class="main_header_image-wrap">
						<div class="main_header_image">
							<img src="${root}/image/common/main_image.jpg">
						</div>
					</div>
					<div class="main_header_content-wrap">
						<div class="main_header_content">
							<div class="main_header_title">내가 선택한 오늘의 행복.</div>
							<div class="main_header_profile">
								<span class="main_header_profile_image"></span>
								<span class="main_header_profile_name">sowon7912</span>
							</div>
						</div>
						<div class="main_header_more">보러가기</div>
					</div>
				</a>
			</article>
		</div>
		<!-- Banner -->
		<div id="slider-wrap" class="row2">
			<ul id="slider">
				<li class="slider_banner_item_list">
					<div class="slider_banner_item">
						<div class="slider_banner_item_b1">
							<span class="weired1">이상하네 #1</span>
							<h3>어제는 됐는데?</h3>
							<span></span>
							<span class="item_b1_subimage">
								<img src="/image/common/questionmark.png">
							</span>
						</div>
					</div>
				</li>

 				<li class="slider_banner_item_list">
					<div class="slider_banner_item">
						<div class="slider_banner_item_b2">
							<span class="weired2">이상하네 #2</span>
							<h3>500 ERROR</h3>
							<span></span>
							<span class="item_b2_subimage">
								<img src="/image/common/error.png">
							</span>
						</div>
					</div>
				</li>

				<li class="slider_banner_item_list">
					<div class="slider_banner_item">
						<div class="slider_banner_item_b3">
							<span class="weired3">이상하네 #3</span>
							<h3>다 된 프로그램에<br>세미콜론 빠트리기</h3>
							<span></span>
							<span class="item_b3_subimage">
								<img src="/image/common/disappointment.png">
							</span>
						</div>
					</div>
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
			<a class="main_category_icon_link" href="#">
				<div class="main_category_icon_img"><img src="${root}/image/common/cart.png"></div>
				<div class="main_category_icon_title">쇼핑하기</div>
			</a>
		</li>
		<li class="main_category_item">
			<a class="main_category_icon_link" href="#">
				<div class="main_category_icon_img"><img src="${root}/image/common/dimensions.png"></div>
				<div class="main_category_icon_title">평수별집구경</div>
			</a>
		</li>
		<li class="main_category_item">
			<a class="main_category_icon_link" href="photo/photolist.do">
				<div class="main_category_icon_img"><img src="${root}/image/common/sofa.png"></div>
				<div class="main_category_icon_title">공간별사진</div>
			</a>
		</li>
		<li class="main_category_item">
			<a class="main_category_icon_link" href="#">
				<div class="main_category_icon_img"><img src="${root}/image/common/teacher.png"></div>
				<div class="main_category_icon_title">전문가와상담</div>
			</a>
		</li>
		<li class="main_category_item">
			<a class="main_category_icon_link" href="#">
				<div class="main_category_icon_img"><img src="${root}/image/common/question.png"></div>
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
			<c:forEach var="zip" items="${zipList}">
			<li class="main_zip_content">
				<a class="main_zip_content_link">
					<div class="main_zip_image-wrap">
						<img src="${zip.zipImage}">
					</div>
					<div class="main_zip_content-wrap">
						<div class="main_zip_content">
							<div class="main_zip_content_title">${zip.zipTitle}</div>
							<div class="main_zip_content_profile">
								<span class="main_zip_profile_image">${zip.memberImage}</span>
								<span class="main_zip_profile_nickname">${zip.memberNickname}</span>
							</div>
						</div>
					</div>
				</a>
			</li>
			</c:forEach>
			<div class="main_zip_content_menu_wrap">
				<div class="main_zip_content_menu_list">
					<a class="main_zip_content_menu">
						<div class="main_zip_content_menu_description">예쁜 집 구경하기</div>
						<div class="main_zip_content_menu_title">
							<span class="title_text">집들이</span>
							<span class="title_icon">></span>
						</div>
					</a>
					<a class="main_zip_content_menu">
						<div class="main_zip_content_menu_description">인테리어 꿀팀 총 집합</div>
						<div class="main_zip_content_menu_title">
							<span class="title_text">노하우</span>
							<span class="title_icon">></span>
						</div>
					</a>
				</div>
			</div>
		</ul>
	</div>
</section>


<!-- 오늘의 인기사진 -->
<section class="main_photo_wrapper">
	<div class="main_photo_container">
		<header class="main_photo_header">
			<h3 class="main_photo_header_content">오늘의 인기사진</h3>
			<a class="main_photo_header_more" href="photo/photolist.do">더보기</a>
		</header>

		
		<div class="main_photo_list_wrap">
			<ul class="main_photo_list">
				<c:forEach var="photo" items="${photoList}" varStatus="status">
				<li class="main_photo_items">
					<article class="main_photo_item_card">
						<a class="main_photo_item_link">
							<div class="main_photo_item">
								<img src="${photo.photoImage}" onclick="location.href='photo/photodetail.do?num=${photo.photoSeqNo}'">
							</div>
							<div class="main_photo_profile_wrap">
								<div class="main_photo_profile_content">
									<div class="main_photo_profile_item">
										<span class="main_photo_profile_image">${photo.memberImage}</span>
										<span class="main_photo_profile_nickname">${photo.memberNickname}</span>
									</div>
									<div class="main_photo_rank_icon">
										<span class="main_photo_rank_no">${status.count}</span>
									</div>								
								</div>
							</div>				
						</a>
					</article>
				</li>
				</c:forEach>
								<img src="${photo.photoImage}">
							</div>					
						</a>
					</article>
				</li>
  </c:forEach>
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
								<img src="${root}/image/deal01.jpg"></div>
							<div class="img-wrap-info">not yet
							</div>					
						</a>
					</div>
				</li>
				<li class="main_recommends_product_items">
					<div class="main_recommends_pruduct_wrap">
						<a class="main_recommends_product_item">
							<div class="img-wrap-square">
								<img src="${root}/image/deal02.jpg"></div>
							<div class="img-wrap-info">not yet
							</div>					
						</a>
					</div>
				</li>
				<li class="main_recommends_product_items">
					<div class="main_recommends_pruduct_wrap">
						<a class="main_recommends_product_item">
							<div class="img-wrap-square">
								<img src="${root}/image/deal03.jpg"></div>
							<div class="img-wrap-info">not yet
							</div>					
						</a>
					</div>
				</li>
				<li class="main_recommends_product_items">
					<div class="main_recommends_pruduct_wrap">
						<a class="main_recommends_product_item">
							<div class="img-wrap-square">
								<img src="${root}/image/deal04.jpg"></div>
							<div class="img-wrap-info">not yet
							</div>					
						</a>
					</div>
				</li>
				<li class="main_recommends_product_items">
					<div class="main_recommends_pruduct_wrap">
						<a class="main_recommends_product_item">
							<div class="img-wrap-square">
								<img src="${root}/image/deal05.jpg"></div>
							<div class="img-wrap-info">not yet
							</div>					
						</a>
					</div>
				</li>
				<li class="main_recommends_product_items">
					<div class="main_recommends_pruduct_wrap">
						<a class="main_recommends_product_item">
							<div class="img-wrap-square">
								<img src="${root}/image/deal06.jpg"></div>
							<div class="img-wrap-info">not yet
							</div>					
						</a>
					</div>
				</li>
 				<li class="main_recommends_product_items">
					<div class="main_recommends_pruduct_wrap">
						<a class="main_recommends_product_item">
							<div class="img-wrap-square">
								<img src="${root}/image/deal07.jpg"></div>
							<div class="img-wrap-info">not yet
							</div>					
						</a>
					</div>
				</li>
				<li class="main_recommends_product_items">
					<div class="main_recommends_pruduct_wrap">
						<a class="main_recommends_product_item">
							<div class="img-wrap-square">
								<img src="${root}/image/deal08.jpg"></div>
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
<script type="text/javascript" src="${root}/js/main.js"></script>
</body>