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
<c:set var="root" value="<%=request.getContextPath()%>"/>
<link rel="stylesheet" type="text/css" href="${root}/css/users/userUpdate.css">
<script type="text/javascript" src="${root}/js/users/userUpdate.js"></script>
</head>
<body>
<div id="users-contents">
	<div class="users-title">회원정보수정</div>
	<a href="" class="withdraw">탈퇴하기</a>
	<form action="userUpload" class="edit-user" id="edit_user_${sessionScope.member_no}"
		accept-charset="UTF-8" method="post" enctype="multipart/form-data">
		<div class="field">
			<div class="sub_title">이메일</div>
			<input type="text" readonly="readonly" class="email" name="member_id"
				value="${sessionScope.mvo.member_id}" id="email">
			<span style="font-weight: normal;">@</span>
			<input type="text" readonly="readonly" class="email" name="member_domain"
				value="${sessionScope.mvo.member_domain}" id="domain">
			<div class="alert">이메일을 변경하시려면 운영자에게 이메일을 보내주세요.</div>
		</div>
		<div class="field">
			<div class="sub_title">별명</div>
			<input type="text" placeholder="별명을 입력해주세요." value="${sessionScope.mvo.member_nickname}"
					name="member_nickname" id="user_nickname">
		</div>
		<div class="field">
			<div class="sub_title">성별</div>
			<div class="radio_buttons ui_checked">
				<input type="radio" value="0" checked="checked" aria-state="${sessionScope.mvo.member_sex}" 
						name="member_sex" id="user_sex_0">
				<c:if test="${sessionScope.mvo.member_sex == 0}">
					<img src="${root}/image/common/checked.png" class="image man">
				</c:if>
				<c:if test="${sessionScope.mvo.member_sex == 1}">
					<img src="${root}/image/common/empty.png" class="image man">
				</c:if>
				<label for="user_sex_0">남자</label>
			</div>
			<div class="radio_buttons ui_checked">
				<input type="radio" value="1" checked="checked" aria-state="${sessionScope.mvo.member_sex}" name="member_sex" id="user_sex_1">
				<c:if test="${sessionScope.mvo.member_sex == 1}">
					<img src="${root}/image/common/checked.png" class="image woman">
				</c:if>
				<c:if test="${sessionScope.mvo.member_sex == 0}">
					<img src="${root}/image/common/empty.png" class="image woman">
				</c:if>
				<label for="user_sex_1">여자</label>
			</div>
		</div>
		<div class="field">
			<div class="sub_title">생년월일</div>
			<select id="user_birthday_1i" name="member_birth_1i">
				<c:if test="${mvo.member_birth_1i ne null}">
					<option value="${mvo.member_birth_1i}">${mvo.member_birth_1i}</option>
				</c:if>
				<c:if test="${mvo.member_birth_1i eq null}">
					<option value>YYYY</option>
				</c:if>
				<c:forEach var="year" begin="0" end="${2019-1919}">
					<c:set var="yearOption" value="${2019-year}"/>
					<option value="${yearOption}">${yearOption}</option>
				</c:forEach>
			</select>
			<select id="user_birthday_2i" name="member_birth_2i">
				<c:if test="${mvo.member_birth_2i ne null}">
					<option value="${mvo.member_birth_2i}">${mvo.member_birth_2i}</option>
				</c:if>
				<c:if test="${mvo.member_birth_2i eq null}">
					<option value>MM</option>
				</c:if>
				<c:forEach var="month" begin="0" end="12">
					<c:set var="monthOption" value="${12-month}"/>
					<option value="${monthOption}">${monthOption}</option>
				</c:forEach>
			</select>
			<select id="user_birthday_3i" name="member_birth_3i">
				<c:if test="${mvo.member_birth_3i ne null}">
					<option value="${mvo.member_birth_3i}">${mvo.member_birth_3i}</option>
				</c:if>
				<c:if test="${mvo.member_birth_3i eq null}">
					<option value>DD</option>
				</c:if>
				<c:forEach var="day" begin="0" end="31">
					<c:set var="dayOption" value="${31-day}"/>
					<option value="${dayOption}">${dayOption}</option>
				</c:forEach>
			</select>
		</div>
		<div class="field image_uploader profile" id="profile_image_url">
			<div class="sub_title">프로필 이미지</div>
			<input type="file" name="profile_image_uploader" accept="image/*" style="display: none;">
			<c:if test="${sessionScope.mvo.member_image ne 'noimage'}">
				<div class="result" style="background-image: url('${root}/uploadImage/${sessionScope.mvo.member_image}')">
					<div class="filter">
						<img src="${root}/image/common/camera plus.png" class="icon">
					</div>
				</div>
			</c:if>
			<c:if test="${sessionScope.mvo.member_image eq 'noimage'}">
				<div class="result" style="background-image: url('${root}/uploadImage/${sessionScope.mvo.member_image}')">
					<div class="filter">
						<img src="${root}/image/common/camera plus.png" class="icon">
					</div>
				</div>
			</c:if>
		</div>
		<div class="field">
			<div class="sub_title">한줄 소개</div>
			<input type="text" class="comment" name="member_comment" id="user_comment" 
					value="${sessionScope.mvo.member_comment}">
			<div class="limit">
				( <span id="typed">0</span> / 40 )
			</div>
		</div>
		<input type="submit" name="commit" value="회원 정보 수정" id="submit">
	</form>
</div>
</body>
</html>