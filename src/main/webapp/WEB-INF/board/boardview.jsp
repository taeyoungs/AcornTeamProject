<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<link rel="stylesheet" type="text/css" href="${root}/css/common.css">
<link rel="stylesheet" media="all" href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/bucket_ui/bucket_ui-a69ea26903ba7b7b1e58db706ee621d7fa1695945755178ff07fe330df44fff6.css" />
<link rel="stylesheet" media="screen" href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/bucket_ui/components-7c293474cce07a07e4c5740df12838356c5abd5f542add27a47f1ac12c737da4.css" />
<link rel="stylesheet" media="screen" href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/layout/application-d819a6efb3afb7a9272381f7f76bd3edd7f2d4e27f2f82b84a7cd52c9b68e261.css" />
<link rel="stylesheet" media="screen" href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/bucket_ui/components-7c293474cce07a07e4c5740df12838356c5abd5f542add27a47f1ac12c737da4.css" />
<link rel="stylesheet" media="screen" href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/questions/show-10f80a072f9392a5b0bb049a10197bacd8005cc0ea40775b3536b50d1b45a09c.css" />
<link rel="stylesheet" media="screen" href="https://d1nyaccf3kuclt.cloudfront.net/dist/css/3-4402b1c8.chunk.css" />
<link rel="stylesheet" media="screen" href="https://d1nyaccf3kuclt.cloudfront.net/dist/css/CommentFeed-556f37ea.css" />
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
$(function(){
	 
	$("#replybox").keyup(function(e) {
		console.log("111");
		e.preventDefault();
		var code = e.keyCode ? e.keyCode : e.which;
		if (code == 13) // EnterKey
		{ 
			if (e.shiftKey === true)
			{ 
				
				// shift 키가 눌려진 상태에서는 new line 입력
			} else
			{
				$('#myreply').submit();
			} 
			
			return false;
		}
	});
});
</script>
</head>
<body>
<main role="main" id="root">
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
    </header>
    <section class="question__content__body">
            <c:forTokens var="myimg" items="${vo.board_image}" delims=",">
				<img src="../save/${myimg}" style="max-width: 100px;"
					class="img-thumbnail">
			</c:forTokens>
            <p>${vo.board_content}</p>
    </section>
    <footer class="question__content__footer">
      <div class="question__content__footer__actions question__actions">

</div>
      <div class="question__content__footer__meta text-caption-1">
        <time class="question__content__footer__date text-gray">
          ${vo.reg_date}
        </time>
        <span class="question__content__footer__views text-gray">
            조회
            <span class="question__content__footer__views__content">${vo.board_hits}</span>
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
      <div data-react-class="CommentFeed">
		<section class="comment-feed">
			<h1 class="comment-feed__header">답글&nbsp;</h1>
			<form class="comment-feed__form" action="reply.do" id="myreply"
			accept-charset="UTF-8" method="post">
			<c:if test="${sessionScope.mvo.member_no!=null}">
				<input type="hidden" name="member_no" value="${sessionScope.member_no}">
				<input type="hidden" name="b_reply_no" value="${vo.board_seq_no}">
				<input type="hidden" name="pageNum" value="${pageNum}">
				<div class="comment-feed__form__content">
				<div class="comment-feed__form__input">
				<textarea class="comment-content-input__text comment-feed__form__content__text" name="b_reply_content" id="replybox"
				placeholder="의견을 남겨 보세요." style="width:700px;height:35px;"></textarea>
				</div></div>
			</c:if>
			<c:if test="${sessionScope.mvo.member_no==null}">
				<a href="reply.do" class="comment-feed__form__cover">
					<div class="comment-feed__form__input">
						<div class="comment-content-input__text comment-feed__form__content__text" data-ph="의견을 남겨 보세요." contenteditable="true"></div>
					</div>
				</a>
			</c:if>
			</form>
			<c:forEach var="bvo" items="${replylist}">
			<li class="comment-feed__list__item">
				<article class="comment-feed__item">
					<p class="comment-feed__item__content">
					<a href="/users/2593483" class="comment-feed__item__content__author">
						<img class="comment-feed__item__content__author__image" src="">
						<span class="comment-feed__item__content__author__name">${bvo.member_no}</span>
					</a>
						<span class="comment-feed__item__content__content" >${bvo.b_reply_content}</span>
					</p>
					<footer class="comment-feed__item__footer">
					<time class="comment-feed__item__footer__time">${bvo.reg_date}</time>
						<c:if test="${sessionScope.mvo.member_no eq vo.member_no}">
							<button class="comment-feed__item__footer__delete-btn" type="button"
							onclick="location.href='replydelete.do?board_seq_no=${vo.board_seq_no}&b_reply_seq_no=${bvo.b_reply_seq_no}&pageNum=${pageNum}'">삭제</button>
						</c:if>
					</footer>
				</article>
			</li>
			</c:forEach>
		</section>	
      </div>
    </section>
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
      <div class="question__sidebar__actions question__actions">
<c:if test="${sessionScope.mvo.member_no eq vo.member_no}">
	<button type="button" class="btn btn-md btn-priority question__aside__section__new-question"
	 style="width:200px;margin-right:2px;" onclick="location.href='updateform.do?board_seq_no=${vo.board_seq_no}&pageNum=${pageNum}'">수정</button>
	<button type="button" class="btn btn-md btn-priority question__aside__section__new-question"
	 style="width:200px;margin-left:2px;" onclick="location.href='delete.do?board_seq_no=${vo.board_seq_no}&pageNum=${pageNum}'">삭제</button>
</c:if>
</div>
      <aside class="question__sidebar__aside question__aside">
  <div class="question__aside__section question__aside__popular">
    <h2 class="text-heading-5">질문과답변 인기 키워드</h2>
    <ul class="keyword-list">
        <li>
          <a class="keyword-item">리모델링/올수리</a>
        </li>
        <li>
          <a class="keyword-item">20평대</a>
        </li>
        <li>
          <a class="keyword-item">아파트</a>
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
</main>
</body>
</html>