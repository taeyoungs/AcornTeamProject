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
             	</div>
                    
                <div class="sticky-container category-feed__content__filter-container"
                    style="position: sticky; top: 0px;">
                    <div class="sticky-child category-feed__content__filter-wrap" style="position: relative;">
                    	<div class="filter">
                    		<div class="filter-bar category-feed-filter-bar">
                    			<div class="filter-bar__control-list">
                    				<ul class="filter-bar__control-list__left">
                    					<li class="filter-bar__control-list__item">
                    						<div class="drop-down panel-drop-down filter-bar-control">
                    							<button class="button button--color-gray-4 button--size-50 button--shape-4 filter-bar-control__button">
                    								가격
                    								<svg class="icon" width="12" height="12" viewBox="0 0 12 12" fill="currentColor">
                    									<path d="M6.069 6.72l4.123-3.783 1.216 1.326-5.32 4.881L.603 4.273l1.196-1.346z"></path>
                    								</svg>
                    							</button>
                    						</div>
                    					</li>
                    				</ul>
                    			</div>
                    			
                    			<div class="category-feed-filter-bar__secondary">
                    				<p class="category-feed-filter-bar__secondary__summary">
                    					전체 &nbsp; <fmt:formatNumber value="${totalCount}" pattern="#,###"/>
                    				</p>
                    				<div class="category-feed-filter-bar__secondary__right">
                    					<div class="category-feed-filter-bar__secondary__right__item">
                    						<div class="drop-down panel-drop-down filter-bar-control">
                    							<button class="filter-bar-order-button">
                    								인기순
                    								<svg class="caret" width="8" height="8" viewBox="0 0 8 8" preserveAspectRatio="xMidYMid meet">
                    									<path fill="#BDBDBD" d="M0 2l4 4 4-4z"></path>
                    								</svg>
                    							</button>
                    						</div>
                    					</div>
                    				</div>
                    			</div>
                    			
                    			<ul class="filter-bar__tag-list"></ul>
                    		</div>
                    	</div>
                    </div>
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
                                            <strong>
                                            	<fmt:formatNumber value="${prod.prodPrice}" pattern="#,###"/>
                                            </strong>
                                        </div>
                                    </div>
                                    <div class="product-item__info__col">
                                        <div class="product-item__info__stats review">
                                        	<svg width:"24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet" style="color: rgb(53, 197, 240); width: 12px; height: 12px;">
                                        		<path fill="currentColor" fill-rule="evenodd" d="M12 19.72l-5.677 2.405c-.76.322-1.318-.094-1.247-.906l.533-6.142-4.042-4.656c-.54-.624-.317-1.283.477-1.467l6.006-1.39L11.23 2.28c.426-.707 1.122-.699 1.542 0l3.179 5.282 6.006 1.391c.805.187 1.011.851.477 1.467l-4.042 4.656.533 6.142c.072.822-.497 1.224-1.247.906L12 19.72z"></path>
                                        	</svg>
                                        	<strong>점수</strong>
                                        	리뷰 ${prod.reviewCnt}
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