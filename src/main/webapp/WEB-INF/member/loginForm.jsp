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
<style type="text/css">
	img#naverlogin {
		cursor: pointer;
	}
</style>
</head>
<body>
<img src="${root}/image/NAVER_Icon_Green.PNG" id="naverlogin" onclick="location.href='naverlogin'" width="70"><br>
<c:if test="${userId eq null}">
        <a href="https://kauth.kakao.com/oauth/authorize?client_id=1a6e6db213064a94585972365b718e1c&redirect_uri=http://localhost:9000/member/login&response_type=code">
            <img src="${root}/image/kakaolink_btn_small.png">
        </a>
    </c:if>
    <c:if test="${userId ne null}">
        <h1>로그인 성공입니다</h1>
        <input type="button" value="로그아웃" onclick="location.href='logout'">
    </c:if>
</body>
</html>