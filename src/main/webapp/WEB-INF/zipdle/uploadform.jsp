<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${root}/css/zipdle/uploadform.css">
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
		</form>
	</div>
</div>
</body>
</html>