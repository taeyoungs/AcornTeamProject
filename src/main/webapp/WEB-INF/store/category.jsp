<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
										<c:if test="${!empty codeSeqNm}">
                                    	<path fill = "#424242" d="M4.95 4L2.12 1.19l.7-.71 3.54 3.54-3.53 3.53-.7-.7z"></path>
                                    	</c:if>
                                    </svg>
                                </li>
                               	<c:if test="${!empty codeSeqNm}">
                                <li class="commerce-category-breadcrumb__entry">
                                	<a class="link">${codeSeqNm}</a>
                                </li>
                                </c:if>
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
                    								<span id="sortBtnTxt">인기순</span>
                    								<svg class="caret" width="8" height="8" viewBox="0 0 8 8" preserveAspectRatio="xMidYMid meet">
                    									<path fill="#BDBDBD" d="M0 2l4 4 4-4z"></path>
                    								</svg>
                    							</button>
                    						</div>
                    					</div>
                    				</div>
                    			</div>
                    			
                    			<ul class="filter-bar__tag-list">
                    				<c:if test="${!empty minPrice}">
                    				<li class="filter-bar__tag-list__item">
                    					<button class="button button--color-blue button--size-50 button--shape-4 filter-bar__tag" type="button" onclick="resetMinPrice()">
                    						<fmt:formatNumber value="${minPrice}" pattern="#,###"/>원 이상
                    						<svg class="icon" width="12" height="12" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">
                    							<path fill="#FFF" d="M6 4.94L3.879 2.817l-1.061 1.06L4.939 6 2.818 8.121l1.06 1.061L6 7.061l2.121 2.121 1.061-1.06L7.061 6l2.121-2.121-1.06-1.061L6 4.939zM6 12A6 6 0 1 1 6 0a6 6 0 0 1 0 12z"></path>
                    						</svg>
                    					</button>
                    				</li>
                    				</c:if>
                    				<c:if test="${!empty maxPrice}">
                    				<li class="filter-bar__tag-list__item">
                    					<button class="button button--color-blue button--size-50 button--shape-4 filter-bar__tag" type="button" onclick="resetMaxPrice()">
                    						<fmt:formatNumber value="${maxPrice}" pattern="#,###"/>원 이하
                    						<svg class="icon" width="12" height="12" viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">
                    							<path fill="#FFF" d="M6 4.94L3.879 2.817l-1.061 1.06L4.939 6 2.818 8.121l1.06 1.061L6 7.061l2.121 2.121 1.061-1.06L7.061 6l2.121-2.121-1.06-1.061L6 4.939zM6 12A6 6 0 1 1 6 0a6 6 0 0 1 0 12z"></path>
                    						</svg>
                    					</button>
                    				</li>
                    				</c:if>
                    				<c:if test="${!empty minPrice || maxPrice}">
                    				<li class="filter-bar__tag-list__item">
                    					<button class="filter-bar__tag-list__clear" type="button" onclick="resetOptions()">초기화</button>
                    				</li>
                    				</c:if>
                    			</ul>
                    		</div>
                    	</div>
                    </div>
                    
                  	<!-- 가격 HOVER -->
					<form action="/store/category.do" id="frm">
					<div id="select_price">
						<div class="popout popout--prepared popout--axis-1 popout--dir-2 popout--cross-dir-1"
							data-popout="true" style="position: absolute; z-index: 1000; left: 35px; top: 60px; transform: translateX(-50%);">
							<div class="animated-popout drop-down__content panel-drop-down__content"><!--  open open-active -->
								<div class="drop-down-panel" data-panel-title="가격" data-panel-parents="">
									<section class="panel-price-range-control">
											<div class="panel-price-range-control__header"></div>
											<div class="panel-price-range-control__input-row">
												<span class="panel-price-range-control__input-row__cell">
													<span class="panel-price-range-control__input-row__header">최소</span>
													<span class="panel-price-range-control__input-row__input-wrap">
														<input type="text" width="5" placeholder="1,234" class="panel-price-range-control__input-row__input"
														name="minPrice" value="${minPrice}" id="minPrice">
														<input type="hidden" name="codeVal" value="${currentCategory}">
														<input type="hidden" name="codeSeqNo" value="${codeSeqNo}">
												</span> 
												<span class="panel-price-range-control__input-row__footer">원</span>
												</span> 
												<span class="panel-price-range-control__input-row__separator">~</span>
												<span class="panel-price-range-control__input-row__cell">
													<span class="panel-price-range-control__input-row__header">최대</span>
													<span class="panel-price-range-control__input-row__input-wrap">
														<input type="text" width="5" placeholder="1,234,567"
														class="panel-price-range-control__input-row__input"
														name="maxPrice" value="${maxPrice}" id="maxPrice">
												</span> <span class="panel-price-range-control__input-row__footer">원</span>
												</span>
											</div>
											

										<!-- <ul class="panel-entry-list panel-price-range-control__list">
									<li class="panel-entry-list__item-wrap"><button
											class="panel-entry-list__item" type="button">
											<div class="panel-entry-list__item__header">
												<span class="panel-entry-list__item__title">
												<div class="panel-price-range-control__list-item">
														<span class="bullet"></span>50,000원 이하
													</div></span>
											</div>
										</button></li>
									<li class="panel-entry-list__item-wrap"><button
											class="panel-entry-list__item" type="button">
											<div class="panel-entry-list__item__header">
												<span class="panel-entry-list__item__title">
												<div class="panel-price-range-control__list-item">
														<span class="bullet"></span>50,000원 ~ 100,000원
													</div></span>
											</div>
										</button></li>
									<li class="panel-entry-list__item-wrap"><button
											class="panel-entry-list__item" type="button">
											<div class="panel-entry-list__item__header">
												<span class="panel-entry-list__item__title">
												<div class="panel-price-range-control__list-item">
														<span class="bullet"></span>100,000원 ~ 200,000원
													</div></span>
											</div>
										</button></li>
									<li class="panel-entry-list__item-wrap"><button
											class="panel-entry-list__item" type="button">
											<div class="panel-entry-list__item__header">
												<span class="panel-entry-list__item__title">
												<div class="panel-price-range-control__list-item">
														<span class="bullet"></span>200,000원 ~ 300,000원
													</div></span>
											</div>
										</button></li>
									<li class="panel-entry-list__item-wrap">
									<button class="panel-entry-list__item" type="button">
											<div class="panel-entry-list__item__header">
												<span class="panel-price-range-control__list-item">
														<span class="bullet"></span>300,000원 ~ 400,000원
													</div></span>
											</div>
										</button></li>
									<li class="panel-entry-list__item-wrap">
									<button class="panel-entry-list__item" type="button">
											<div class="panel-entry-list__item__header">
												<span class="panel-entry-list__item__title">
												<div class="panel-price-range-control__list-item">
														<span class="bullet"></span>400,000원 ~ 500,000원
													</div></span>
											</div>
										</button></li>
									<li class="panel-entry-list__item-wrap"><button
											class="panel-entry-list__item" type="button">
											<div class="panel-entry-list__item__header">
												<span class="panel-entry-list__item__title">
												<div class="panel-price-range-control__list-item">
														<span class="bullet"></span>500,000원 ~ 600,000원
													</div></span>
											</div>
										</button></li>
									<li class="panel-entry-list__item-wrap"><button
											class="panel-entry-list__item" type="button">
											<div class="panel-entry-list__item__header">
												<span class="panel-entry-list__item__title">
												<div class="panel-price-range-control__list-item">
														<span class="bullet"></span>600,000원 ~ 700,000원
													</div></span>
											</div>
										</button></li>
									<li class="panel-entry-list__item-wrap"><button
											class="panel-entry-list__item" type="button">
											<div class="panel-entry-list__item__header">
												<span class="panel-entry-list__item__title">
												<div class="panel-price-range-control__list-item">
														<span class="bullet"></span>700,000원 ~ 800,000원
													</div></span>
											</div>
										</button></li>
									<li class="panel-entry-list__item-wrap"><button
											class="panel-entry-list__item" type="button">
											<div class="panel-entry-list__item__header">
												<span class="panel-entry-list__item__title">
												<div class="panel-price-range-control__list-item">
														<span class="bullet"></span>800,000원 ~ 900,000원
													</div></span>
											</div>
										</button></li>
									<li class="panel-entry-list__item-wrap"><button
											class="panel-entry-list__item" type="button">
											<div class="panel-entry-list__item__header">
												<span class="panel-entry-list__item__title">
												<div class="panel-price-range-control__list-item">
														<span class="bullet"></span>900,000원 ~ 1,000,000원
													</div></span>
											</div>
										</button></li>
									<li class="panel-entry-list__item-wrap"><button
											class="panel-entry-list__item" type="button">
											<div class="panel-entry-list__item__header">
												<span class="panel-entry-list__item__title">
												<div class="panel-price-range-control__list-item">
														<span class="bullet"></span>1,000,000원 이상
													</div></span>
											</div>
										</button>
										</li>
								</ul> -->
									</section>
								</div>
							</div>
						</div>
					</div>
					<!-- 가격 HOVER -->

					<!-- 정렬 HOVER -->
					<div id="select_menu">
						<div class="popout popout--prepared popout--axis-1 popout--dir-2 popout--cross-dir-2"
							data-popout="true" style="position: absolute; z-index: 1000; top: 100px; right: 0px;">
							<div class="animated-popout drop-down__content panel-drop-down__content"><!-- open open-active -->
								<div class="drop-down-panel" data-panel-title="정렬" data-panel-parents="">
									<ul class="panel-entry-list">
										<li class="panel-entry-list__item-wrap">
											<button class="panel-entry-list__item <c:if test="${sorting eq 'pop'}">selected</c:if>" type="button" onclick="changeSort('pop')">
												<div class="panel-entry-list__item__header">
													<span class="panel-entry-list__item__title">인기순</span>
												</div>
											</button>
										</li>
										<li class="panel-entry-list__item-wrap">
											<button class="panel-entry-list__item <c:if test="${sorting eq 'lowPrice'}">selected</c:if>" type="button" onclick="changeSort('lowPrice')">
												<div class="panel-entry-list__item__header">
													<span class="panel-entry-list__item__title">낮은가격순</span>
												</div>
											</button>
										</li>
										<li class="panel-entry-list__item-wrap">
											<button class="panel-entry-list__item <c:if test="${sorting eq 'highPrice'}">selected</c:if>" type="button" onclick="changeSort('highPrice')">
												<div class="panel-entry-list__item__header">
													<span class="panel-entry-list__item__title">높은가격순</span>
												</div>
											</button>
										</li>
										<li class="panel-entry-list__item-wrap">
											<button class="panel-entry-list__item <c:if test="${sorting eq 'new'}">selected</c:if>" type="button" onclick="changeSort('new')">
												<div class="panel-entry-list__item__header">
													<span class="panel-entry-list__item__title">최신순</span>
												</div>
											</button>
										</li>
									</ul>
									<input type="hidden" name="sorting" value="${sorting}" id="sorting"/>
									<input type="hidden" name="currentPage" value="${currentPage}" id="currentPage"/>
								</div>
							</div>
						</div>
					</div>
					</form>
					<!-- 정렬 HOVER -->
                </div>
                
                <ul class="category-feed__content__content row">
                	<c:forEach var="prod" items="${prodList}">
                	<li class="col-6 col-lg-4">
                        <div class="product-item">
                            <div class="product-item__image">
                                <a href="/store/selling.do?prodNo=${prod.prodNo}">
                                    <img class="image" src="${prod.prodImage}"/>
                                </a>
                            </div>
                            <a href="/store/selling.do?prodNo=${prod.prodNo}">
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
                                        	<!-- 별점&리뷰 없는 경우 상품 조회수 출력 -->
                                       		<c:if test="${prod.reviewCnt==0}">
                                        		조회 ${prod.prodHits}
                                        	</c:if>
                                        	<!-- 별점&리뷰 있는 경우 평균 별점 & 리뷰수 출력 -->
                                        	<c:if test="${prod.reviewCnt!=0}">
	                                        	<svg width:"24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet" style="color: rgb(53, 197, 240); width: 12px; height: 12px;">
	                                        		<path fill="currentColor" fill-rule="evenodd" d="M12 19.72l-5.677 2.405c-.76.322-1.318-.094-1.247-.906l.533-6.142-4.042-4.656c-.54-.624-.317-1.283.477-1.467l6.006-1.39L11.23 2.28c.426-.707 1.122-.699 1.542 0l3.179 5.282 6.006 1.391c.805.187 1.011.851.477 1.467l-4.042 4.656.533 6.142c.072.822-.497 1.224-1.247.906L12 19.72z"></path>
	                                        	</svg>
                                        		<strong>${prod.starGrade/prod.reviewCnt}</strong>
                                        		리뷰 ${prod.reviewCnt} 조회 ${prod.prodHits}
                                        	</c:if>
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