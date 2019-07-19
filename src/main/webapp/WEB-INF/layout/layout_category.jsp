<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="${root}/css/store/commerce.css">
<link rel="stylesheet" type="text/css" href="${root}/css/store/button.css">
<link rel="stylesheet" type="text/css" href="${root}/css/store/selling.css">
<link rel="stylesheet" type="text/css" href="${root}/css/common.css">
<link rel="stylesheet" type="text/css" href="${root}/css/main/main_media.css">
<link rel="stylesheet" type="text/css" href="${root}/css/main/bucket_ui.css">
<link rel="stylesheet" type="text/css" href="${root}/css/main/components.css">
<title>Insert title here</title>
<c:set var="root" value="<%=request.getContextPath() %>"/>
</head>
<body>
	<div id="top" class="layout">
		<tiles:insertAttribute name="top"/>
	</div>
	<div id="main" class="layout">
		<tiles:insertAttribute name="main"/>
	</div>
	<div id="bottom" class="layout">
		<tiles:insertAttribute name="bottom"/>
	</div>
</body>
</html>