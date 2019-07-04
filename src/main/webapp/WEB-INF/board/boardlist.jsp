<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문과 답변</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="../css/board/board.css">
<link rel="stylesheet" media="all" href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/bucket_ui/bucket_ui-a69ea26903ba7b7b1e58db706ee621d7fa1695945755178ff07fe330df44fff6.css" />
<link rel="stylesheet" media="screen" href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/bucket_ui/components-7c293474cce07a07e4c5740df12838356c5abd5f542add27a47f1ac12c737da4.css" />
<link rel="stylesheet" media="screen" href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/layout/application-d819a6efb3afb7a9272381f7f76bd3edd7f2d4e27f2f82b84a7cd52c9b68e261.css" />
<link rel="stylesheet" media="screen" href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/bucket_ui/components-7c293474cce07a07e4c5740df12838356c5abd5f542add27a47f1ac12c737da4.css" />
<link rel="stylesheet" media="screen" href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/questions/index-1a7920041c9d947e5f6d454aec5b74335960c1570560a32d5720d1cb4d4a6f09.css" />
</head>
<body>
<main role="main" id="root">
<div id="questions-index-page">
  <section id="questions-header">
    <div class="container">
      <div class="questions-header__title">
        <h1 class="text-heading-1 text-black bold">
          질문과 답변
        </h1>
        <p class="text-caption-1">
          오늘의집 인테리어 고수들과 전문가들에게 조언을 받으세요.
        </p>
      </div>
      <form id="questions-header__form" class="sticky-top" action="/questions" accept-charset="UTF-8" method="get"><input name="utf8" type="hidden" value="&#x2713;" />
        <div class="sticky-content">
          <div class="questions-header__form__wrap row">
            <div class="questions-header__form__search col">
              <span class="icon icon-etc-find-sm-gray-dark search" aria-hidden="true"></span>
              <span class="icon icon-pointer-x-bold-gray clear clear-inactive hide" aria-hidden="false" role="button"></span>
              <span class="icon icon-pointer-x-bold-dark clear clear-active hide" aria-hidden="false" role="button"></span>
              <input type="text" name="query" id="questions-header__form__search" value="" class="form-control" placeholder="궁금한 것을 검색해보세요." autocomplete="off" />
            </div>
          </div>
        </div>
</form>      <div class="questions-header__keywords row">
        <input id="questions-header__keywords__toggle" class="questions-header__keywords__toggle" type="checkbox"/>
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
                <dt class="questions-header__keywords__group__name bold">부분 공정</dt>
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
                <dt class="questions-header__keywords__group__name bold">실내 공간</dt>
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
                     class="questions-header__keywords__fold__button text-caption-1 bold" role="button">
                <span class="active">키워드 접기</span>
                <span class="inactive">키워드 더보기</span>
                <span class="icon icon-pointer-angle-down-dark-sm"></span>
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
          <div class="filter-select" id='questions-filter-sort' data-modal-id="questions-filter-sort-modal">
            <dl class="filter-select__header" role="button">
              <dt class="filter-select__header__name">
                정렬<span class="icon icon-pointer-angle-down-dark-sm"></span>
              </dt>
              <dd class="filter-select__header__value">최신순</dd>
            </dl>
            <ul class="filter-select__list">
                <li class="filter-select__list__entry ">
                  <a href="/questions?order=popular&amp;page=1">인기순</a>
                </li>
                <li class="filter-select__list__entry active">
                  <a href="/questions?order=recent&amp;page=1">최신순</a>
                </li>
            </ul>
          </div>
        </div>
        <div class="questions-filter__actions">
            <a class="set-reply btn btn-normal btn-sm" href="/questions?page=1&amp;reply=not_yet">
              답변을 기다리는 질문
