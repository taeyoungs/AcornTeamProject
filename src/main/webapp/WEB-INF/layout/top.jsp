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
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
    <div id="navi" class="navi-top-banner">
        <nav class="navi-primary-wrap sticky-top">
            <div class="navi-primary_container sticky-content">
                <div class="navi-primary">
                    <a class="navi-primary_logo" href="/">
                        <img src="image/logo.png">
                    </a>
                    <div class="navi-primary_menu open">
                        <ul class="navi-menu">
                            <li class="navi-menu_primary current active">
                               <div class="title">
                                   <a href="#">커뮤니티</a>
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
                                       <img src="image/search.png" width="20">
                                   </span>
                                   <input type="text" placeholder="검색" size="1" class="navi-search_box_input">
                                   <span class="navi-search_box_bg"></span>
                               </div>
                           </form>
                    </div>
                    <div class="navi-primary_action">
                        <button class="navi-primary_search-sm-btn" style="display: none;">
                            <img src="image/search.png" width="20">
                        </button>
                        <a href="#" class="navi-primary_write-btn">
                            	글쓰기
                        </a>
                        <a href="#" class="navi-primary_cart-btn">
                            <img src="image/cart gray.png" width="20">
                        </a>
                    </div>
                    <div class="navi-primary_user">
                        <a href="#" class="navi-primary_user_unlogged_login">로그인</a>
                        <a href="#" class="navi-primary_user_unlogged_register">회원가입</a>
                    </div>
                </div>
            </div>
        </nav>
        <nav class="navi-secondary-wrap sticky-top">
            <div class="navi-secondary_container sticky-content open">
                <div class="navi-secondary">
                    <div class="navi-secondary_menu">
                        <ul style="white-space: nowrap;">
                            <li class="navi-menu_primary_secondary active">
                                <a href="#">홈</a>    
                            </li>
                            <li class="navi-menu_primary_secondary">
                                <a href="#">사진</a> 
                            </li>
                            <li class="navi-menu_primary_secondary">
                                <a href="#">집들이</a> 
                            </li>
                            <li class="navi-menu_primary_secondary">
                                <a href="#">질문과답변</a> 
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
    </div>
    <div style="position: absolute; top: 1200px;">스크롤끝</div>
</body>
</html>
