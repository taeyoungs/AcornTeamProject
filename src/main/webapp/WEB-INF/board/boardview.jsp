<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/common.css">
<link rel="stylesheet" media="all" href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/bucket_ui/bucket_ui-a69ea26903ba7b7b1e58db706ee621d7fa1695945755178ff07fe330df44fff6.css" />
<link rel="stylesheet" media="screen" href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/bucket_ui/components-7c293474cce07a07e4c5740df12838356c5abd5f542add27a47f1ac12c737da4.css" />
<link rel="stylesheet" media="screen" href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/layout/application-d819a6efb3afb7a9272381f7f76bd3edd7f2d4e27f2f82b84a7cd52c9b68e261.css" />
<link rel="stylesheet" media="screen" href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/bucket_ui/components-7c293474cce07a07e4c5740df12838356c5abd5f542add27a47f1ac12c737da4.css" />
<link rel="stylesheet" media="screen" href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/questions/show-10f80a072f9392a5b0bb049a10197bacd8005cc0ea40775b3536b50d1b45a09c.css" />
<link rel="stylesheet" media="screen" href="https://d1nyaccf3kuclt.cloudfront.net/dist/css/3-4402b1c8.chunk.css" />
<link rel="stylesheet" media="screen" href="https://d1nyaccf3kuclt.cloudfront.net/dist/css/CommentFeed-556f37ea.css" />
</head>
<body>
<main role="main" id="root">
  <a id="btn-open-app-floating" class="has-floating" href="https://ohouse.onelink.me/2107755860?af_ad=&amp;af_c_id=&amp;af_campaign=&amp;af_channel=&amp;af_dp=ohouseapp%3A%2F%2Fohou.se%2Fquestions%2F11761%3Faffect_id%3D0%26affect_type%3DQuestionIndex%26query%3D&amp;af_media=web_organic&amp;af_web_dp=https%3A%2F%2Fohou.se%2Fquestions%2F11761%3Faffect_id%3D0%26affect_type%3DQuestionIndex%26query%3D&amp;pid=web_organic">앱열기</a>





<div id="kakaoTemplateData" style="display: none"
     data-title="거실 소파 추천 부탁 드려연"
     data-id="11761"
     data-photo="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-snapshots1562512356_Z.jpeg/1700/1700"
     data-user_nickname="${mvo.member_no}"
     data-user_profile="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-users-profile_images1561382491_Ik8.jpeg/850/850"
     data-comment_count="6"
     data-share_count="0"
     data-view_count="54"
></div>

<article id="page" class="page-2col container" data-question-id="11761">
  <section id="question__content" class="page-2col__content">
    <header class="question__content__header page-2col__content__header">
      <div class="question__content__header__top text-body-1">
        <a class="question__content__header__top__board" href="list.do">질문과 답변</a>
      </div>
      <h1 id="question-name" class="question__content__header__name text-heading-3 text-black bold">${vo.board_title}</h1>
      <address class="question__content__header__author question__author">
  <a class="question__author__link" href="/users/4446505">
    <div class="question__author__image">
      <img src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-users-profile_images1561382491_Ik8.jpeg/160/160"
           onerror="this.src='https://bucketplace-v2-development.s3.amazonaws.com/uploads/default_images/avatar.png'">
    </div>
    <div class="question__author__content">
      <div class="question__author__content__name text-body-1">
        <span class="question__author__content__name__name">${mvo.member_no}</span>
      </div>
      <div class="question__author__content__body text-caption-4"></div>
    </div>
</a>  <div class="question__author__follow">
      <div class="question__author__follow__button question-follow-btn btn btn-xs
                btn-simple"
           role="button" data-target="4446505"
           data-path="/users/4446505/follow"
           data-cancel-path="/users/4446505/unfollow"
      ><span class="active"><span
      class="icon icon-etc-check-white-sm"></span>팔로잉</span><span
      class="inactive">팔로우</span></div>
  </div>
