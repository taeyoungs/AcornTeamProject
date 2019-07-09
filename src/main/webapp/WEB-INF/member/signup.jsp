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
<link rel="stylesheet" type="text/css" href="${root}/css/login/signup.css">
</head>
<body>
    <header id="simplified-gnb" class="simplified-gnb">
        <div class="container simplified-gnb_container">
            <a href="${root}/main.do?where=home" class="simplified-gnb_logo">
                <img src="${root}/image/common/logo.png" width="80">
            </a>
        </div>
    </header>
    <main role="main">
        <section id="signup-form_wrap" class="container">
            <h4 class="signup-form_title">회원가입</h4>
            <section class="signup-form" id="signup-form">
                <section id="signup-form_social" class="signup-form_social">
                    <p class="signup-form_social_title">SNS계정으로 간편하게 회원가입</p>
                    <div class="signup-form_social_content" style="text-align: center;">
                        <a href=""><img src="${root}/image/common/home.png" class="signup-form_social_button"></a>
                        <a href=""><img src="${root}/image/common/house.png" class="signup-form_social_button"></a>
                        <a href=""><img src="${root}/image/common/house2.png" class="signup-form_social_button"></a>
                    </div>
                </section>
                <hr class="signup-form_divider">
                <section id="signup-form_email" class="signup-form_email">
                    <form action="signup" novalidate="novalidate" class="new_normal_user" id="new_normal_user"
                           accept-charset="UTF-8" method="post">
                        <div class="form-group" id="signup-form_email_email-form-group">
                            <label for="signup-form_email_email_username" class="form-label">이메일</label>
                            <div class="input-group">
                                <input type="text" size="1" class="form-control signup-form_email_email-username"
                                    id="signup-form_email_email-username" autofocus autocomplete="off" name="member_id"
                                    style="border-radius: 4px;" id-list="${idList}">
                                <span class="form-separator signup-form_email_email-at-mark">@</span>
                                <input type="text" size="1" class="form-control signup-form_email_email-domain"
                                    id="signup-form_email_email-domain" autocomplete="off" name="member_domain"
                                    style="border-radius: 4px;">       
                            </div>
                            <p class="error"></p>
                        </div>
                        <div class="form-group" id="signup-form_email_pw-form-group">
                            <label for="normal_user_password" class="form-label">비밀번호</label>
                            <p class="caption line-height-normal">8자이상 영문 대소문자, 숫자, 특수문자를 사용하세요.</p>
                            <input type="password" class="form-control" autocomplete="new-password" required="required"
                                   name="member_pw" id="normal_user_password">
                            <p class="error"></p>
                        </div>
                        <div class="form-group" id="signup-form_email_pw-confirm-form-group">
                            <label for="normal_user_password_confirm" class="form-label">비밀번호 확인</label>
                            <input type="password" class="form-control" autocomplete="new-password" required="required"
                                   name="member_pw_confirm" id="normal_user_password_confirm">
                            <p class="error"></p>
                        </div>
                        <div class="form-group" id="signup-form_email_nickname-form-group">
                            <label for="normal_user_password_nickname" class="form-label">별명</label>
                            <p class="caption line-height-normal">2 ~ 15자 자유롭게 입력해주세요.</p>
                            <input type="text" class="form-control" autocomplete="off" required="required"
                                   name="member_nickname" id="normal_user_nickname">
                            <p class="error"></p>
                        </div>
                    </form>
                </section>
                <button id="btn-submit-signup" class="btn btn-lg btn-priority" type="submit" form="new_normal_user">회원가입하기</button>
                <p id="has-account">
                    	이미 아이디가 있으신가요?
                    <a href="gotoSignin" style="font-weight: bold; text-decoration: underline; color: black;">로그인</a>
                </p>
            </section>
        </section>
    </main>
