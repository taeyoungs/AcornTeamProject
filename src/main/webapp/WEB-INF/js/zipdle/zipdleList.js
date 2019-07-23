var conditionArray = ['nl', 'nl', 'nl'];

$(function(){
	// 집들이 카테고리 들어오는 순간 전체 데이터 불러오는 ajax
	conditionArray[0] = '최신순';
	getList(conditionArray);
	
	$(window).resize(function(){
		var width_size = $(window).width();
//		console.log(width_size);
	});
	
	$("ul.filter-bar_control-list_left li").hover(function(){
		var temp = $(this).find("div button").text();
		var hoverMenu = "";
//		console.log(temp.trim());
		var offsetTop = $(this).offset().top.toFixed(1);
		var offsetLeft = $(this).offset().left.toFixed(1);
		
		if(temp.trim() == '정렬') {
			var offsetLeft1 = parseInt(offsetLeft)+100;
			var offsetTop1 = parseInt(offsetTop)+33;
			
			hoverMenu += `
				<div>
					<div class="popout popout-prepared search-case-1" style="position: absolute; z-index: 1000; left: `+offsetLeft1+`px; top: `+offsetTop1+`px; transform: translateX(-50%);">
						<div class="animated-popout drop-down_content panel-drop-down_content open-active">
							<div class="drop-down-panel" data-panel-title="정렬">
								<ul class="panel-entry-list">
									<li class="panel-entry-list_item-wrap">
										<button class="panel-entry-list_item" type="button">
											<div class="panel-entry-list_item_header">
												<span class="panel-list-list_item_title">최신순</span>
											</div>
										</button>
									</li>
									<li class="panel-entry-list_item-wrap">
										<button class="panel-entry-list_item" type="button">
											<div class="panel-entry-list_item_header">
												<span class="panel-list-list_item_title">좋아요순</span>
											</div>
										</button>
									</li>
									<li class="panel-entry-list_item-wrap">
										<button class="panel-entry-list_item" type="button">
											<div class="panel-entry-list_item_header">
												<span class="panel-list-list_item_title">조회순</span>
											</div>
										</button>
									</li>
								</ul>
							</div>
				
			`
			
		} else if(temp.trim() == '주거형태') {
			var offsetLeft2 = parseInt(offsetLeft)+50;
			var offsetTop2 = parseInt(offsetTop)+33;
			
			hoverMenu += `
				<div>
					<div class="popout popout-prepared search-case-2" style="position: absolute; z-index: 1000; left: `+offsetLeft2+`px; top: `+offsetTop2+`px; transform: translateX(-50%);">
						<div class="animated-popout drop-down_content panel-drop-down_content open-active">
							<div class="drop-down-panel" data-panel-title="주거형태">
								<ul class="panel-entry-list">
									<li class="panel-entry-list_item-wrap">
										<button class="panel-entry-list_item" type="button">
											<div class="panel-entry-list_item_header">
												<span class="panel-list-list_item_title">원룸</span>
											</div>
										</button>
									</li>
									<li class="panel-entry-list_item-wrap">
										<button class="panel-entry-list_item" type="button">
											<div class="panel-entry-list_item_header">
												<span class="panel-list-list_item_title">투룸</span>
											</div>
										</button>
									</li>
								</ul>
							</div>
			`
		} else if(temp.trim() == '평수') {
			var offsetLeft3 = parseInt(offsetLeft)+50;
			var offsetTop3 = parseInt(offsetTop)+33;
			
			hoverMenu += `
				<div>
					<div class="popout popout-prepared search-case-2" style="position: absolute; z-index: 1000; left: `+offsetLeft3+`px; top: `+offsetTop3+`px; transform: translateX(-50%);">
						<div class="animated-popout drop-down_content panel-drop-down_content open-active">
							<div class="drop-down-panel" data-panel-title="평수">
								<ul class="panel-entry-list">
									<li class="panel-entry-list_item-wrap">
										<button class="panel-entry-list_item" type="button">
											<div class="panel-entry-list_item_header">
												<span class="panel-list-list_item_title">10평 미만</span>
											</div>
										</button>
									</li>
									<li class="panel-entry-list_item-wrap">
										<button class="panel-entry-list_item" type="button">
											<div class="panel-entry-list_item_header">
												<span class="panel-list-list_item_title">10평 이상 20평 미만</span>
											</div>
										</button>
									</li>
									<li class="panel-entry-list_item-wrap">
										<button class="panel-entry-list_item" type="button">
											<div class="panel-entry-list_item_header">
												<span class="panel-list-list_item_title">20평 이상</span>
											</div>
										</button>
									</li>
								</ul>
							</div>
			`
		}
		
		hoverMenu += `
					</div>
				</div>
			</div>
		`
		$("div#main").append(hoverMenu);
		$(".animated-popout").addClass("open");
	}, function(){
		if(!clsIsHovered("popout.popout-prepared")) {
			$("main[role='main']").next().remove();
		}

		$(".popout.popout-prepared").mouseleave(function(){
			$("main[role='main']").next().remove();
		});
		
	});
	
	$(document).on('mouseover', 'ul.panel-entry-list li', function(){
		$(this).find("button").css({
    		"background": "#EBFBFF",
    		"font-weight": "bold"
    	});
	});
	$(document).on('mouseout', 'ul.panel-entry-list li', function(){
		$(this).find("button").css({
			"background": "#fff",
    		"font-weight": "normal"
    	});
	});
	
	$(document).on('click', 'ul.panel-entry-list li', function(){
		
		// 현재는 active 클래스 의미 없음
		$(this).addClass("active");
		
		// 누른 조건 text
		var thCategory = $(this).find("button div span").text().trim();
		
		// 메뉴에 active 클래스 부여
		var activeCls = $(this).parents(".drop-down-panel").attr("data-panel-title");
		var btnlen = $(".filter-bar-control_button").length;
		console.log($(".filter-bar-control_button").eq(0));
		for(var i=0; i<btnlen; i++) {
			var btnCate = $(".filter-bar-control_button").eq(i).text().trim();
			if(activeCls == btnCate && thCategory != '최신순') {
				$(".filter-bar-control_button:contains('"+activeCls+"')").removeClass("button-gray");
				$(".filter-bar-control_button:contains('"+activeCls+"')").addClass("active");
				$(".filter-bar-control_button:contains('"+activeCls+"')").addClass("button-light-blue");
				$(".filter-bar-control_button:contains('"+activeCls+"') img").attr("src", "/image/common/down-arrow-lightblue.png");
			}
		}
		
		var condition = "";
		
		console.log($(this).find("button div span").text());
		
		// conditionArray[0] : 기존에 걸려있던 조건
		// thCategory : 새로 클릭한 조건
		// removeBtnGray() : tag list 전체 삭제 (초기화 버튼이랑 동일)
		// changeTaglist() : tag list change or append
		console.log(thCategory);
		// 1. 정렬 조건 누른 경우
		if(thCategory == '최신순' || thCategory == '좋아요순' || thCategory == '조회순') {
			// 누른 정렬 조건이 기존에 걸려있던 정렬 조건과 다를 경우
			if(conditionArray[0] != thCategory && thCategory != '최신순') {
				// 기존 정렬 tag list가 존재하는 경우
				if($(".filter-bar_tag:contains('"+conditionArray[0]+"')").length > 0) {
					changeTaglist(conditionArray[0] , thCategory);
				// 존재하지 않는 경우
				} else {
					appendTag(thCategory);
				}
				
				conditionArray[0] = thCategory;
				getList(conditionArray);
				console.log("conditionArray[0] : "+conditionArray[0]);
			} else {
				// **** 누른 정렬 조건이 기존 정렬 조건과 같은 경우
				// default는 삭제
				console.log(conditionArray[0]);
				// 조건이 정렬 조건 1개밖에 없을 경우 -> 같은 조건 두번 누를 경우엔 조건 삭제
				if(conditionArray[1] == 'nl' && conditionArray[2] == 'nl') {
					// tag list 전체 삭제
					addBtnGray();
					conditionArray[0] = '최신순';
					getList(conditionArray);
				} else {
					// 조건 종류가 2가지 이상일 경우
					if(conditionArray[1] != 'nl' || conditionArray[2] != 'nl') {
						$(".filter-bar_tag:contains('"+conditionArray[0]+"')").parent().remove();
						addWhichBtnGray(activeCls);
						conditionArray[0] = '최신순';
						getList(conditionArray);
					}
				}
			}
		// 2. 거주형태 조건 누른 경우
		} else if(thCategory == '원룸' || thCategory == '투룸') {
			// 기존 거주형태 조건이 존재하며 누른 거주형태 조건과 일치하지 않을 경우
			if(conditionArray[1] != 'nl' && conditionArray[1] != thCategory) {
				// 기존 거주형태 tag list가 존재하는 경우
				if($(".filter-bar_tag:contains('"+conditionArray[1]+"')").length > 0) {
					changeTaglist(conditionArray[1] , thCategory);
				// 존재하지 않는 경우
				} else {
					appendTag(thCategory);
				}
				
				conditionArray[1] = thCategory;
				getList(conditionArray);
				console.log("conditionArray[1] : "+conditionArray[1]);
			} else {
				// 기존 조건이 없을 경우
				if(conditionArray[1] == 'nl') {
					conditionArray[1] = thCategory;
					appendTag(thCategory);
					getList(conditionArray);
				// 기존 조건 not null, 누른 조건이 기존 조건과 동일
				} else if(conditionArray[1] != 'nl' && conditionArray[1] == thCategory) {
					// 누른 조건과 일치하는 기존 조건이 이미 있는 경우
					// [2] 조건만 존재하는 경우
					if(conditionArray[0] == '최신순' && conditionArray[2] == 'nl') {
						addBtnGray();
					} else {
					// [2] 조건 이외에 다른 조건이 있는 경우
						$(".filter-bar_tag:contains('"+conditionArray[1]+"')").parent().remove();
						addWhichBtnGray(activeCls);
					}
					$(".filter-bar_tag:contains('"+conditionArray[1]+"')").parent().remove();
					addWhichBtnGray(activeCls);
					conditionArray[1] = 'nl';
					getList(conditionArray);
				}
			}
		} else {
			// 기존 거주형태 조건이 존재하며 누른 거주형태 조건과 일치하지 않을 경우
			if(conditionArray[2] != 'nl' && conditionArray[2] != thCategory) {
				// 기존 거주형태 tag list가 존재하는 경우
				if($(".filter-bar_tag:contains('"+conditionArray[2]+"')").length > 0) {
					changeTaglist(conditionArray[2] , thCategory);
				// 존재하지 않는 경우
				} else {
					appendTag(thCategory);
				}
				
				conditionArray[2] = thCategory;
				getList(conditionArray);
				console.log("conditionArray[2] : "+conditionArray[2]);
			} else {
				// 기존 조건이 없을 경우
				if(conditionArray[2] == 'nl') {
					console.log("append");
					conditionArray[2] = thCategory;
					appendTag(thCategory);
					getList(conditionArray);
				// 기존 조건 not null, 누른 조건이 기존 조건과 동일
				} else if(conditionArray[2] != 'nl' && conditionArray[2] == thCategory) {
					// 누른 조건과 일치하는 기존 조건이 이미 있는 경우
					// [3] 조건만 존재하는 경우
					if(conditionArray[0] == '최신순' && conditionArray[1] == 'nl') {
						addBtnGray();
					} else {
					// [3] 조건 이외에 다른 조건이 있는 경우
						$(".filter-bar_tag:contains('"+conditionArray[2]+"')").parent().remove();
						addWhichBtnGray(activeCls);
					}
					conditionArray[2] = 'nl';
					getList(conditionArray);
				}
			}
		}
		
		
//		$("main[role='main']").next().remove();
		$(".animated-popout").removeClass("open");
		
		
		// 조건에 따라 리스트 가져오는 ajax method (막아놓은 상태)
//		getList(condition);
		// ajax 끝
		
	});
	
	// tag 삭제 버튼 누르면 조건 삭제하고 ajax 재호출하는 이벤트
	$(document).on('click', '.filter-bar_tag', function(){
		
		var thBtnText = $(this).text().trim();
		console.log(thBtnText);
		
		if(thBtnText == '최신순' || thBtnText == '좋아요순' || thBtnText == '조회순') {
			var activeCls = $(".filter-bar-control_button").eq(0);
			// 조건 혼자 남은 경우
			if(conditionArray[1] == 'nl' && conditionArray[2] == 'nl') {
				// tag list 전체 삭제
				addBtnGray();
				conditionArray[0] = '최신순';
				getList(conditionArray);
			} else {
			// 다른 조건이 남아있는 경우
				$(".filter-bar_tag:contains('"+conditionArray[0]+"')").parent().remove();
				addWhichBtnGray(activeCls.text().trim());
				conditionArray[0] = '최신순';
				getList(conditionArray);
			}
		} else if(thBtnText == '원룸' || thBtnText == '투룸') {
			var activeCls = $(".filter-bar-control_button").eq(1);
			// 조건 혼자 남은 경우
			if(conditionArray[0] == '최신순' && conditionArray[2] == 'nl') {
				// tag list 전체 삭제
				addBtnGray();
				conditionArray[1] = 'nl';
				getList(conditionArray);
			} else {
			// 다른 조건이 남아있는 경우
				$(".filter-bar_tag:contains('"+conditionArray[1]+"')").parent().remove();
				addWhichBtnGray(activeCls.text().trim());
				conditionArray[1] = 'nl';
				getList(conditionArray);
			}
		} else {
			var activeCls = $(".filter-bar-control_button").eq(2);
			// 조건 혼자 남은 경우
			if(conditionArray[0] == '최신순' && conditionArray[1] == 'nl') {
				// tag list 전체 삭제
				addBtnGray();
				conditionArray[2] = 'nl';
				getList(conditionArray);
			} else {
			// 다른 조건이 남아있는 경우
				$(".filter-bar_tag:contains('"+conditionArray[2]+"')").parent().remove();
				addWhichBtnGray(activeCls.text().trim());
				conditionArray[2] = 'nl';
				getList(conditionArray);
			}
		}
	});
	
	// 초기화 버튼 클릭 이벤트
	$(document).on('click', '.filter-bar_tag-list_clear', function(){
		addBtnGray();
		conditionArray = ['최신순', 'nl', 'nl'];
		getList(conditionArray);
	});
	
});

