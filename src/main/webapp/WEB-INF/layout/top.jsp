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
<script type="text/javascript" src="${root}/js/top/topjs.js"></script>
<link rel="stylesheet" type="text/css" href="${root}/css/top/topstyle.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
    <div id="navi" class="navi-top-banner">
        <nav class="navi-primary-wrap sticky-top" style="height: auto">
            <div class="navi-primary_container sticky-content" data-offset="0">
                <div class="navi-primary">
                    <a class="navi-primary_logo" href="${root}/main.do?where=home">
                        <img src="${root}/image/common/logo.png">
                    </a>
                    <div class="navi-primary_menu open">
                        <ul class="navi-menu">
                            <li class="navi-menu_primary current active">
                               <div class="title">
                                   <a href="${root}/main.do?where=home">커뮤니티</a>
                               </div>
                            </li>
                            <li class="navi-menu_primary">
                                <div class="title">
                                   <a href="#">스토어</a>
                               </div>
                            </li>
                            <li class="navi-menu_primary">
                                <div class="title">
                                   <a href="#">전문가</a>
                               </div>
                            </li>
                        </ul>
                    </div>
                    <div class="navi-primary_search">
                           <form class="navigation-search" action="">
                               <div class="navi-search_box">
                                   <input type="submit" class="navi-search_box_submit" style="display: none;">
                                   <button class="navi-search_box_category-btn" type="button"></button>
                                   <button class="navi-search_box_icon" type="button">
                                       <span class="icon"></span>
                                       <span class="icon"></span>
                                   </button>
                                   <span class="navi-search_box_icon_blur">
                                       <img src="${root}/image/common/search.png" width="20">
                                   </span>
                                   <input type="text" placeholder="검색" size="1" class="navi-search_box_input">
                                   <span class="navi-search_box_bg"></span>
                               </div>
                           </form>
                    </div>
                    <div class="navi-primary_action">
                        <button class="navi-primary_search-sm-btn navi-primary_button button-sm">
                            <img src="${root}/image/common/search.png" width="20">
                        </button>
                        <a href="${root}/member/writelist" class="navi-primary_write-btn">
                            	글쓰기
                        </a>
                        <a href="#" class="navi-primary_cart-btn navi-primary_button">
                            <img src="${root}/image/common/cart gray.png" width="20">
                        </a>
                        <c:if test="${sessionScope.loginok eq 'login'}">
                        	<a href="" class="navi-primary_notification-btn navi-primary_button">
                        		<img src="${root}/image/common/notification gray.png" width="20">
                        	</a>
                        </c:if>
                    </div>
                   <c:if test="${sessionScope.loginok eq 'login'}">
                    	<div class="navi-primary_user logged">
	                    	<div class="navi-primary_user_header">
 	                    		<c:if test="${sessionScope.mvo.member_image ne 'noimage'}">
	                    			<img src="${root}/uploadImage/${sessionScope.mvo.member_image}" class="navi-primary_user-image">
	                    		</c:if>
	                    		<c:if test="${sessionScope.mvo.member_image eq 'noimage'}">
	                    			<img src="${root}/image/common/user.png" class="navi-primary_user-image">
	                    		</c:if>
	                    		<img src="${root}/image/common/button.png" class="navi-primary_user-btn">
	                    	</div>
	                    	<div class="navi-primary_user_list">
	                    		<ul class="navi-user-menu">
	                    			<li><a href="${root}/users/userPhoto">마이홈</a></li>
	                    			<li><a href="${root}/member/logout">로그아웃</a></li>
	                    		</ul>
	                    	</div>
                    	</div>
                    </c:if>
                    <c:if test="${sessionScope.loginok ne 'login'}">
                    	<div class="navi-primary_user unlogged">
	                    	<div class="navi-primary_user_unlogged">
	                    		<a href="${root}/member/gotoSignin" class="navi-primary_user_unlogged_login">로그인</a>
	                        	<a href="${root}/member/gotoSignup" class="navi-primary_user_unlogged_register">회원가입</a>
	                    	</div>
                    	</div>
                    </c:if>
                </div>
            </div>
        </nav>
        <nav class="navi-secondary-wrap sticky-top" style="height: auto">
            <div class="navi-secondary_container sticky-content open" data-offset="${secondaryTop}">
                <div class="navi-secondary">
                    <div class="navi-secondary_menu">
                        <ul style="white-space: nowrap;">
                            <li class="navi-menu_primary_secondary ${where eq 'home' ? 'active' : ''}">
                                <a href="${root}/main.do?where=home">홈</a>    
                            </li>
                            <li class="navi-menu_primary_secondary ${where eq 'photo' ? 'active' : ''}">
                                <a href="${root}/photo/photolist.do?where=photo">사진</a> 
                            </li>
                            <li class="navi-menu_primary_secondary">
                                <a href="#" onClick="sendWPage('집들이')">집들이</a> 
                            </li>
                            <li class="navi-menu_primary_secondary ${where eq 'board' ? 'active' : ''}">
                                <a href="${root}/board/list.do?where=board">질문과답변</a> 
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
    </div>
</body>
</html>