</address>
    </header>
    <section class="question__content__body">
            <c:forTokens var="myimg" items="${vo.board_image}" delims=",">
				<img src="../save/${myimg}" style="max-width: 100px;"
					class="img-thumbnail">
			</c:forTokens>
            <p>${vo.board_content}</p>
    </section>
    <footer class="question__content__footer">
      <ul class="question__content__footer__tags keyword-list">
          <li>
            <a class="keyword-item" href="/questions?query=%EC%86%8C%ED%8C%8C">소파</a>
          </li>
          <li>
            <a class="keyword-item" href="/questions?query=20%ED%8F%89%EB%8C%80">20평대</a>
          </li>
      </ul>
      <div class="question__content__footer__actions question__actions">

</div>
      <div class="question__content__footer__meta text-caption-1">
        <time datetime="2019-07-08T00:12:48+09:00" class="question__content__footer__date text-gray">
          ${vo.reg_date}
        </time>
        <span class="question__content__footer__views text-gray">
            조회
            <span class="question__content__footer__views__content">54</span>
          </span>
        <span class="question__content__footer__bookmarks text-gray">
          스크랩
          <span class="question__content__footer__bookmarks__content">
            0
          </span>
          </span>
      </div>
    </footer>
    <section class="question__content__comments">
      <div data-react-class="CommentFeed" data-react-props="{&quot;type&quot;:&quot;Question&quot;,&quot;id&quot;:11761,&quot;count&quot;:6,&quot;total_count&quot;:6,&quot;comment_name&quot;:&quot;답글&quot;,&quot;user&quot;:{&quot;id&quot;:4468397,&quot;nickname&quot;:&quot;null+1&quot;,&quot;profileImageUrl&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/users/profile_images/1561688957_naver_7e2bf28501dab80529cd66ff062ff12cbc8dfdebedfdc7b84a4f2968c259ac00.jpg&quot;,&quot;userableType&quot;:&quot;NormalUser&quot;,&quot;userableId&quot;:4510362,&quot;isAdmin&quot;:false},&quot;page_size&quot;:5,&quot;disable_image&quot;:null,&quot;disable_reply&quot;:null,&quot;show_mentor&quot;:true,&quot;placeholder&quot;:null}"></div>

    </section>
    <aside class="question__content__aside question__aside">
  <div class="question__aside__section question__aside__popular">
    <h2 class="text-heading-5">질문과답변 인기 키워드</h2>
    <ul class="keyword-list">
        <li>
          <a class="keyword-item" href="/questions?query=%EB%A6%AC%EB%AA%A8%EB%8D%B8%EB%A7%81%2F%EC%98%AC%EC%88%98%EB%A6%AC">리모델링/올수리</a>
        </li>
        <li>
          <a class="keyword-item" href="/questions?query=20%ED%8F%89%EB%8C%80">20평대</a>
        </li>
        <li>
          <a class="keyword-item" href="/questions?query=%EC%95%84%ED%8C%8C%ED%8A%B8">아파트</a>
        </li>
    </ul>
  </div>
  <div class="question__aside__section">
    <h2 class="text-heading-5">인테리어 궁금한 것 직접 질문해보세요!</h2>
    <p>
      <a class="btn btn-md btn-priority question__aside__section__new-question" href="form.do">질문하러 가기</a>
    </p>
  </div>
</aside>
  </section>
  <nav id="question__sidebar" class="page-2col__sidebar sticky-top">
    <div class="page-2col__sidebar__content sticky-content">
      <address class="question__sidebar__author question__author">
  <a class="question__author__link" href="/users/4446505">
    <div class="question__author__image">
      <img src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-users-profile_images1561382491_Ik8.jpeg/160/160"
           onerror="this.src='https://bucketplace-v2-development.s3.amazonaws.com/uploads/default_images/avatar.png'">
    </div>
    <div class="question__author__content">
      <div class="question__author__content__name text-body-1">
        <span class="question__author__content__name__name">${vo.member_no}</span>
      </div>
      <div class="question__author__content__body text-caption-4"></div>
    </div>
