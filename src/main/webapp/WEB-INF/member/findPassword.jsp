<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<link rel="stylesheet" type="text/css" href="${root}/css/login/signin.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
<style type="text/css">
body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, input, textarea, p, blockquote, th, td {
     margin: 0;
     padding: 0;
}
html {
    color: #424242;
    background: #FFF;
}

.sign-in-form-wrap {
	display: flex;
	flex-direction: column;
	flex: 1 0 auto;
	justify-content: center;
}

.sign-in-form {
	width: 100%;
    max-width: 360px;
    padding: 40px 30px;
    margin: 0 auto;
    box-sizing: border-box;
}
.sign-in-form_header {
	display: block;
    margin: 0 0 30px;
}
.sign-in-form_header_link {
	display: block;
    text-align: center;
}
.sign-in-form_header_link>img {
	width: 110px;
}
.form-control {
	display: block;
    box-sizing: border-box;
    height: 40px;
    width: 100%;
    padding: 0 15px;
    line-height: 40px;
    border-radius: 4px;
    border: solid 1px #dbdbdb;
    background-color: white;
    color: #424242;
    font-size: 12px;
}
.sign-in-form_form_input {
	display: block;
    width: 100%;
    height: 50px;
    margin: 0;
    font-size: 15px;
    line-height: 50px;
    color: #424242;
}
.btn-priority {
	background-color: #35C5F0;
    border-color: #35C5F0;
    color: white;
}
.btn {
	box-sizing: border-box;
    display: inline-block;
    padding: 0;
    border-width: 1px;
    border-style: solid;
    text-align: center;
    border-radius: 4px;
    font-weight: bold;
}
.sign-in-form_form_submit {
	display: block;
    width: 100%;
    height: 50px;
    margin: 20px 0;
    padding: 13px 15px;
    font-size: 17px;
    line-height: 1.41;
    font-family: 'Nanum Gothic';
}
input[type=text] {
	outline: 0;
}


</style>
</head>
<body>
<main role="main">
	<div class="sign-in-form-wrap" style="margin-top: 100px;">
		<div class="sign-in-form">
			<h1 class="sign-in-form_header">
				<a href="${root}/main.do" class="sign-in-form_header_link">
					<img src="${root}/image/common/logo.png">
				</a>
			</h1>
			<form class="sign-in-form_form" id="new_user" action="sendPwEmail" accept-charset="UTF-8"
					method="post">
				<input type="text" placeholder="이메일" class="sign-in-form_form_input form-control"
					name="email" id="user_email" autofocus="autofocus">
				<input type="submit" name="commit" value="이메일로 비밀번호 찾기"
					class="sign-in-form_form_submit btn btn-priority">
			</form>
		</div>
	</div>
</main>
</body>
</html>