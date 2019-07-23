<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<script type="text/javascript" src="${root}/js/zipdle/zipdleList.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/zipdle/zipdleList.css">
</head>
<body>
<main role="main" id="root">
	<div id="project-index" class="project-index">
		<div class="container">
			<div class="filter project-index_filter">
				<div class="filter-bar">
					<div class="filter-bar_control-list">
						<ul class="filter-bar_control-list_left">
							<li class="filter-bar_control-list_item">
								<div class="drop-down panel-drop-down filter-bar-control">
									<button class="button button-gray filter-bar-control_button" data-cate="11">정렬
									<img class="icon" src="${root}/image/common/down-arrow-gray.png">
									</button>
								</div>
							</li>
							<li class="filter-bar_control-list_item">
								<div class="drop-down panel-drop-down filter-bar-control">
									<button class="button button-gray filter-bar-control_button" data-cate="22">주거형태
										<img class="icon" src="${root}/image/common/down-arrow-gray.png">
									</button>
								</div>
							</li>
							<li class="filter-bar_control-list_item">
								<div class="drop-down panel-drop-down filter-bar-control">
									<button class="button button-gray filter-bar-control_button" data-cate="33">평수
										<img class="icon" src="${root}/image/common/down-arrow-gray.png">
									</button>
								</div>
							</li>							
						</ul>
					</div>
					<ul class="filter-bar_tag-list"></ul>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="project-index_feed">
			</div>
		</div>
	</div>
</main>
</body>
</html>