</a>  <div class="question__author__follow">
      <div class="question__author__follow__button question-follow-btn btn btn-xs
                btn-simple"
           role="button" data-target="4446505"
           data-path="/users/4446505/follow"
           data-cancel-path="/users/4446505/unfollow"
      ><span class="active"><span
      class="icon icon-etc-check-white-sm"></span>팔로잉</span><span
      class="inactive">팔로우</span></div>
  </div>
</address>
      <div class="question__sidebar__actions question__actions">
<c:if test="${sesssionScope.mvo.member_id == vo.member_no}">
	<button type="button">수정</button>
	<button type="button">삭제</button>
</c:if>
</div>
      <aside class="question__sidebar__aside question__aside">
  <div class="question__aside__section question__aside__popular">
    <h2 class="text-heading-5">질문과답변 인기 키워드</h2>
    <ul class="keyword-list">
        <li>
          <a class="keyword-item" href="/questions?query=%EB%A6%AC%EB%AA%A8%EB%8D%B8%EB%A7%81%2F%EC%98%AC%EC%88%98%EB%A6%AC">리모델링/올수리</a>
        </li>
        <li>
          <a class="keyword-item" href="/questions?query=20%ED%8F%89%EB%8C%80">20평대</a>
        </li>
        <li>
          <a class="keyword-item" href="/questions?query=%EC%95%84%ED%8C%8C%ED%8A%B8">아파트</a>
        </li>
    </ul>
  </div>
  <div class="question__aside__section">
    <h2 class="text-heading-5">인테리어 궁금한 것 직접 질문해보세요!</h2>
    <p>
      <a class="btn btn-md btn-priority question__aside__section__new-question" href="form.do">질문하러 가기</a>
    </p>
  </div>
</aside>
    </div>
  </nav>
</article>

<section id="question__floating" class="floating-bar sticky-bottom">
  <div class="floating-bar__content sticky-content question__floating">
    <div class="question__floating__actions question__actions">
  <!--
    <div class="question__actions__action__wrap">
            <div class="question__actions__action question-bookmark-btn
            
            " role="button" data-target="11761"
            data-path="/bookmarks?bookmark%5Bbookmarkable_id%5D=11761&amp;bookmark%5Bbookmarkable_type%5D=Question"
            data-cancel-path="/bookmarks/destroy_by_content?content_id=11761&amp;content_type=Question">
                    <span class="icon icon-action-scrap-sm sm inactive"></span>
                    <span class="icon icon-action-scrap-blue-sm sm active"></span>
                    <span class="icon icon-action-scrap-light-md md inactive"></span>
                    <span class="icon icon-action-scrap-blue-md md active"></span>
                <span class="question__actions__action__caption">스크랩</span>
                <span class="question__actions__action__count">0</span>
            </div>
    </div>
    -->
  <div class="question__actions__action__wrap">
    <div class="question__actions__action question-share-btn" role="button" data-target="11761"
         data-path="/questions/11761/increase_share">
        <span class="icon-common-action__j-8" aria-hidden="true"></span>
      <span class="question__actions__action__caption">공유</span>
      <span class="question__actions__action__count">0</span>
    </div>
    <div id="" class="tooltip-share-sns hidden" style="right: ">
     <!--data-title="" data-username=""-->
    <a class="btn-share-sns facebook" href="#" target="_blank"><span class="icon icon-sns-square-facebook"></span></a>
    <div class="btn-share-sns kakaostory" href="#" target="_blank"><span class="icon icon-sns-square-kakao-story"></span></div>
    <div class="btn-share-sns kakaotalk" href="#" target="_blank"><span class="icon icon-sns-square-kakao-talk"></span></div>
    <a class="btn-share-sns naver" href="#" target="_blank"><span class="icon icon-sns-square-naver"></span></a>
</div>
  </div>
</div>
    <div class="question__floating__buttons">
      <button class="question__floating__buttons__reply btn btn-priority">답변 달기
      </button>
    </div>
  </div>
</section>

</main>
</body>
</html>