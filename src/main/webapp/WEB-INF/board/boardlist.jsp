<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문과 답변</title>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<link rel="stylesheet" type="text/css" href="${root}/css/common.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" media="all"
	href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/bucket_ui/bucket_ui-a69ea26903ba7b7b1e58db706ee621d7fa1695945755178ff07fe330df44fff6.css" />
<link rel="stylesheet" media="screen"
	href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/bucket_ui/components-7c293474cce07a07e4c5740df12838356c5abd5f542add27a47f1ac12c737da4.css" />
<link rel="stylesheet" media="screen"
	href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/layout/application-d819a6efb3afb7a9272381f7f76bd3edd7f2d4e27f2f82b84a7cd52c9b68e261.css" />
<link rel="stylesheet" media="screen"
	href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/bucket_ui/components-7c293474cce07a07e4c5740df12838356c5abd5f542add27a47f1ac12c737da4.css" />
<link rel="stylesheet" media="screen"
	href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/questions/index-1a7920041c9d947e5f6d454aec5b74335960c1570560a32d5720d1cb4d4a6f09.css" />
</head>
<script type="text/javascript">
$(document).ready(function() {
    $("#questions-header__form__search").keydown(function(key) {
        if (key.keyCode == 13) {
        	var url = "list.do?"
				+ "&keyword=" + $('#questions-header__form__search').val();
			window.location.href = url;
        }
    });
});
</script>
<style>
	li{
		padding:10px;
	}
</style>
<body>
	<main role="main" id="root">
	<div id="questions-index-page">
		<section id="questions-header">
			<div class="container">
				<div class="questions-header__title">
					<h1 class="text-heading-1 text-black bold">질문과 답변</h1>
					<p class="text-caption-1">오늘의집 인테리어 고수들과 전문가들에게 조언을 받으세요.</p>
				</div>
					<div class="sticky-content">
						<div class="questions-header__form__wrap row">
							<div class="questions-header__form__search col">
								<span class="icon icon-etc-find-sm-gray-dark search"
									aria-hidden="tru	e"></span> <span
									class="icon icon-pointer-x-bold-gray clear clear-inactive hide"
									aria-hidden="false" role="button"></span> <span
									class="icon icon-pointer-x-bold-dark clear clear-active hide"
									aria-hidden="false" role="button"></span> <input type="text"
									id="questions-header__form__search" value="${vo.keyword}"
									class="form-control" placeholder="궁금한 것을 검색해보세요."
									autocomplete="off" />
							</div>
						</div>
					</div>
			</div>
		</section>
				<div style="display:inline-block;text-align:center;padding:50px;width:1200px;">
					<div class="questions-filter__actions">
						 <a class="questions-filter__actions__new-question btn btn-priority btn-sm"
							href="form.do">질문하기</a>
					</div>
				</div>
<section id="questions-list" class="container">
		<c:forEach var="vo" items="${list}">
				<a class="questions-item__link"
					href="view.do?board_seq_no=${vo.board_seq_no}&pageNum=${currentPage}">
					<article class="questions-item">
						<div class="questions-item__image">
							<div class="image-wrap square">
								<c:if test="${vo.board_image!='board_image'}">
									<c:forTokens var="myimg" items="${vo.board_image}" delims=",">
										<img src="../save/${myimg}" style="max-width: 100px;"
											class="img-thumbnail">
									</c:forTokens>
								</c:if>
							</div>
						</div>
						<h1 class="questions-item__title text-heading-5 bold text-black">${vo.board_title}</h1>
						<p class="questions-item__content text-caption-1">${vo.board_content}</p>
						<footer class="questions-item__footer">
							<span class="questions-item__footer__author"> <span
								class="questions-item__footer__author__image"> <img
									src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-users-profile_images-1562307995_lLddF7bt4f.jpeg/80/80"
									onerror="this.src='https://bucketplace-v2-development.s3.amazonaws.com/uploads/default_images/avatar.png'">
							</span> <span
								class="questions-item__footer__author__content text-caption-1">${vo.member_no}</span>
							</span> <span class="questions-item__footer__meta text-caption-1">
								<time datetime="2019-07-05T16:15:18+09:00"
									class="questions-item__footer__date text-gray"> ${vo.reg_date} </time> <span
								class="questions-item__footer__comments text-gray"> 답글 <span
									class="questions-item__footer__comments__content active">
										${vo.b_reply_count} </span>
							</span> <span class="questions-item__footer__views text-gray"> 조회
									<span class="questions-item__footer__views__content">${vo.board_hits}</span>
							</span>
							</span>
						</footer>
					</article>
				</a>
		</c:forEach>
</section>
<!-- paging -->
<div style="width: 500px;text-align: center;margin:auto;">
	<ul  class="pagination">
		<c:if test="${startPage>1}">
			<li>
				<a href="list.do?pageNum=${startPage-1}&keyword=${keyword}">◀</a>
			</li>
		</c:if>
		<c:forEach var="pp" begin="${startPage}" end="${endPage}">
			<li>
			  <c:if test="${pp==currentPage}">
				<a href="list.do?pageNum=${pp}&keyword=${keyword}" style="color: red;">${pp}</a>
			  </c:if>
			  <c:if test="${pp!=currentPage}">
				<a href="list.do?pageNum=${pp}&keyword=${keyword}" style="color: black;">${pp}</a>
			  </c:if>	
			</li>
		</c:forEach>
		<c:if test="${endPage<totalPage}">	
			<li>
				<a href="list.do?pageNum=${endPage+1}&keyword=${keyword}">▶</a>
			</li>
		</c:if>
	</ul>
</div>
		<div id="questions-filter-sort-modal"
			class="modal fade fade-done modal-filter">
			<div class="modal-dialog" role="document" style="">

				<div class="modal-filter__header">
					<h1>정렬</h1>
					<span class="icon icon-pointer-x-black-lg btn-close"
						aria-hidden="false" role="button" data-dismiss="modal"></span>
				</div>
				<div class="modal-filter__content">
					<ul class="filter-select__list">
						<li class="filter-select__list__entry "><a
							href="/questions?order=popular&amp;page=1">인기순</a></li>
						<li class="filter-select__list__entry active"><a
							href="/questions?order=recent&amp;page=1">최신순</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
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