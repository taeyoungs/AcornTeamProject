<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="../js/main.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<c:set var="root" value="<%=request.getContextPath() %>" />
<body>
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

<!-- Banner -->
	<div id="wrapper">
		<div id="slider-wrap">
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

<!-- Category dimensions-->
<section class="main_category_container">
	<ul class="main_category_wrap">
		<li class="main_category_icon">
			<a class="main_category_icon_link">
			<div class="main_category_icon_img"><img src="../image/cart.png"></div>
			<div class="main_category_icon_title">쇼핑하기</div>
			</a>
		</li>
		<li class="main_category_icon">
			<a class="main_category_icon_link">
			<div class="main_category_icon_img"><img src="../image/dimensions.png"></div>
			<div class="main_category_icon_title">평수별집구경</div>
			</a>
		</li>
		<li class="main_category_icon">
			<a class="main_category_icon_link">
			<div class="main_category_icon_img"><img src="../image/sofa.png"></div>
			<div class="main_category_icon_title">공간별사진</div>
			</a>
		</li>
		<li class="main_category_icon">
			<a class="main_category_icon_link">
			<div class="main_category_icon_img"><img src="../image/teacher.png"></div>
			<div class="main_category_icon_title">전문가와상담</div>
			</a>
		</li>
		<li class="main_category_icon">
			<a class="main_category_icon_link">
			<div class="main_category_icon_img"><img src="../image/question.png"></div>
			<div class="main_category_icon_title">질문과답변</div>
			</a>
		</li>
	</ul>
</section>
<br>
<!-- 오늘의 스토리-->
<section class="main_zip_cantainer">
	<header class="main_zip_header">
		<h2 class="main_zip_header-content">오늘의 스토리</h2>
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
</section>


<!-- 오늘의 인기사진 -->
<section class="main_photo_cantainer">
<header class="main_photo_header">
	<h2 class="main_photo_header-content">오늘의 인기사진</h2>
</header>
</section>

</body>
</html>
