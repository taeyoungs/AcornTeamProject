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
<link rel="stylesheet" type="text/css" href="/css/store/home.css">
<script type="text/javascript" src="${root}/js/store/home.js"></script>
<body>
<main id="root" role="main">
    <div id="store-index">
        <div class="featured-banner" style="background-image: url('/image/common/Store_main_1.png')"></div>
        <section class="container store-index-section store-index-today-deal-list">
            <header class="store-index-today-deal-list__header">
                <h1 class="store-index-today-deal-list__title">오늘의 딜</h1>
                <a class="store-index-today-deal-list__detail-link" href="#">
                    <img class="clock-icon" style="width: 14px; height: 14px;" src="/image/common/alarm-clock.png">
                    최대 50% 특가
                </a>
            </header>
            <div class="store-index-today-deal-list__content row">
            	<c:forEach begin="0" end="3" varStatus="i">
                <div class="col-12 col-md-4 col-lg-3">
                    <article class="store-index-today-deal-item">
                        <a class="store-index-today-deal-item__overlay" href="#"></a>
                        <div class="store-index-today-deal-item__image">
                            <div class="production-item-image">
                                <img class="image" src="#">
                                <button class="production-item-scrap-badge production-item-image__scrap-badge" type="button">
                                    <img class="inactive-icon" style="width:24px; height: 24px" src="#">
                                    <img class="active-icon" style="width:24px; height: 24px" src="#">
                                </button>
                                <div class="today-deal-item-timer store-index-today-deal-item__image__timer" id="timer_${i.index}"> 남음</div>
                            </div>
                        </div>
                        <div class="store-index-today-deal-item__content">
                            <h1 class="store-index-today-deal-item__header">
                                <span class="store-index-today-deal-item__header__brand">사업자명</span>
                                <span class="store-index-today-deal-item__header__name">상품명</span>
                            </h1>
                            <span class="production-item-price">
                                <span class="production-item-price__rate">22%</span>
                                <span class="production-item-price__price">50,000</span>
                            </span>
                            <div class="store-index-today-deal-item__stats-pc">
                                <p class="production-item-stats production-item-stats--review">
                                    <img class="icon" src="/image/common/star.png">
                                    <strong class="avg">4.6</strong> 리뷰 24
                                </p>
                            </div>
                        </div>
                    </article>
                </div>
                </c:forEach>
            </div>
        </section>

        <section class="container store-index-section"><h1>카테고리</h1>
            <div class="category-list-wrap">
                <div class="category-list fold" style="transition-duration:0ms;transform:translateX(-0%)">
                    <div class="category-item-wrap">
                        <a href="/store/category.do?codeVal=가구">
                            <div class="category-item">
                                <img class="category-item__image" src="/image/common/bed_icon.png">
                                <div class="category-item__title">가구</div>
                            </div>
                        </a>
                    </div>
                    <div class="category-item-wrap">
                        <a href="/store/category.do?codeVal=가전">
                            <div class="category-item">
                                <img class="category-item__image" src="/image/common/fridge_icon.png">
                                <div class="category-item__title">가전</div>
                            </div>
                        </a>
                    </div>
                    <div class="category-item-wrap">
                        <a href="/store/category.do?codeVal=인테리어">
                            <div class="category-item">
                                <img class="category-item__image" src="/image/common/paint_icon.png">
                                <div class="category-item__title">인테리어</div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </section>
        
        <section class="container store-index-section"><h1>인기 키워드</h1>
            <div class="row keyword-list">
                <div class="col-6 col-md-3 keyword-wrap">
                    <a href="http://localhost:8080/store/category.do?codeVal=가구&codeSeqNo=1">
                        <div class="keyword" 
                        style="background-size: contain; background-repeat: no-repeat; background-image: url();">
                            <span style="position: relative">#내침실이 #허전할때</span>
                        </div>
                    </a>
                </div>
                <div class="col-6 col-md-3 keyword-wrap">
                    <a href="/store/category.do?codeVal=가전">
                        <div class="keyword" 
                        style="background-size: contain; background-repeat: no-repeat; background-image: url();">
                            <span style="position: relative">#뭔가살꺼 #없을까나</span>
                        </div>
                    </a>
                </div>
                <div class="col-6 col-md-3 keyword-wrap">
                    <a href="/store/ranks.do">
                        <div class="keyword" 
                        style="background-size: contain; background-repeat: no-repeat; background-image: url();">
                            <span style="position: relative">#인기순위 #다시보기</span>
                        </div>
                    </a>
                </div>
                <div class="col-6 col-md-3 keyword-wrap">
                    <a href="#">
                        <div class="keyword" 
                        style="background-size: contain; background-repeat: no-repeat; background-image: url();">
                            <span style="position: relative">#혼자하는 #인테리어</span>
                        </div>
                    </a>
                </div>   
            </div>
        </section>
        <section class="container store-index-section store-index-product-list"><h1>인기 상품</h1>
            <div class="row">
            	<c:forEach items="${list }" var="list" begin="0" end="3">
                <div class="col-6 col-md-3 product-item-wrap">
                   <article class="production-item">
                       <a class="production-item__overlay" href="#"></a>
                       <div class="production-item-image production-item__image">
                           <img class="image" src="${list.prodImage }">
                           <button class="production-item-scrap-badge production-item-image__scrap-badge" type="button">
                                <img class="inactive-icon" style="width:24px; height: 24px" src="#">
                                <img class="active-icon" style="width:24px; height: 24px" src="#">
                           </button>
                       </div>
                       <div class="production-item__content">
                           <h1 class="production-item__header">
                               <span class="production-item__header__brand">${list.prodSeller }</span>
                               <span class="production-item__header__name">${list.prodTitle }</span>
                           </h1>
                           <span class="production-item-price">
                               <span class="production-item-price__rate">${list.discountRate }%</span>
                               <span class="production-item-price__price"><fmt:formatNumber value="${list.prodPrice }" pattern="#,###"/></span>
                           </span>
                           <c:if test="${list.reviewCnt!=0}">
                           <p class="production-item-stats production-item-stats--review">
                               <img class="icon" width="24px" height="24px" src="/image/common/star.png">
                               <strong class="avg">4.5</strong> 리뷰 14
                           </p>
                           </c:if>
                       </div>
                   </article>
               </div> 
               </c:forEach>
            </div>
        </section>
    </div>
</main>
</body>
</html>