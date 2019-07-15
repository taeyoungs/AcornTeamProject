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
						<a class="commerce-category-list__title">${currentCategory}</a>
					</h2>
					<ul class="commerce-category-tree commerce-category-list__categories">
						<c:forEach var="secondCategory" items="${secondList}">
							<li class="commerce-category-tree__entry">
								<div class="commerce-category-tree__entry__header">
									<a class="commerce-category-tree__entry__title">${secondCategory.codeNm}</a>
								</div>
							</li>
						</c:forEach>
					</ul>
							
					
					<ul class="commerce-category-list__others">
						<c:forEach var="firstCategory" items="${ctgrList}">
						<li class="commerce-category-list__others__item">
							<a href="/store/category.do?codeVal=${firstCategory.codeVal}">${firstCategory.codeVal}</a>
						</li>
						<!-- <li class="commerce-category-list__others__item">
							<a>인테리어</a>
						</li> -->
						</c:forEach>
					</ul>
				</section>
			</div>
			<!-- left menu-bar [E]-->
		</div>
	</div>
</div>
</body>
</html>