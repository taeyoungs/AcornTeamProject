<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<link rel="stylesheet" type="text/css" href="${root}/css/zipdle/uploadform.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
<%-- <script type="text/javascript" src="${root}/js/writelist.js"></script> --%>
</head>
<body>
<div id="wrapper" class="aws">
	<div id="body" class="projects write" data-s_id="${sessionScope.member_no}">
		<form action="" id="project_form_wrap" class="new_zipdle" method="post" accept-charset="UTF-8">
			<div id="total_change">
				<div class="header">
					<a href="${root}/main.do?where=home">
						<img src="${root}/image/common/logo-white.png" class="uploadform-logo">
					</a>
				</div>
				<div class="wrap-panel">
					<div class="title">전체정렬</div>
					<div class="total_align_icon" data-align="0">
						<img src="${root}/image/common/left-align.png">
					</div>
					<div class="total_align_icon" data-align="1">
						<img src="${root}/image/common/central-align.png">
					</div>
					<div class="total_align_icon" data-align="2">
						<img src="${root}/image/common/right-align.png">
					</div>
				</div>
			</div>
			<div id="project_form">
				<div id="cover_image_upload" style="background-image: url('')">
					<div class="cover_icon">
						<div class="icon">
							<img src="${root}/image/common/add.png" width="43">
						</div>
						<div class="title">커버사진 추가하기</div>
					</div>
					<input type="hidden" name="cover_image_url" id="project_cover_image_url">
					<input type="file" name="cover_image_uploader" id="cover_image_uploader"
						accept="image/*">
				</div>
				<div id="title_panel">
					<div class="category">온라인 집들이</div>
					<input type="text" placeholder="제목을 입력해주세요." maxlength="30" size="30"
						name="zip_title" id="project_title">
					<div id="title_count" class="count">
						<span>0</span>/30
					</div>
					<div id="writer_profile">
						<img src="${root}/uploadImage/${sessionScope.mvo.member_image}">
						<div class="nickname">${sessionScope.mvo.member_nickname}</div>
						<div class="introduction">${sessionScope.mvo.member_comment}</div>
					</div>
				</div>
				<div id="information_wrap">
					<div id="information">
						<p class="information_header">정보를 많이 입력해 주실수록 검색 결과에 많이 노출되어 조회수가 올라갑니다.</p>
						<div class="field">
							<div class="label essential">공간*</div>
							<div class="value">
								<select name="zip_type">
									<option value="0">원룸</option>
									<option value="1">투룸</option>
								</select>
							</div>
						</div>
						<div class="field">
							<div class="label essential">평수*</div>
							<div class="value has_unit">
								<input maxlength="3" size="3" type="text" name="zip_pyeong"
									id="project_real_area">
								<div class="unit one">평</div>
							</div>
						</div>
						<div class="field">
							<div class="label essential">가족형태*</div>
							<div class="value">
								<select name="zip_fmtype">
									<option value>선택해주세요.</option>
									<option value="0">1인 가구</option>
									<option value="1">2인 가구 이상</option>
								</select>
							</div>
						</div>
						<div class="field">
							<div class="label">기간</div>
							<div class="value has_unit">
								<input type="number" name="zip_period" id="project_period">
								<div class="unit one">주</div>
							</div>
							<div class="value checkbox">
								
							</div>
						</div>
						<div class="field">
							<div class="label">예산</div>
							<div class="value has_unit">
								<input type="number" name="zip_budget" id="project_budget">
								<div class="unit two">만원</div>
							</div>
						</div>
						<div class="field">
							<div class="label">지역</div>
							<div class="value">
								<select name="zip_fmtype">
									<option value>시/도 선택</option>
									<option value="0">서울특별시</option>
									<option value="1">부산광역시</option>
									<option value="2">대구광역시</option>
									<option value="3">인천광역시</option>
									<option value="4">광주광역시</option>
									<option value="5">대전광역시</option>
									<option value="6">울산광역시</option>
									<option value="7">강원도</option>
									<option value="8">경기도</option>
									<option value="9">경상남도</option>
									<option value="10">경상북도</option>
									<option value="11">전라남도</option>
									<option value="12">전라북도</option>
									<option value="13">충청남도</option>
									<option value="14">충청북도</option>
									<option value="15">세종특별자치시</option>
									<option value="16">제주특별자치도</option>
								</select>
							</div>
						</div>
					</div>
					<div id="alert_panel">
						<div>1. 사진은 설명과 함께 최소 5장 이상 올려주세요.</div>
						<div>2. 소개해주시는 공간에 대한 충분한 설명(스토리텔링)을 남겨주세요.</div>
						<div>3. 다양한 구도의 스타일링 사진과 도면, 비포 사진은 보시는 분들에게 큰 도움이 됩니다.</div>
						<div>4. 업로드 후에 일부 사진이 나오지 않는다면, 사진을 삭제한 후 다시 올려주세요.</div>
						<div>5. 작성 중에는 임시저장(비공개 등록), 완료 후에는 발행신청을 눌러주세요. 게시글 확인 후 스케줄에 맞춰 오픈됩니다.</div>
						<div>6. 게시글 오픈 전/후, 수정이 필요하실때는 [마이홈]-[나의스토리]에서 작성 게시글을 확인하실 수 있습니다.</div>
					</div>
					<div id="card_panel" class="ui-sortable">
						<div id="card_uploader_wrap" style="display:none;">
							<input type="file" name="zip_image" id="card_uploader" accept="image/*"
								multiple="multiple">
						</div>
						<div id="card_panel" class="ui-sortable">
							<div class="add_card_panel">
								<div class="icon">
									<img src="${root}/image/common/add.png" width="20">
								</div>
								<div class="text">이 곳에 사진 추가하기</div>
							</div>
							<div class="card_form_content">
								<textarea class="title" placeholder="제목이 필요하면 입력해주세요.(공백시 나타나지 않습니다.)" 
									name="" id=""></textarea>
								<div class="move_delete_button">
									<div class="delete">
										<span class="icon">
											<img src="${root}/image/common/cancel white.png" width="16">
										</span>
										<span class="text">삭제</span>
									</div>
									<div class="up">
										<span class="icon">
											<img src="${root}/image/common/up-arrow2.png" width="16">
										</span>
										<span class="text">한칸<br>올리기</span>
									</div>
									<div class="down">
										<span class="icon">
											<img src="${root}/image/common/down-arrow2.png" width="16">
										</span>
										<span class="text">한칸<br>내리기</span>
									</div>
								</div>
								<div class="content_panel">
									<div class="input">
										<input class="image_url" type="hidden" name=""
											id="" value="">
										<div class="image">
											<img src="${root}/uploadImage/2.jpg" class="image" style="height: initial;">
											<input class="source" placeholder="출처 URL이 있다면 입력해주세요.(http://를 꼭 붙여주세요.)"
												type="text" name="" id="">
										</div>
										<div class="user_input">
											<div class="content_space" contenteditable="true"
											data-ph="사진에 대한 설명을 써주세요."></div>
										</div>
										<textarea class="description" name="" id=""
											style="display: none;"></textarea>
									</div>
								</div>
								<div class="hashtag ui-keyword-field">
									<div class="hashtag_add_input" contenteditable="true" placeholder="태그입력"></div>
								</div>
							</div>
						</div>
						<div class="card_form only_add_content">
							<div class="add_card_panel big">
								<div class="icon">
									<img src="${root}/image/common/add.png" width="43">
								</div>
								<div class="text">사진 추가하기</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="action_buttons" class="floating_menu">
				<div id="publish_submit" class="right positive">발행신청</div>
				<div id="private_submit" class="right has_border">임시저장</div>
			</div>
		</form>
	</div>
</div>
</body>
</html>