</a>          <a class="questions-filter__actions__new-question btn btn-priority btn-sm" href="form.do">질문하기</a>
        </div>
      </div>
    </div>
  </section>
  <section id="questions-list" class="container">
      <a class="questions-item__link" href="/questions/11688?affect_id=0&amp;affect_type=QuestionIndex&amp;query=">
        <article class="questions-item">
            <div class="questions-item__image">
              <div class="image-wrap square">
                <img src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-snapshots-1562218333_K5m.jpeg/320/320">
              </div>
            </div>
          <h1 class="questions-item__title text-heading-5 bold text-black">방구조가 옛날구조라~~</h1>
          <p class="questions-item__content text-caption-1">방구조가 옛날 구조라서 침대랑 거울 옷걸이 찜한거 있는데 확장 안 하고 할려니  구조를 어떻게 배치해야 되는지??</p>
          <footer class="questions-item__footer">
            <span class="questions-item__footer__author">
                <span class="questions-item__footer__author__image">
                    <img src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-users-profile_images-1561811551_gqmWrsclR.jpeg/80/80"
                         onerror="this.src='https://bucketplace-v2-development.s3.amazonaws.com/uploads/default_images/avatar.png'">
                </span>
                <span class="questions-item__footer__author__content text-caption-1">김혜옥91</span>
            </span>
            <span class="questions-item__footer__meta text-caption-1">
              <time datetime="2019-07-04T14:32:22+09:00" class="questions-item__footer__date text-gray">
                5분 전
              </time>
              <span class="questions-item__footer__comments text-gray">
                답글
                <span class="questions-item__footer__comments__content ">
                  0
                </span>
              </span>
              <span class="questions-item__footer__views text-gray">
                조회
                <span class="questions-item__footer__views__content">3</span>
              </span>
            </span>
            <ul class="questions-item__footer__tags keyword-list">
                <li class="keyword-item questions-item__footer__tags__tag
                  "
                  role="button">페인트</li>
                <li class="keyword-item questions-item__footer__tags__tag
                  "
                  role="button">가구배치/이동</li>
                <li class="keyword-item questions-item__footer__tags__tag
                  "
                  role="button">침대</li>
                <li class="keyword-item questions-item__footer__tags__tag
                  "
                  role="button">아파트</li>
                <li class="keyword-item questions-item__footer__tags__tag
                  "
                  role="button">30평대</li>
            </ul>
          </footer>
        </article>
</a>      <a class="questions-item__link" href="/questions/11687?affect_id=0&amp;affect_type=QuestionIndex&amp;query=">
        <article class="questions-item">
            <div class="questions-item__image">
              <div class="image-wrap square">
                <img src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-snapshots-1562207947_fL20X0LU.jpeg/320/320">
              </div>
            </div>
          <h1 class="questions-item__title text-heading-5 bold text-black">인테리어 도와주세요</h1>
          <p class="questions-item__content text-caption-1">엊그제 이사온 신혼부부이구요, 전세집입니다지난번 집은 화이트,그레이톤 집이었어서 그레이톤 가구가 잘 어울렸었는데 이번집에는 안어울리네요ㅠ특히 바닥이 마루가 아니라 진한 우드톤 장판이고, 도배도 깨끗하진 않지만 새로할 정도는 아니라고 집주인분이 안바꿔주셨어요......2~4년 거주예정인데 몰딩 등 시트지작업 같은부분은 주인과 협의가 안돼서 힘들거 같아요ㅠ결국 이상태 그대로에서 가구나 러그 등으로 가려야 할듯 합니다최대한 장판 신경안쓰이게 인테리어 하고 싶어요조언구하는 부분은..1. 거실 러그를 어떤걸로 해야 붕뜨는 느낌없이 어울릴지2. 소파 맞은편 벽에 높지않은 책장을 구매해서 나무몰딩 전까지 배치할 예정인데 어떤 색,디자인이 예쁠지 3. 부엌바닥에 아일랜드식탁 들어낸 자리에 장판이 저렇게 돼 있는데ㅠㅠ식탁쪽에 대형 러그를 깔아서 가릴지, 아니면 전체에 카펫타일을 셀프시공하는건 어떨지, 한다면 색상은 그레이, 베이지, 그외 색상 어떤게 좋을지입니다고수님들 많은 조언부탁드릴게요!!</p>
          <footer class="questions-item__footer">
            <span class="questions-item__footer__author">
                <span class="questions-item__footer__author__image">
                    <img src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-users-profile_images-1562193391_jCf.jpeg/80/80"
                         onerror="this.src='https://bucketplace-v2-development.s3.amazonaws.com/uploads/default_images/avatar.png'">
                </span>
                <span class="questions-item__footer__author__content text-caption-1">리이이즈</span>
            </span>
            <span class="questions-item__footer__meta text-caption-1">
              <time datetime="2019-07-04T11:39:17+09:00" class="questions-item__footer__date text-gray">
                2시간 전
              </time>
              <span class="questions-item__footer__comments text-gray">
                답글
                <span class="questions-item__footer__comments__content active">
                  2
                </span>
              </span>
              <span class="questions-item__footer__views text-gray">
                조회
                <span class="questions-item__footer__views__content">41</span>
              </span>
            </span>
            <ul class="questions-item__footer__tags keyword-list">
                <li class="keyword-item questions-item__footer__tags__tag
                  "
                  role="button">셀프인테리어</li>
                <li class="keyword-item questions-item__footer__tags__tag
                  "
                  role="button">신혼</li>
                <li class="keyword-item questions-item__footer__tags__tag
                  "
                  role="button">바닥</li>
                <li class="keyword-item questions-item__footer__tags__tag
                  "
                  role="button">장판</li>
                <li class="keyword-item questions-item__footer__tags__tag
                  "
                  role="button">30평대</li>
            </ul>
          </footer>
        </article>