// tag list 전체 삭제 method
function addBtnGray() {
	$(".button.filter-bar-control_button.active").removeClass("button-light-blue");
	$(".button.filter-bar-control_button.active").addClass("button-gray");
	$(".button.filter-bar-control_button.active img").attr("src", "/image/common/down-arrow-gray.png");
	$(".button.filter-bar-control_button").removeClass("active");
	$(".filter-bar_tag-list").empty();
}

// 인자값을 text로 가지고 있는 active 클래스에서 active 제거하는 method
function addWhichBtnGray(activeCls) {
	$(".filter-bar-control_button.active:contains('"+activeCls+"')").removeClass("button-light-blue");
	$(".filter-bar-control_button.active:contains('"+activeCls+"')").addClass("button-gray");
	$(".filter-bar-control_button.active:contains('"+activeCls+"') img").attr("src", "/image/common/down-arrow-gray.png");
	$(".filter-bar-control_button.active:contains('"+activeCls+"')").removeClass("active");
}

function clsIsHovered(cls){
    return $("." + cls + ":hover").length > 0;
}

// tag list 이미 존재하는 조건일 경우 text change, 존재하지 않는 조건일 경우 append
// condi : 조건 text
function changeTaglist(beforeCondi, AfterCondi) {
	if(beforeCondi != 'nl') {
		$(".filter-bar_tag:contains('"+beforeCondi+"')").html(AfterCondi+"<img class='icon' src='/image/common/delete-button.png'>");
	}
}

