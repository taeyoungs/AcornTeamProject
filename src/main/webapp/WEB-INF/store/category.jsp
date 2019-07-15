<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<body>
<!-- 카테고리 whole wrap -->
<div class="category-feed-container">
	<div class="category-feed-wrap container">
		<div class="category-feed row">
		<!-- left menu-bar [S]-->
			<div class="category-feed__side-bar col-12 col-md-3">
				<section class="commerce-category-list">
					<h2 class="commerce-category-list__title">
						<a href="/store/category.do?codeVal=${currentCategory}" class="commerce-category-list__title">${currentCategory}</a>
					</h2>
					<ul class="commerce-category-tree commerce-category-list__categories">
						<c:forEach var="secondCategory" items="${secondList}">
							<li class="commerce-category-tree__entry">
								<div class="commerce-category-tree__entry__header">
									<a href="/store/category.do?codeVal=${currentCategory}&codeSeqNo=${secondCategory.codeSeqNo}" class="commerce-category-tree__entry__title">${secondCategory.codeNm}</a>
								</div>
							</li>
						</c:forEach>
					</ul>		
					
					<ul class="commerce-category-list__others">
						<c:forEach var="firstCategory" items="${ctgrList}">
						<li class="commerce-category-list__others__item">
							<a href="/store/category.do?codeVal=${firstCategory.codeVal}">${firstCategory.codeVal}</a>
						</li>
						</c:forEach>
					</ul>
				</section>
			</div>
			<!-- left menu-bar [E]-->
			

            <!-- right main content [S] -->
			<div class="category-feed__content col-12 col-md-9">  
            	<div class="commerce-category-header category-feed__content__header">
                	<div class="commerce-category-header__breadcrumb-wrap">
                        <nav class="commerce-category-breadcrumb-wrap commerce-category-header__breadcrumb">
                            <ol class="commerce-category-breadcrumb">
                                <li class="commerce-category-breadcrumb__entry">
                                    <a class="link" href="">혼자하는 인테리어 스토어홈</a>
                                    <svg class="icon" width="8" height="8" viewBox="0 0 8 8">
                                    	<path fill = "#424242" d="M4.95 4L2.12 1.19l.7-.71 3.54 3.54-3.53 3.53-.7-.7z"></path>
                                    </svg>
                                </li>
                                <li class="commerce-category-breadcrumb__entry">
                                	<a class="link">${currentCategory}</a>
                                	<svg class="icon" width="8" height="8" viewBox="0 0 8 8">
                                    	<path fill = "#424242" d="M4.95 4L2.12 1.19l.7-.71 3.54 3.54-3.53 3.53-.7-.7z"></path>
                                    </svg>
                                </li>
                                <li class="commerce-category-breadcrumb__entry">
                                	<a class="link">${secondList[0].codeNm}</a>
                                </li>
                            </ol>
                        </nav>
                    </div>
                	<nav class="commerce-category-header__menu-wrap"></nav>
             	</div>
                    
                <div class="sticky-container category-feed__content__filter-container"
                    style="position: sticky; top: 0px;">
                </div>
                <ul class="category-feed__content__content row">
                	<c:forEach var="prod" items="${prodList}">
                	<li class="col-6 col-lg-4">
                        <div class="product-item">
                            <div class="product-item__image">
                                <a href="#">
                                    <img class="image" src="${prod.prodImage}"/>
                                </a>
                            </div>
                            <a href="#">
                                <div class="product-item__info">
                                    <div class="product-item__info__title">
                                        <p class="product-item__info__title__brand">${prod.prodSeller}</p>
                                        <p>${prod.prodTitle}</p>
                                    </div>
                                    <div class="product-item__info__col">
                                        <div class="product-item__info__price">
                                            <span class="discount-rate">${prod.discountRate}%</span>
                                            <strong>${prod.prodPrice}</strong>
                                        </div>
                                    </div>
                                    <div class="product-item__info__col">
                                        <div class="product-item__info__stats review">리뷰
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </li>
                    </c:forEach>
                </ul>
			</div>
	    	<!-- right main content [E] -->
			
		</div>
	</div>
</div>
</body>
</html>