<script type="text/javascript">
    $(".form-control").focusin(function(){
        $(this).addClass("focus-visible");
    });
    $(".form-control").focusout(function(){
        $(this).removeClass("focus-visible");
    });
    $("#signup-form_email_email-username").focusout(function(){
    	var email = $(this).val();
    	var domain = $("#signup-form_email_email-domain").val();
    	var fullId = email+"@"+domain;
    	let isExist = false;
    	var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    	if(email.length == 0) {
    		$(this).parents("div.form-group").addClass("error");
    		$(this).parents("div.form-group").find("p.error").text("이메일을 입력해주세요.");
    	} else if(email.length > 0) {
    		if(false === regEmail.test(fullId)) {
				$(this).parents("div.form-group").addClass("error");
    			$(this).parents("div.form-group").find("p.error").text("이메일 형식이 올바르지 않습니다.");
    		} else {
    			var th = $(this);
        		$.ajax({
        			url: "getList",
        			type: "POST",
        			dataType: "json",
    				success: function(redata){
    					for(var key in redata) {
    						var idDomain = key+"@"+redata[key];
    						console.log(fullId+" : "+idDomain);
    						if(fullId == idDomain) {
    							$(th).parents("div.form-group").addClass("error");
    				    		$(th).parents("div.form-group").find("p.error").text("가입된 이메일 입니다.");
    				    		isExist = true;
    						}
    					}
    					if(!isExist) {
    						$(th).parents("div.form-group").removeClass("error");
    			    		$(th).parents("div.form-group").find("p.error").text("");
    					}
    				}    			
        		});
    		}
    	} else {
    		$(this).parents("div.form-group").removeClass("error");
    		$(this).parents("div.form-group").find("p.error").text("");
    	}
    });
    $("#signup-form_email_email-domain").focusout(function(){
    	var email = $("#signup-form_email_email-username").val();
    	var domain = $(this).val();
    	var fullId = email+"@"+domain;
    	let isExist = false;
    	var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    	if(domain.length == 0) {
    		$(this).parents("div.form-group").addClass("error");
    		$(this).parents("div.form-group").find("p.error").text("이메일 형식이 올바르지 않습니다.");
    	} else if(domain.length > 0) {
    		console.log(domain.indexOf("."));
    		if(false === regEmail.test(fullId) || (domain.indexOf(".") === -1)) {
				$(this).parents("div.form-group").addClass("error");
    			$(this).parents("div.form-group").find("p.error").text("이메일 형식이 올바르지 않습니다.");
    		} else {
    			var th = $(this);
        		$.ajax({
        			url: "getList",
        			type: "POST",
        			dataType: "json",
    				success: function(redata){
    					for(var key in redata) {
    						var idDomain = key+"@"+redata[key];
    						console.log(fullId+" : "+idDomain);
    						if(fullId == idDomain) {
    							$(th).parents("div.form-group").addClass("error");
    				    		$(th).parents("div.form-group").find("p.error").text("가입된 이메일 입니다.");
    				    		isExist = true;
    						}
    					}
    					if(!isExist) {
    						$(th).parents("div.form-group").removeClass("error");
    			    		$(th).parents("div.form-group").find("p.error").text("");
    					}
    				}    			
        		});
    		}
    	} else {
    		$(this).parents("div.form-group").removeClass("error");
    		$(this).parents("div.form-group").find("p.error").text("");
    	}
    });
    $("#normal_user_password").focusout(function(){
    	var pass = $(this).val();
    	var regPw = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
    	if(pass.length == 0) {
    		$(this).closest("div").addClass("error");
    		$(this).closest("div").find("p.error").text("비밀번호를 입력해주세요.");
    	} 
    	else if(pass.length < 8) {
    		$(this).closest("div").addClass("error");
    		$(this).closest("div").find("p.error").text("비밀번호는 8글자 이상이어야 합니다.");	
    	} 
    	else if(false === regPw.test($(this).val())) {
    		$(this).closest("div").addClass("error");
    		$(this).closest("div").find("p.error").text("숫자/대문자/특수문자를 모두 포함해야 합니다.");
    	} 
    	else {
    		$(this).closest("div").removeClass("error");
    		$(this).closest("div").find("p.error").text("");
    	}
    });
    // 비밀번호 확인 체크
    $("#normal_user_password_confirm").focusout(function(){
    	var pass = $("#normal_user_password").val();
    	var pass_confirm = $(this).val();
    	if(pass_confirm.length == 0) {
    		console.log($(this).val().length);
    		$(this).closest("div").addClass("error");
    		$(this).closest("div").find("p.error").text("비밀번호 확인을 입력해주세요.");	
    	} else if(pass != pass_confirm) {
    		$(this).closest("div").addClass("error");
    		$(this).closest("div").find("p.error").text("비밀번호가 일치하지 않습니다.");	
    	} else {
    		$(this).closest("div").removeClass("error");
    		$(this).closest("div").find("p.error").text("");
    	}
    });
    $("#normal_user_nickname").focusout(function(){
    	var nickname = $(this).val();
    	let isExist = false;
    	if(nickname.length == 0) {
    		$(this).closest("div").addClass("error");
    		$(this).closest("div").find("p.error").text("별명을 입력 해주세요.");
    	} else if(nickname.length < 3) {
    		$(this).closest("div").addClass("error");
    		$(this).closest("div").find("p.error").text("별명은 최소 2글자 이상이어야 합니다.");
    	} else if(nickname.length >= 16) {
    		$(this).closest("div").addClass("error");
    		$(this).closest("div").find("p.error").text("별명은 15글자 이하로 입력해주세요.");
    	} else {
    		var th = $(this);
    		$.ajax({
    			url: "getNickname",
    			type: "POST",
    			dataType: "json",
				success: function(redata){
					for(var key in redata) {
						if(nickname == redata[key]) {
							console.log(nickname+" : "+redata[key]);
							$(th).closest("div").addClass("error");
				    		$(th).closest("div").find("p.error").text("이미 사용중인 별명입니다.");
				    		isExist = true;
						}
					}
					if(!isExist) {
						$(th).closest("div").removeClass("error");
			    		$(th).closest("div").find("p.error").text("");
					}
				}
    		});
    	}
    });
</script>
</body>
</html>