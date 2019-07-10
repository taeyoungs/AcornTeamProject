<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<c:set var="root" value="<%=request.getContextPath() %>"/>
<style type="text/css">
	#top {
		width: 100%;
		height: auto;
	}
	#navi {
		width: 100%;
	}
	#main {
		width: 100%;
		height: 550px;
	}
</style>
</head>
<body>
<div id="top" class="layout">
	<tiles:insertAttribute name="top"/>
</div>
<div id="navi" class="layout">
	<tiles:insertAttribute name="navi"/>
</div>
<div id="main" class="layout">
	<tiles:insertAttribute name="main"/>
</div>
</body>
</html>