</a>      <a class="questions-item__link" href="/questions/11686?affect_id=0&amp;affect_type=QuestionIndex&amp;query=">
        <article class="questions-item">
            <div class="questions-item__image">
              <div class="image-wrap square">
                <img src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-snapshots1562207813_WfaA4.jpeg/320/320">
              </div>
            </div>
          <h1 class="questions-item__title text-heading-5 bold text-black">천장도배 우는현상 조언</h1>
          <p class="questions-item__content text-caption-1">지난주 토요일에 이사오기전에 도배 했는데요3일만에 천정한쪽이 우글우글 난리났어요 점점 더 심해지는중인데만져보면 완전히 말라있고요지금은 이사진보다 더 심하게울었어요 ㅜㅜ 이거 왜이러는거에요?</p>
          <footer class="questions-item__footer">
            <span class="questions-item__footer__author">
                <span class="questions-item__footer__author__image">
                    <img src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-users-profile_images1559745152_7l5NGBUJ9.jpeg/80/80"
                         onerror="this.src='https://bucketplace-v2-development.s3.amazonaws.com/uploads/default_images/avatar.png'">
                </span>
                <span class="questions-item__footer__author__content text-caption-1">dy.son</span>
            </span>
            <span class="questions-item__footer__meta text-caption-1">
              <time datetime="2019-07-04T11:36:56+09:00" class="questions-item__footer__date text-gray">
                3시간 전
              </time>
              <span class="questions-item__footer__comments text-gray">
                답글
                <span class="questions-item__footer__comments__content active">
                  3
                </span>
              </span>
              <span class="questions-item__footer__views text-gray">
                조회
                <span class="questions-item__footer__views__content">22</span>
              </span>
            </span>
            <ul class="questions-item__footer__tags keyword-list">
                <li class="keyword-item questions-item__footer__tags__tag
                  "
                  role="button">도배</li>
            </ul>
          </footer>
        </article>
</a>      <a class="questions-item__link" href="/questions/11685?affect_id=0&amp;affect_type=QuestionIndex&amp;query=">
        <article class="questions-item">
            <div class="questions-item__image">
              <div class="image-wrap square">
                <img src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-snapshots-1562207261_5Fzzbop1.jpeg/320/320">
              </div>
            </div>
          <h1 class="questions-item__title text-heading-5 bold text-black">색 결정장애ㅠㅠ 도와주세요</h1>
          <p class="questions-item__content text-caption-1">어제도 한참 여기에 질문했는데ㅠㅠ 제가 고른 화장대가 가족 눈엔 색깔이랑 디자인이 별로래요ㅠㅠ 차라리 어두운 월넛 색이 나은 것 같다고 하시는데 제 방에 어떤 색이 어울리는지 봐주세요ㅠㅠ 그리고 이거 디자인 별로예요?? 갑자기 이 제품에 꽂혀서 다른건 눈에 안들어오는 콩깍지 현상이 생겼어요ㅠ 이건 엄마가 원하시는 책상이에요근데 제 눈엔 제가 고른게 더 예쁜데 인테리어 고수님들 어떻게 생각하시나요?ㅠ</p>
          <footer class="questions-item__footer">
            <span class="questions-item__footer__author">
                <span class="questions-item__footer__author__image">
                    <img src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-users-profile_images-1546339805_oCvA9L.jpeg/80/80"
                         onerror="this.src='https://bucketplace-v2-development.s3.amazonaws.com/uploads/default_images/avatar.png'">
                </span>
                <span class="questions-item__footer__author__content text-caption-1">lisabela37</span>
            </span>
            <span class="questions-item__footer__meta text-caption-1">
              <time datetime="2019-07-04T11:27:48+09:00" class="questions-item__footer__date text-gray">
                3시간 전
              </time>
              <span class="questions-item__footer__comments text-gray">
                답글
                <span class="questions-item__footer__comments__content active">
                  5
                </span>
              </span>
              <span class="questions-item__footer__views text-gray">
                조회
                <span class="questions-item__footer__views__content">39</span>
              </span>
            </span>
            <ul class="questions-item__footer__tags keyword-list">
                <li class="keyword-item questions-item__footer__tags__tag
                  "
                  role="button">셀프인테리어</li>
            </ul>
          </footer>
        </article>
