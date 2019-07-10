<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<link rel="stylesheet" type="text/css" href="${root}/css/writelist.css">
<link rel="stylesheet" type="text/css" href="${root}/css/common.css">
<script type="text/javascript" src="${root}/js/writelist.js"></script>
</head>
<body>
	<main role="main">
		<section class="container upload-types">
			<h2 style="font-weight: bold; font-size: 30px;">글쓰기</h2>
			<div class="row">
				<section class="upload-types_item_wrap">
					<a href="${root}/photo/photowrite.do" class="upload-types_item upload-types_item_photo">
						<div class="upload-types_item_pictogram">
							<div class="upload-types_item_pictogram_contents">
								<img src="${root}/image/common/camera.png" style="width: 70px;">
								<p>사진</p>
							</div>
						</div>
						<p class="upload-types_item_caption">예쁜 집 사진을 공유해서 많은 사람들에게 영감을 주세요.</p>
					</a>
				</section>
				<section class="upload-types_item_wrap">
					<a href="" class="upload-types_item upload-types_item_project">
						<div class="upload-types_item_pictogram">
							<div class="upload-types_item_pictogram_contents">
								<img src="${root}/image/common/zipdle.png" style="width: 70px;">
								<p>집들이</p>
							</div>
						</div>
						<p class="upload-types_item_caption">여러분의 집 인테리어 스토리를 사진 여러장과 함께 자랑하세요.</p>
					</a>
				</section>
				<section class="upload-types_item_wrap">
					<a href="" class="upload-types_item upload-types_item_review">
						<div class="upload-types_item_pictogram">
							<div class="upload-types_item_pictogram_contents">
								<img src="${root}/image/common/engineer.png" style="width: 70px;">
								<p>전문가 상담/리뷰</p>
							</div>
						</div>
						<p class="upload-types_item_caption">전문가와 상담 일정을 잡으시고 리뷰를 남겨주세요.</p>
					</a>
				</section>
				<section class="upload-types_item_wrap">
					<a href="${root}/board/form.do" class="upload-types_item upload-types_item_qna">
						<div class="upload-types_item_pictogram">
							<div class="upload-types_item_pictogram_contents">
								<img src="${root}/image/common/question mark.png" style="width: 70px;">
								<p>질문하기</p>
							</div>							
						</div>
						<p class="upload-types_item_caption">인테리어 고수들과 전문가들에게 질문을 해보세요.</p>
					</a>
				</section>
			</div>
		</section>
	
	</main>
	
<footer class="footer">
	<div class="footer_content_wrapper">
		<div class="footer_cs_wrapper">
			<p class="footer_cs">
				<b><a class="footer_customer_center">고객센터 ></a></b>
				<br>
				<strong><a class="footer_customer_center_tel">1588-1234</a></strong>
				<br>
				근무시간 10:00 - 18:00 ( 평일 점심시간 주말 공휴일 제외 )
			</p>
		</div>
		
		<div class="footer_outbound">
		
		</div>
		
		<div class="short_cuts">
			<a class="short_cuts_items">상호명:(주)혼자하는인테리어</a>
			<a class="short_cuts_items" href="mailto:sowon7912@gmail.com">이메일:sowon7912@gmail.com</a>
			<a class="short_cuts_items">대표이사:박소원</a>
			<a class="short_cuts_items">사업자 등록번호:880621-2</a>
		</div>
		<div class="footer_address">
			<span class="footer_address_item">주소 : 서울특별시 강남구 역삼동 강남대로94길 20</span>
		</div>
	</div>
</footer>
</body>
</html>