<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginTest</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<link rel="stylesheet" type="text/css" href="${root}/css/login/signin.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
	<main role="main">
        <div class="sign-in-form-warp">
            <div class="sign-in-form">
                <h1 class="sign-in-form_header">
                    <a href="${root}/main.do" class="sign-in-form_header_link">
                        <img class="icon-page-login" src="${root}/image/common/logo.png">
                    </a>
                </h1>
                <form action="signin" class="sign-in-form_form" method="post" accept-charset="UTF-8" id="new_user">
                    <input type="text" class="sign-in-form_form_input form-control sign-in-form_form_email" 
                            name="email" id="user_email" placeholder="이메일" autofocus="autofocus"
                            autocomplete="off" value="${email}">
                    <div class="sign-in-form_form_input-warp sign-in-form_form_pw">
                        <input type="password" class="sign-in-form_form_input form-control" 
                            name="pw" id="user_pw" placeholder="비밀번호">
                        <p class="sign-in-form_form_pw_caps"></p>
                    </div>
                    <input type="submit" class="sign-in-form_form_submit btn btn-priority" name="commit"
                            value="로그인">
                </form>
                <div class="sign-in-form_action">
                    <a href="findPassword" class="sign-in-form_action_entry">비밀번호 재설정</a>
                    <a href="gotoSignup" class="sign-in-form_action_entry">회원가입</a>
                </div>
                <section class="sign-in-form_sns">
                    <h2 class="sign-in-form_sns_title">SNS계정으로 간편 로그인/회원가입</h2>
                    <div class="sign-in-form_sns_list">
                        <a href=""><img src="${root}/image/common/home.png" 
                        class="sign-in-form_sns_button"></a>
                        <a href=""><img src="${root}/image/common/house.png" 
                        class="sign-in-form_sns_button"></a>
                        <a href=""><img src="${root}/image/common/house2.png" 
                        class="sign-in-form_sns_button"></a>
                    </div>
                    <div class="sign-in-form_line"></div>
                </section>
            </div>
        </div>
        <div id="flash_messages">
        	<c:if test="${login eq 'fail'}">
        		<div id="flash_alert" class="flash_message">
        			이메일 주소 또는 비밀번호가 일치하지 않습니다.
        		</div>
        	</c:if>
        </div>
        <footer class="sign-in-form-footer">
            @<a href="" target="_blank">Selfin Inc</a>. All Rights Reserved
        </footer>
    </main>
    <script type="text/javascript">
    	$("#flash_alert").delay(1500).fadeOut();
    	$("#user_email").focusin(function(){
    		$(this).addClass("focus-visible");
    	});
    	$("#user_pw").focusin(function(){
    		$(this).addClass("focus-visible");
    	});
    	$("#user_email").focusout(function(){
    		$(this).removeClass("focus-visible");
    	});
    	$("#user_pw").focusout(function(){
    		$(this).removeClass("focus-visible");
    	});
    </script>
</body>
</html>