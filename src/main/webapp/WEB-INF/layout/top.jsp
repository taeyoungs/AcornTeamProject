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
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
<link rel="stylesheet" href="/css/common.css">
</head>
<body>
<div id="navigation" >
	<nav class="navi-primary-wrap" style="height: auto;">
		<!-- position: fixed로 변경시키기 위한 div 태그, data-sticky-enabled 상태값으로 체크 -->
		<div class="navi-primary_container" data-sticky-enabled="false" style="position: relative">
			<div class="navi-primary" style="display: flex;">
				<a class="navi-primary_logo">
					<img src="image/logo.png">
				</a>
				<div class="navi-primary_menu" style="display: flex;">
					<ul class="navi-menu">
						<li class="navi-menu_primary">커뮤니티</li>
						<li class="navi-menu_primary">스토어</li>
						<li class="navi-menu_primary">전문가</li>
					</ul>
				</div>
			</div>
		</div>
	</nav>
</div>
</body>
</html>
