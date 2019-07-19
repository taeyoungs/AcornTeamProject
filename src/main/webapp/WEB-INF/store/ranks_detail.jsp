<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<link rel="stylesheet" type="text/css" href="/css/store/ranks_detail.css">
<body>
<main role="main" id="root">
	<div class="rankingDetailFeed">
		<section class="ranking-detail-feed container">
			<h1 class="ranking-detail-feed__title">${title } Best Item</h1>
			<p class="ranking-detail-feed__update-time">최근 업데이트</p>
			<div>
				<div class="ranking-detail-feed__product-wrap">
				<c:forEach items="${list }" var="list" varStatus="status" begin="0" end="99">
					<div class="ranking-product-item-wrap">
						<a class="ranking-product-item__link" href="#"></a>
						<div class="ranking-product-item__number"></div>
						<div class="ranking-product-item__img-wrap">
							<div class="production-item-image">
								<img class="image" src="${list.prodImage }">
								<span class="production-item-banner production-item-image__banner"></span>
								<button class="production-item-scrap-badge production-item-image__scrap-badge">
									<img src="#" style="width:24px; height:24px;">
								</button>
							</div>
						</div>
						<div class="ranking-product-item__content">
							<h1 class="ranking-product-item__header">
								<span class="ranking-product-item__header__brand">${list.prodSeller }</span>
								<span class="ranking-product-item__header__name">${list.prodTitle }</span>
							</h1>
							<div class="ranking-product-item__price">
								<span class="production-item-price">
									<span class="production-item-price__rate">${list.discountRate }
										<span class="percentage">%</span>
									</span>
									<span class="production-item-price__price"><fmt:formatNumber value="${list.prodPrice }" pattern="#,###"/></span>
								</span>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</section>	
	</div>
</main>
</body>
</html>