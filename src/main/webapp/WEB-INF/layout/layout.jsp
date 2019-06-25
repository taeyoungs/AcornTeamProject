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
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic|Staatliches|Russo+One');
/* 	body {
		font-family: 'Nanum Gothic';
	} */
	div.layout {
		border: 1px solid gray;
		position: absolute;
	}
	#top {
		width: 100%;
		height: 80px;
		padding: 25px 60px;
		font-family: 'Russo One';
		font-size: 15px;
		position: relative;
		display: flex;
	}
	#leftmenu {
		border: 0;
		top: 85px;
		text-align: center;
		font-size: 20pt;
		width: 100%;
		heigth: 300px;
		font-family: 'Staatliches';
	}
	#main {
		top: 160px;
		width: 100%;
		height: 550px;
		font-size: 20pt;
		font-family: 'Nanum Gothic';
		font-weight: bold;
	}
	#bottom {
		text-align: center;
		font-size: 30pt;
		width: 100%;
		top: 1200px;
		font-family: 'Russo One'
	}
</style>
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
