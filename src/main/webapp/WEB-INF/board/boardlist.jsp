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
<body>
	<main role="main" id="root">
	<div id="questions-index-page">
		<section id="questions-header">
			<div class="container">
				<div class="questions-header__title">
					<h1 class="text-heading-1 text-black bold">질문과 답변</h1>
					<p class="text-caption-1">오늘의집 인테리어 고수들과 전문가들에게 조언을 받으세요.</p>
				</div>
				<form id="questions-header__form" class="sticky-top"
					action="/questions" accept-charset="UTF-8" method="get">
					<input name="utf8" type="hidden" value="&#x2713;" />
					<div class="sticky-content">
						<div class="questions-header__form__wrap row">
							<div class="questions-header__form__search col">
								<span class="icon icon-etc-find-sm-gray-dark search"
									aria-hidden="true"></span> <span
									class="icon icon-pointer-x-bold-gray clear clear-inactive hide"
									aria-hidden="false" role="button"></span> <span
									class="icon icon-pointer-x-bold-dark clear clear-active hide"
									aria-hidden="false" role="button"></span> <input type="text"
									name="query" id="questions-header__form__search" value=""
									class="form-control" placeholder="궁금한 것을 검색해보세요."
									autocomplete="off" />
							</div>
						</div>
					</div>
				</form>
				<div class="questions-header__keywords row">
					<input id="questions-header__keywords__toggle"
						class="questions-header__keywords__toggle" type="checkbox" />
					<div class="col">
						<div class="questions-header__keywords__group header">
							<dt class="questions-header__keywords__group__name header bold">인기</dt>
							<dd class="questions-header__keywords__group__list header">
								<ul class="keyword-list">
									<li class="keyword-item" role="button">리모델링/올수리</li>
									<li class="keyword-item" role="button">20평대</li>
									<li class="keyword-item" role="button">아파트</li>
									<li class="keyword-item" role="button">도배</li>
								</ul>
							</dd>
						</div>
						<dl class="questions-header__keywords__all">
							<div class="questions-header__keywords__group">
								<dt class="questions-header__keywords__group__name bold">일반</dt>
								<dd class="questions-header__keywords__group__list">
									<ul class="keyword-list">
										<li class="keyword-item" role="button">리모델링/올수리</li>
										<li class="keyword-item" role="button">견적</li>
										<li class="keyword-item" role="button">업체 추천</li>
										<li class="keyword-item" role="button">셀프인테리어</li>
										<li class="keyword-item" role="button">신혼</li>
										<li class="keyword-item" role="button">리폼</li>
										<li class="keyword-item" role="button">디자인 추천</li>
									</ul>
								</dd>
							</div>
							<div class="questions-header__keywords__group">
								<dt class="questions-header__keywords__group__name bold">부분
									공정</dt>
								<dd class="questions-header__keywords__group__list">
									<ul class="keyword-list">
										<li class="keyword-item" role="button">가벽</li>
										<li class="keyword-item" role="button">단열</li>
										<li class="keyword-item" role="button">도배</li>
										<li class="keyword-item" role="button">마루</li>
										<li class="keyword-item" role="button">목공</li>
										<li class="keyword-item" role="button">몰딩</li>
										<li class="keyword-item" role="button">바닥</li>
										<li class="keyword-item" role="button">벽</li>
										<li class="keyword-item" role="button">붙박이</li>
										<li class="keyword-item" role="button">샷시/창호</li>
										<li class="keyword-item" role="button">수리/복구</li>
										<li class="keyword-item" role="button">실리콘</li>
										<li class="keyword-item" role="button">외관/외벽</li>
										<li class="keyword-item" role="button">입주청소</li>
										<li class="keyword-item" role="button">장판</li>
										<li class="keyword-item" role="button">전기</li>
										<li class="keyword-item" role="button">조명</li>
										<li class="keyword-item" role="button">줄눈</li>
										<li class="keyword-item" role="button">천장</li>
										<li class="keyword-item" role="button">철거</li>
										<li class="keyword-item" role="button">콘센트</li>
										<li class="keyword-item" role="button">타일</li>
										<li class="keyword-item" role="button">페인트</li>
										<li class="keyword-item" role="button">필름</li>
										<li class="keyword-item" role="button">기타공정</li>
										<li class="keyword-item" role="button">기타청소</li>
									</ul>
								</dd>
							</div>
							<div class="questions-header__keywords__group">
								<dt class="questions-header__keywords__group__name bold">가구</dt>
								<dd class="questions-header__keywords__group__list">
									<ul class="keyword-list">
										<li class="keyword-item" role="button">가구배치/이동</li>
										<li class="keyword-item" role="button">냉장고</li>
										<li class="keyword-item" role="button">블라인드</li>
										<li class="keyword-item" role="button">손잡이</li>
										<li class="keyword-item" role="button">수전/싱크대</li>
										<li class="keyword-item" role="button">소파</li>
										<li class="keyword-item" role="button">식탁</li>
										<li class="keyword-item" role="button">유리</li>
										<li class="keyword-item" role="button">에어컨</li>
										<li class="keyword-item" role="button">침대</li>
										<li class="keyword-item" role="button">TV</li>
										<li class="keyword-item" role="button">기타가구</li>
									</ul>
								</dd>
							</div>
							<div class="questions-header__keywords__group">
								<dt class="questions-header__keywords__group__name bold">공간</dt>
								<dd class="questions-header__keywords__group__list">
									<ul class="keyword-list">
										<li class="keyword-item" role="button">단독주택</li>
										<li class="keyword-item" role="button">아파트</li>
										<li class="keyword-item" role="button">상가</li>
										<li class="keyword-item" role="button">원룸</li>
									</ul>
								</dd>
							</div>
							<div class="questions-header__keywords__group">
								<dt class="questions-header__keywords__group__name bold">평수</dt>
								<dd class="questions-header__keywords__group__list">
									<ul class="keyword-list">
										<li class="keyword-item" role="button">10평미만</li>
										<li class="keyword-item" role="button">10평대</li>
										<li class="keyword-item" role="button">20평대</li>
										<li class="keyword-item" role="button">30평대</li>
										<li class="keyword-item" role="button">40평대</li>
										<li class="keyword-item" role="button">50평이상</li>
									</ul>
								</dd>
							</div>
							<div class="questions-header__keywords__group">
								<dt class="questions-header__keywords__group__name bold">실내
									공간</dt>
								<dd class="questions-header__keywords__group__list">
									<ul class="keyword-list">
										<li class="keyword-item" role="button">화장실</li>
										<li class="keyword-item" role="button">베란다</li>
										<li class="keyword-item" role="button">거실</li>
										<li class="keyword-item" role="button">주방</li>
										<li class="keyword-item" role="button">현관</li>
									</ul>
								</dd>
							</div>
							<div class="questions-header__keywords__group">
								<dt class="questions-header__keywords__group__name bold">기타</dt>
								<dd class="questions-header__keywords__group__list">
									<ul class="keyword-list">
										<li class="keyword-item" role="button">기타</li>
									</ul>
								</dd>
							</div>
						</dl>
					</div>
					<div id="questions-header__keywords__fold"
						class="questions-header__keywords__fold col">
						<div class="sticky-bottom">
							<div class="sticky-content">
								<label for="questions-header__keywords__toggle"
									class="questions-header__keywords__fold__button text-caption-1 bold"
									role="button"> <span class="active">키워드 접기</span> <span
									class="inactive">키워드 더보기</span> <span
									class="icon icon-pointer-angle-down-dark-sm"></span>
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section id="questions-filter" class="sticky-top">
			<div class="questions-filter__float sticky-content">
				<div class="questions-filter__content container">
					<div class="questions-filter__filters">
						<div class="filter-select" id='questions-filter-sort'
							data-modal-id="questions-filter-sort-modal">
							<dl class="filter-select__header" role="button">
								<dt class="filter-select__header__name">
									정렬<span class="icon icon-pointer-angle-down-dark-sm"></span>
								</dt>
								<dd class="filter-select__header__value">최신순</dd>
							</dl>
							<ul class="filter-select__list">
								<li class="filter-select__list__entry "><a
									href="/questions?order=popular&amp;page=1">인기순</a></li>
								<li class="filter-select__list__entry active"><a
									href="/questions?order=recent&amp;page=1">최신순</a></li>
							</ul>
						</div>
					</div>
					<div class="questions-filter__actions">
						<a class="set-reply btn btn-normal btn-sm"
							href="/questions?page=1&amp;reply=not_yet"> 답변을 기다리는 질문 </a> <a
							class="questions-filter__actions__new-question btn btn-priority btn-sm"
							href="form.do">질문하기</a>
					</div>
				</div>
			</div>
		</section>
		<section id="questions-notice-list" class="container">
    		<ol class="questions-notice-list__list">
        		<li class="questions-notice-list__list__entry">
           				<span class="icon icon-etc-announcement-md"></span>
            			<span class="title text-body-1">[공지] 쇼핑 포인트 5배! 7월 멘토 모집 마감</span>
               	</li>
   			</ol>
  		</section>
		<c:forEach var="vo" items="${list}">
			<section id="questions-list" class="container">
				<a class="questions-item__link"
					href="view.do?board_seq_no=${vo.board_seq_no}&pageNum=${currentPage}">
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
										4 </span>
							</span> <span class="questions-item__footer__views text-gray"> 조회
									<span class="questions-item__footer__views__content">${vo.board_hits}</span>
							</span>
							</span>
							<ul class="questions-item__footer__tags keyword-list">
								<li
									class="keyword-item questions-item__footer__tags__tag
                  "
									role="button">단독주택</li>
								<li
									class="keyword-item questions-item__footer__tags__tag
                  "
									role="button">10평미만</li>
							</ul>
						</footer>
					</article>
				</a>
			</section>
		</c:forEach>
<!-- paging -->
<div style="width: 500px;text-align: center;margin:auto;">
	<ul  class="pagination">
		<c:if test="${startPage>1}">
			<li>
				<a href="list.do?pageNum=${startPage-1}">◀</a>
			</li>
		</c:if>
		<c:forEach var="pp" begin="${startPage}" end="${endPage}">
			<li>
			  <c:if test="${pp==currentPage}">
				<a href="list.do?pageNum=${pp}" style="color: red;">${pp}</a>
			  </c:if>
			  <c:if test="${pp!=currentPage}">
				<a href="list.do?pageNum=${pp}" style="color: black;">${pp}</a>
			  </c:if>	
			</li>
		</c:forEach>
		<c:if test="${endPage<totalPage}">	
			<li>
				<a href="list.do?pageNum=${endPage+1}">▶</a>
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