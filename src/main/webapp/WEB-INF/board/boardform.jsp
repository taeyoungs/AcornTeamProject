<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문하기</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" media="all"
	href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/bucket_ui/bucket_ui-a69ea26903ba7b7b1e58db706ee621d7fa1695945755178ff07fe330df44fff6.css" />
<link rel="stylesheet" media="screen"
	href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/layout/application_simplified-ef1cf9c9395fe6987ee44bfe7ab7cf334c376dc3c2db6bb4c660a6fc24a78573.css" />
<link rel="stylesheet" media="screen"
	href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/bucket_ui/components-7c293474cce07a07e4c5740df12838356c5abd5f542add27a47f1ac12c737da4.css" />
<link rel="stylesheet" media="all"
	href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/questions/form-c1e69dbad62423e4b4d5169be1770bf2c43d515bd876ab236cf00d75c062fbf0.css" />
</head>
<body>
	<!-- Google Tag Manager (noscript) -->
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-MK8DN2Q"
			height="0" width="0" style="display: none; visibility: hidden"
			allowfullscreen></iframe>
	</noscript>
	<!-- End Google Tag Manager (noscript) -->

	<header id="simplified-gnb" class="simplified-gnb">
		<div class="container simplified-gnb__container">
			<a class="simplified-gnb__logo" href="https://ohou.se/"> <span
				class="icon icon-etc-brand-icon-n-bi-md" aria-hidden="true"></span>
			</a>
		</div>
	</header>
	<main role="main">
	<div class="question-form container">
		<form id="question-form" class="new_question" action="/questions"
			accept-charset="UTF-8" method="post">
			<input name="utf8" type="hidden" value="&#x2713;" /><input
				type="hidden" name="authenticity_token"
				value="Gy52HTDlOfJruNezTBxxxLUNEbQn3YTKcTbGoKC2oNKhutW3Foh45s3jlXXHyzXNVk5/yKC5Hg8HCHTVd483rw==" />
			<header class="question-form__header">
				<h2 class="question-form__header__heading text-black bold">질문하기</h2>
				<div class="question-form__cs">
					상품구매, 배송 관련 문의가 필요하시다면 <a class="question-form__cs__link"
						href="/contact_us">문의하러 가기</a>
				</div>
				<div class="question-form__header__title form-group">
					<input placeholder="제목을 적어주세요." class="form-control" maxlength="61"
						size="1" type="text" name="board_title" id="question_title" />
					<p class="error">제목을 7자 이상으로 적어주세요.</p>
				</div>

			</header>
			<div class="question-form__meta">
				<div class="question-form__meta__content">

					<div class="question-form__meta__content__entry empty">
						<input class="content_type" type="hidden" value="text"
							name="question[question_contents_attributes][0][content_type]"
							id="question_question_contents_attributes_0_content_type" /> <input
							class="content" placeholder="image_url or text" type="hidden"
							name="question[question_contents_attributes][0][content]"
							id="question_question_contents_attributes_0_content" /> <input
							class="position" type="hidden" value="0"
							name="question[question_contents_attributes][0][position]"
							id="question_question_contents_attributes_0_position" /> <input
							class="width" type="hidden" value="0"
							name="question[question_contents_attributes][0][width]"
							id="question_question_contents_attributes_0_width" /> <input
							class="height" type="hidden" value="0"
							name="question[question_contents_attributes][0][height]"
							id="question_question_contents_attributes_0_height" />
					</div>
				</div>
				<input class="keywords" type="hidden" name="question[keywords]"
					id="question_keywords" />
			</div>
			<section class="question-form__body">
				<div class="question-form__body__content form-group">
					<div class="question-form__body__content__wrap">
						<div class="question-form__body__content__input"
							contenteditable="true" tabindex="0"></div>
						<div class="question-form__body__content__placeholder">
							내용을 적어주세요.<br>참고가 되는 사진을 같이 공유해주시면 더 좋은 답변을 얻을 수 있습니다.
							<div class="question-form__body__content__placeholder__cs">
								※ 비슷한 어려움을 겪는 유저를 위해 답변자에게 포인트를 지급하며, 답변이 달린 질문글은 삭제할 수 없습니다.<br>
								※ 인테리어와 관련 없는 질문은 숨김 및 삭제될 수 있습니다.
							</div>
						</div>
						<div class="question-form__body__content__delete hide">
							<button class="question-form__body__content__delete__button">
								<span class="icon icon-pointer-x-white"></span>
							</button>
						</div>
						<div id="question-form__body__photo"
							class="question-form__body__photo sticky-top">
							<div class="question-form__body__photo__wrap sticky-content">
								<button class="question-form__body__photo__button">
									<span class="icon icon-etc-camera-white-sm"></span><br> 사진
									추가
								</button>
							</div>
						</div>
					</div>
					<p class="error">궁금한 내용을 텍스트로 적어주세요.</p>
				</div>
			</section>
			<section class="question-form__keywords form-group">
				<div class="question-form__keywords__wrap">
					<div class="question-form__keywords__list__wrap keyword-list">
						<ul class="question-form__keywords__list">
							<li
								class="question-form__keywords__keyword keyword-item template"><span
								class="question-form__keywords__keyword__name"></span>
								<button class="question-form__keywords__keyword__delete">
									<span class="icon icon-pointer-x-sm inactive"></span> <span
										class="icon icon-pointer-x-solid-md active"></span>
								</button></li>
						</ul>
						<button
							class="question-form__keywords__keyword question-form__keywords__keyword--new keyword-item
                        
                        hint">
							<span class="question-form__keywords__keyword__name">키워드를
								입력해주세요.</span> <span
								class="question-form__keywords__keyword__name--hint">클릭하여
								주요 키워드를 입력해주세요.</span>
						</button>
						<p class="error">키워드는 1개 이상 입력해주세요.</p>
					</div>
					<div class="question-form__keywords__counter">
						<span class="question-form__keywords__counter__current">0</span>개<span
							class="question-form__keywords__counter__divider"></span>최대 <span
							class="question-form__keywords__counter__max">5</span>개
					</div>
				</div>
			</section>
			<footer class="question-form__footer">
				<div class="question-form__footer__submit row">
					<input type="submit" name="commit" value="질문 저장하기"
						class="btn btn-lg btn-priority col-6 offset-3" />
				</div>
			</footer>
		</form>
	</div>

	<section id="question-form__floating"
		class="floating-bar static sticky-bottom">
		<div
			class="floating-bar__content sticky-content question-form__floating">
			<div class="question-form__floating__buttons">
				<button class="question-form__floating__photo-btn btn btn-priority">
					<span class="icon icon-etc-camera-white-sm"></span> 사진 추가
				</button>
				<button class="question-form__floating__save-btn btn btn-light">질문
					저장하기</button>
			</div>
		</div>
	</section>

	<div id="modal-tag-select" class="modal fade fade-done">
		<div class="modal-dialog" role="document" style="">

			<div class="modal-tag-select__wrap">
				<header class="modal-tag-select__header">
					<h2 class="modal-tag-select__header__name text-black bold">
						키워드 선택 <span class="modal-tag-select__header__name__tip">(최대
							5개 선택 가능)</span>
					</h2>
					<div class="modal-tag-select__header__search row">
						<div class="modal-tag-select__header__search__input col">
							<span class="icon icon-etc-find-sm-gray search"
								aria-hidden="true"></span> <span
								class="icon icon-pointer-x-bold-gray clear clear-inactive"
								aria-hidden="false" role="button"></span> <span
								class="icon icon-pointer-x-bold-dark clear clear-active"
								aria-hidden="false" role="button"></span> <input type="text"
								class="form-control"
								id="modal-tag-select__header__search__input"
								placeholder="원하는 키워드를 검색해보세요." autocomplete="off">
						</div>
						<button class="btn btn-sm btn-normal">검색</button>
					</div>
				</header>
				<dl class="modal-tag-select__groups">
					<dt class="modal-tag-select__groups__name text-black bold">일반</dt>
					<dd class="modal-tag-select__groups__list">
						<ul class="row">
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="리모델링/올수리"> <span
									class="check-img"></span> <span class="value">리모델링/올수리</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="견적"> <span
									class="check-img"></span> <span class="value">견적</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="업체 추천"> <span
									class="check-img"></span> <span class="value">업체 추천</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="셀프인테리어"> <span
									class="check-img"></span> <span class="value">셀프인테리어</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="신혼"> <span
									class="check-img"></span> <span class="value">신혼</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="리폼"> <span
									class="check-img"></span> <span class="value">리폼</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="디자인 추천"> <span
									class="check-img"></span> <span class="value">디자인 추천</span>
							</label>
							</li>
						</ul>
					</dd>
					<dt class="modal-tag-select__groups__name text-black bold">부분
						공정</dt>
					<dd class="modal-tag-select__groups__list">
						<ul class="row">
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="가벽"> <span
									class="check-img"></span> <span class="value">가벽</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="단열"> <span
									class="check-img"></span> <span class="value">단열</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="도배"> <span
									class="check-img"></span> <span class="value">도배</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="마루"> <span
									class="check-img"></span> <span class="value">마루</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="목공"> <span
									class="check-img"></span> <span class="value">목공</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="몰딩"> <span
									class="check-img"></span> <span class="value">몰딩</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="바닥"> <span
									class="check-img"></span> <span class="value">바닥</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="벽"> <span
									class="check-img"></span> <span class="value">벽</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="붙박이"> <span
									class="check-img"></span> <span class="value">붙박이</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="샷시/창호"> <span
									class="check-img"></span> <span class="value">샷시/창호</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="수리/복구"> <span
									class="check-img"></span> <span class="value">수리/복구</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="실리콘"> <span
									class="check-img"></span> <span class="value">실리콘</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="외관/외벽"> <span
									class="check-img"></span> <span class="value">외관/외벽</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="입주청소"> <span
									class="check-img"></span> <span class="value">입주청소</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="장판"> <span
									class="check-img"></span> <span class="value">장판</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="전기"> <span
									class="check-img"></span> <span class="value">전기</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="조명"> <span
									class="check-img"></span> <span class="value">조명</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="줄눈"> <span
									class="check-img"></span> <span class="value">줄눈</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="천장"> <span
									class="check-img"></span> <span class="value">천장</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="철거"> <span
									class="check-img"></span> <span class="value">철거</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="콘센트"> <span
									class="check-img"></span> <span class="value">콘센트</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="타일"> <span
									class="check-img"></span> <span class="value">타일</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="페인트"> <span
									class="check-img"></span> <span class="value">페인트</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="필름"> <span
									class="check-img"></span> <span class="value">필름</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="기타공정"> <span
									class="check-img"></span> <span class="value">기타공정</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="기타청소"> <span
									class="check-img"></span> <span class="value">기타청소</span>
							</label>
							</li>
						</ul>
					</dd>
					<dt class="modal-tag-select__groups__name text-black bold">가구</dt>
					<dd class="modal-tag-select__groups__list">
						<ul class="row">
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="가구배치/이동"> <span
									class="check-img"></span> <span class="value">가구배치/이동</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="냉장고"> <span
									class="check-img"></span> <span class="value">냉장고</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="블라인드"> <span
									class="check-img"></span> <span class="value">블라인드</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="손잡이"> <span
									class="check-img"></span> <span class="value">손잡이</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="수전/싱크대"> <span
									class="check-img"></span> <span class="value">수전/싱크대</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="소파"> <span
									class="check-img"></span> <span class="value">소파</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="식탁"> <span
									class="check-img"></span> <span class="value">식탁</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="유리"> <span
									class="check-img"></span> <span class="value">유리</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="에어컨"> <span
									class="check-img"></span> <span class="value">에어컨</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="침대"> <span
									class="check-img"></span> <span class="value">침대</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="TV"> <span
									class="check-img"></span> <span class="value">TV</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="기타가구"> <span
									class="check-img"></span> <span class="value">기타가구</span>
							</label>
							</li>
						</ul>
					</dd>
					<dt class="modal-tag-select__groups__name text-black bold">공간</dt>
					<dd class="modal-tag-select__groups__list">
						<ul class="row">
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="단독주택"> <span
									class="check-img"></span> <span class="value">단독주택</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="아파트"> <span
									class="check-img"></span> <span class="value">아파트</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="상가"> <span
									class="check-img"></span> <span class="value">상가</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="원룸"> <span
									class="check-img"></span> <span class="value">원룸</span>
							</label>
							</li>
						</ul>
					</dd>
					<dt class="modal-tag-select__groups__name text-black bold">평수</dt>
					<dd class="modal-tag-select__groups__list">
						<ul class="row">
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="10평미만"> <span
									class="check-img"></span> <span class="value">10평미만</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="10평대"> <span
									class="check-img"></span> <span class="value">10평대</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="20평대"> <span
									class="check-img"></span> <span class="value">20평대</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="30평대"> <span
									class="check-img"></span> <span class="value">30평대</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="40평대"> <span
									class="check-img"></span> <span class="value">40평대</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="50평이상"> <span
									class="check-img"></span> <span class="value">50평이상</span>
							</label>
							</li>
						</ul>
					</dd>
					<dt class="modal-tag-select__groups__name text-black bold">실내
						공간</dt>
					<dd class="modal-tag-select__groups__list">
						<ul class="row">
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="화장실"> <span
									class="check-img"></span> <span class="value">화장실</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="베란다"> <span
									class="check-img"></span> <span class="value">베란다</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="거실"> <span
									class="check-img"></span> <span class="value">거실</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="주방"> <span
									class="check-img"></span> <span class="value">주방</span>
							</label>
							</li>
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="현관"> <span
									class="check-img"></span> <span class="value">현관</span>
							</label>
							</li>
						</ul>
					</dd>
					<dt class="modal-tag-select__groups__name text-black bold">기타</dt>
					<dd class="modal-tag-select__groups__list">
						<ul class="row">
							<li class="modal-tag-select__groups__list__item col form-check">
								<label class="form-check-label"> <input
									class="form-check" type="checkbox" value="기타"> <span
									class="check-img"></span> <span class="value">기타</span>
							</label>
							</li>
						</ul>
					</dd>
				</dl>
			</div>
			<footer class="modal-tag-select__footer">
				<button class="btn btn-md btn-md-lg btn-dismiss" type="button"
					data-dismiss="modal">취소</button>
				<button
					class="modal-tag-select__footer__apply btn btn-md btn-md-lg btn-priority"
					type="button">선택 완료</button>
			</footer>

		</div>
	</div>


	</main>
	<div id="modal-root"></div>
	<div id="toast-message-root"></div>

	<div id="flash_messages"></div>



	<script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>

	<script>
    if (!wcs_add) var wcs_add = {};
    wcs_add['wa'] = 's_2e85116be219';
    if (!_nasa) var _nasa = {};
    wcs.inflow();
    wcs_do(_nasa);
  </script>

	<script type="text/javascript" charset="UTF-8"
		src="//t1.daumcdn.net/adfit/static/kp.js"></script>
	<script>
      kakaoPixel('7919701595446099671').pageView();
    </script>



	<script>
    if (BucketUtils.easter !== undefined) {
      BucketUtils.easter();
    }
  </script>
</body>
</html>