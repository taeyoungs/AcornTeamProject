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
<style type="text/css">
input[type='number']:focus, input[type='text']:focus, input[type='password']:focus, input[type='file']:focus,
select:focus, option:focus, input[type='submit']:focus, button:focus, textarea:focus {
	outline: 0;
} 

#password_form {
	margin: 50px auto;
    padding: 30px;
    max-width: 360px;
    width: 100%;
    border-radius: 4px;
    box-sizing: border-box;
    background-color: #ffffff;
    box-shadow: 0 1px 3px 0 rgba(0,0,0,0.2);
}
#password_form>.title {
	margin-bottom: 15px;
    font-size: 24px;
}

#password_form>form>label {
	color: #424242;
    display: block;
    font-size: 14px;
}

#password_form>form>.notice {
	margin-top: 5px;
    font-size: 12px;
    color: #757575;
}

#password_form>form>input[type=text], #password_form>form>input[type=password] {
	margin: 5px 0 10px;
    width: 100%;
    padding: 0 20px;
    box-sizing: border-box;
    font-size: 16px;
    line-height: 40px;
    border: 1px solid #dcdcdc;
    height: 40px;
}
#password_form>form>input[type=submit] {
    margin-top: 15px;
    width: 100%;
    height: 40px;
    background-color: #35c5f0;
    border: none;
    border-radius: 4px;
    color: #ffffff;
    font-size: 18px;
    font-weight: 700;
    text-align: center;
    cursor: pointer;
    font-family: 'Nanum Gothic';
}
#flash_messages {
    width: 400px;
    top: 100px;
    position: fixed;
    left: 50%;
    transform: translateX(-50%);
    z-index: 200000;
    font-size: 14px;
}
#flash_messages>#flash_alert {
    background-color: #ff7d7d;
    border-color: #ff4a4a;
    color: #970000;
    opacity: 0.95;
}
#flash_messages>#flash_notice {
    background-color: #b1d8b1;
    border-color: #8fc78f;
    color: #376d37;
    opacity: 0.95;
}
#flash_messages .flash_message {
    border: 1px solid transparent;
    border-radius: 5px;
    padding: 20px;
    margin-top: 10px;
}

</style>
</head>
<body>
	<div id="password_form">
		<div class="title">비밀번호 변경</div>
		<form action="pwChange" class="edit_user" id="edit_user_${sessionScope.member_no}"
			accept-charset="UTF-8" method="post" onsubmit="return checkPw();">
			<label for="user_password">새 비밀번호</label>
			<div class="notice">8자이상 영문 대 소문자, 숫자, 특수문자를 사용하세요.</div>
			<input type="password" autocomplete="off" name="user_password" id="user_password" 
				autofocus="autofocus">
			<label for="user_password_confirm">새 비밀번호 확인</label>
			<input type="password" autocomplete="off" name="user_password_confirm"
				id="user_password_confirm">
			<input type="hidden" name="changeOk" value="" id="pwChange">
			<input type="hidden" name="member_no" value="${sessionScope.member_no}">
			<input type="submit" name="commit" value="비밀번호 변경" id="submit">
		</form>
	</div>
	<div id="flash_messages">
		<c:if test="${changeOk eq 'fail'}">
        	<div id="flash_alert" class="flash_message">
        		비밀번호는 8자이상 영문 대 소문자, 숫자, 특수문자를 사용해주세요.
        	</div>
        </c:if>
        <c:if test="${changeOk eq 'success'}">
        	<div id="flash_notice" class="flash_message">
        		비밀번호 변경이 완료되었습니다.
        	</div>
        </c:if>
    </div>
<script type="text/javascript">
$("#flash_alert").delay(1500).fadeOut();
$("#flash_notice").delay(1500).fadeOut();

function checkPw() {
	var pass1 = $("#user_password").val();
	var pass2 = $("#user_password_confirm").val();
	
	var regPw = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	
	if(pass1.length == 0 || false === regPw.test(pass1)) {
		$("#pwChange").val("no");
	} else if(pass1 == pass2) {
		$("#pwChange").val("yes");
	} else {
		$("#pwChange").val("no");
	}	
	return true;
}
</script>
</body>
</html>