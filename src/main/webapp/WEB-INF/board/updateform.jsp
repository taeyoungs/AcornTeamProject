<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문하기</title>
<c:set var="root" value="<%=request.getContextPath() %>"/> 	
<link rel="stylesheet" type="text/css" href="${root}/css/common.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" media="all"
	href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/bucket_ui/bucket_ui-a69ea26903ba7b7b1e58db706ee621d7fa1695945755178ff07fe330df44fff6.css" />
<link rel="stylesheet" media="screen"
	href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/layout/application_simplified-ef1cf9c9395fe6987ee44bfe7ab7cf334c376dc3c2db6bb4c660a6fc24a78573.css" />
<link rel="stylesheet" media="screen"
	href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/bucket_ui/components-7c293474cce07a07e4c5740df12838356c5abd5f542add27a47f1ac12c737da4.css" />
<link rel="stylesheet" media="all"
	href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/questions/form-c1e69dbad62423e4b4d5169be1770bf2c43d515bd876ab236cf00d75c062fbf0.css" />
<link rel="stylesheet" href="../css/board/board.css">
</head>
<body>
<main role="main">
	<div class="question-form container">
		<form id="question-form" class="new_question" action="update.do"
			accept-charset="UTF-8" method="post" enctype="multipart/form-data">
			<header class="question-form__header">
				<h2 class="question-form__header__heading text-black bold">질문하기</h2>
				<div class="question-form__header__title form-group">
					<input placeholder="제목을 적어주세요." class="form-control" maxlength="61"
						size="1" type="text" name="board_title" id="question_title" />
				</div>

			</header>
			<section>
				<!-- 로그인한 정보를 같이 넘겨야 한다 -->
				<input type="hidden" name="member_no" value="${sessionScope.member_no}">
				<div class="question-form__body__content_wrap">
					<textarea required="required" placeholder="내용을 적어주세요" 
					style="height:200px;width:100%;padding:10px;" name="board_content"
					class="question-form__body__content_wrap"></textarea>
					<div>
						<input type="file" name="imagename" class="form-control"
							style="width:220px;" class="question-form__floating__photo-btn btn btn-priority">
					</div>
				</div>
			</section>
			<footer class="question-form__footer">
				<div>
					<input type="hidden" name="board_seq_no" value="${vo.board_seq_no}">
					<input type="hidden" name="pageNum" value="${pageNum}">
					<input type="submit" name="commit" value="질문 저장하기"
						class="btn-priority"/>
				</div>
			</footer>
		</form>
	</div>
</main>
</body>
</html>