// tag list append method
function appendTag(condi) {
	var tagItem = "";
	if($(".filter-bar_tag-list_clear").length > 0) {
		tagItem += `
			<li class="filter-bar_tag-list_item">
				<button class="button button-color-blue filter-bar_tag">`+condi+`
					<img class="icon" src="/image/common/delete-button.png">
				</button>
			</li>
		`
		$(".filter-bar_tag-list_clear").before(tagItem);
	} else {
		tagItem += `
			<li class="filter-bar_tag-list_item">
				<button class="button button-color-blue filter-bar_tag">`+condi+`
					<img class="icon" src="/image/common/delete-button.png">
				</button>
			</li>
			<li class="filter-bar_tag-list_item">
				<button class="button button-color-blue filter-bar_tag-list_clear">초기화
				</button>
			</li>
		`
		$(".filter-bar_tag-list").append(tagItem);
	}
}

// conditionArray에 따라 리스트 목록을 가져오는 ajax method
function getList(conditionArray) {
	
	// 조건에 따른 리스트 가져오는 ajax
	$.ajax({
		url: 'getAllList',
		type: 'post',
		traditional : true,
		dataType: 'json',
		data: {
			'conditionArray' : conditionArray
		},
		error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}, success: function(redata){
			$(".project-index_feed_count").remove();
			$(".row").remove();
			var ajaxList = "";
			ajaxList = `
				<div class="project-index_feed_count">
					전체 `+redata.length+`
				</div>
				<div class="row">
			`
			for(var i=0; i<redata.length; i++) {
				var jsonType = JSON.parse(redata[i].json);
				ajaxList += `
				
						<div class="col-12 col-lg-4">
							<article class="project-item">
								<a href="`+redata[i].zip_seq_no+`/zipdleDetail">
									<div class="project-item_cover">
										<div class="project-item_cover_img">
											<img class="image feed-height" src="`+jsonType.data.cover_image_url+`">										
										</div>
										<h1 class="project-item_cover_title">`+jsonType.data.title+`</h1>
									</div>
								</a>
								<div>
									<div class="project-item_writer">
										<a class="/">
											<div class="project-item_writer_img">
												<img src="/uploadImage/`+redata[i].member_image+`">
											</div>
										</a>
										<a class="/">
											<div class="project-item_writer_name">`+redata[i].member_nickname+`</div>
										</a>
									</div>
									<div class="project-item_stats">
										<span class="project-item_stats_item">좋아요 `+redata[i].zip_good+`</span>
										<span class="project-item_stats_dot"></span>
										<span class="project-item_stats_item">조회수 `+redata[i].zip_hits+`</span>
									</div>
								</div>
							</article>
						</div>
					
				`
			}
			ajaxList += `</div>`
			$(".project-index_feed").append(ajaxList);
		}
	});
}