</a>      <a class="questions-item__link" href="/questions/11684?affect_id=0&amp;affect_type=QuestionIndex&amp;query=">
        <article class="questions-item">
            <div class="questions-item__image">
              <div class="image-wrap square">
                <img src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-snapshots1562206354_Sj03.jpeg/320/320">
              </div>
            </div>
          <h1 class="questions-item__title text-heading-5 bold text-black">여기엔 뭘로 하는게 좋을까요? </h1>
          <p class="questions-item__content text-caption-1">창문이 저렇게 밖에 없는데 아침에 항상 일찍 눈을 떠요!! 빛때문에..ㅠㅠ 푹 자고 싶은데 어떻게 하면 좋을까요?? 저렇게 해놓으니 너무 지저분하고 별론거 같아요! 좋은 방법이 없을까요?? </p>
          <footer class="questions-item__footer">
            <span class="questions-item__footer__author">
                <span class="questions-item__footer__author__image">
                    <img src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-users-profile_images1558534283_eTD3li.jpeg/80/80"
                         onerror="this.src='https://bucketplace-v2-development.s3.amazonaws.com/uploads/default_images/avatar.png'">
                </span>
                <span class="questions-item__footer__author__content text-caption-1">저예유</span>
            </span>
            <span class="questions-item__footer__meta text-caption-1">
              <time datetime="2019-07-04T11:12:38+09:00" class="questions-item__footer__date text-gray">
                3시간 전
              </time>
              <span class="questions-item__footer__comments text-gray">
                답글
                <span class="questions-item__footer__comments__content active">
                  6
                </span>
              </span>
              <span class="questions-item__footer__views text-gray">
                조회
                <span class="questions-item__footer__views__content">31</span>
              </span>
            </span>
            <ul class="questions-item__footer__tags keyword-list">
                <li class="keyword-item questions-item__footer__tags__tag
                  "
                  role="button">샷시/창호</li>
                <li class="keyword-item questions-item__footer__tags__tag
                  "
                  role="button">필름</li>
                <li class="keyword-item questions-item__footer__tags__tag
                  "
                  role="button">블라인드</li>
                <li class="keyword-item questions-item__footer__tags__tag
                  "
                  role="button">원룸</li>
                <li class="keyword-item questions-item__footer__tags__tag
                  "
                  role="button">10평대</li>
            </ul>
          </footer>
        </article>
</a>  </section>

  <div id="questions-paginator">
      <nav class="paginator" data-total="1899" data-current="1"
>
    <ul>
        <li rel="prev" role="button"
            class="hidden"><span class="icon icon-pointer-button-square-left" aria-hidden="true"></span>
                <li role=""
                    class="active"
                    data-page="1">
                    1
                </li>
                <li role="button"
                    class=""
                    data-page="2">
                    2
                </li>
                <li role="button"
                    class=""
                    data-page="3">
                    3
                </li>
                <li role="button"
                    class=""
                    data-page="4">
                    4
                </li>
                <li role="button"
                    class=""
                    data-page="5">
                    5
                </li>
                <li role="button"
                    class=""
                    data-page="6">
                    6
                </li>
                <li role="button"
                    class=""
                    data-page="7">
                    7
                </li>
                <li role="button"
                    class=""
                    data-page="8">
                    8
                </li>
                <li role="button"
                    class=""
                    data-page="9">
                    9
                </li>
                <li role="button"
                    class=""
                    data-page="10">
                    10
                </li>
        <li rel="next" role="button"
            class=""><span class="icon icon-pointer-button-square-right" aria-hidden="true"></span></li>
    </ul>
</nav>

  </div>

  <div id="questions-filter-sort-modal"
     class="modal fade fade-done modal-filter"
>
    <div class="modal-dialog" role="document"
         style="
            
            
         ">
        
    <div class="modal-filter__header">
      <h1>정렬</h1>
      <span class="icon icon-pointer-x-black-lg btn-close" aria-hidden="false" role="button" data-dismiss="modal"></span>
    </div>
    <div class="modal-filter__content">
      <ul class="filter-select__list">
          <li class="filter-select__list__entry ">
            <a href="/questions?order=popular&amp;page=1">인기순</a>
          </li>
          <li class="filter-select__list__entry active">
            <a href="/questions?order=recent&amp;page=1">최신순</a>
          </li>
      </ul>
    </div>

    </div>
</div>
</div>

</main>
</body>
</html>