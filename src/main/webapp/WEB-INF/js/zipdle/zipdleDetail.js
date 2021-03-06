$(function(){
	var zip_seq_no = $("#body").attr("data-s_id");
	var memberNo = $(".memberNo").val();
	getData(zip_seq_no);
	if(memberNo == "") {
		getReplyList2();
	} else {
		getReplyList(memberNo);
	}
	
	
	if($(".comment-feed_form_content_text").text() == "") {
		$(".comment-feed_form_submit").attr("disabled", "disabled");
	}
	
	// 브라우저 시작할 때 우측 유저 메뉴 static or fixed 설정
	var window_size = $(window).width();
	if(window_size <= 1262) {
		$("#user_action").css({
			'position': 'static',
			'right': '0px',
			'top': '0px'
		});
	} else if(window_size > 1262) {
		var rightPosi = (window_size - 1150)/2;
		$("#user_action").css({
			'position': 'fixed',
			'right': rightPosi+'px',
			'top': '164px'
		});
	}
	
	// window width에 따라서 user 메뉴 static or fiexd
	$(window).resize(function(){
		var width_size = $(window).width();
		if(width_size <= 1262) {
			$("#user_action").css({
				'position': 'static',
				'right': '0px',
				'top': '0px'
			});
		} else if(width_size > 1262) {
			var rightPosi = (width_size - 1150)/2;
			$("#user_action").css({
				'position': 'fixed',
				'right': rightPosi+'px',
				'top': '164px'
			});
		}
	});
	
	// 좋아요 버튼 이벤트 ( +, - )
	$("#user_action .buttons a").click(function(e){
		e.preventDefault();

		var member_no = $(".memberNo").val();
		if(member_no == "") {
			location.href="/member/gotoSignin";
			return false;
		}

		var th = $(this);
		var upDown = 0;
		if(!$(this).hasClass("active")) {
			$(this).addClass("active");
			$(this).find(".icon").attr("src", "/image/common/like-white.png");
			
			upDown = 0;
			
			// zip_good Up ajax
			upDownZipGood(upDown, th, member_no);
		} else {
			$(this).removeClass("active");
			$(this).find(".icon").attr("src", "/image/common/like-gray.png");
			
			upDown = 1;
			
			// zip_good Down ajax
			upDownZipGood(upDown, th, member_no);
		}
	});
	
	// 댓글에서 하트 버튼 누를 때 좋아요 수 ajax 처리
	$(document).on('click', '.comment-feed_item_footer_likes_icon', function(){
		var th = $(this);
		var z_reply_seq_no = $(this).parent().attr("data-r-id");
		var member_no = $(".memberNo").val();
		
		if(member_no == "") {
			location.href="/member/gotoSignin";
			return false;
		}
		
		var upDown = 0;
		if(!$(this).hasClass("liked")) {
			$(this).parent().next().addClass("cancel");
			$(this).addClass("liked");
			$(this).find(".badge").attr("src", "/image/common/like-blue.png");
			$(this).parent().next().text('좋아요취소');
			
			upDown = 0;
			
			upDownReplyGood(upDown, th, z_reply_seq_no, member_no);
		} else {
			$(this).parent().next().removeClass("cancel");
			$(this).removeClass("liked");
			$(this).find(".badge").attr("src", "/image/common/like-gray.png");
			$(this).parent().next().text('좋아요');
			upDown = 1;
			
			upDownReplyGood(upDown, th, z_reply_seq_no, member_no);
		}
	});
	
	// 좋아요 글 버튼 누를 때 발생하는 이벤트 + ajax 호출
	$(document).on('click', '.comment-feed_item_footer_like-btn', function(){
		var th = $(this).prev().find(".comment-feed_item_footer_likes_icon");
		var z_reply_seq_no = $(this).prev().attr("data-r-id");
		var member_no = $(".memberNo").val();

		if(member_no == "") {
			location.href="/member/gotoSignin";
			return false;
		}
		
		var upDown = 0;
		if(!$(this).hasClass("cancel")) {
			$(this).addClass("cancel");
			$(th).addClass("liked");
			$(th).find(".badge").attr("src", "/image/common/like-blue.png");
			$(this).text('좋아요취소');
			
			upDown = 0;
			
			upDownReplyGood(upDown, th, z_reply_seq_no, member_no);
		} else {
			$(this).removeClass("cancel");
			$(th).removeClass("liked");
			$(th).find(".badge").attr("src", "/image/common/like-gray.png");
			$(this).text('좋아요');
			upDown = 1;
			
			upDownReplyGood(upDown, th, z_reply_seq_no, member_no);
		}
	});
	
	// 댓글 입력 이벤트 1 다음에 일어나는 2 이벤트
	$(".comment-feed_form_submit").click(function(e){
		e.preventDefault();
		
		var member_no = $(".memberNo").val();
		var zip_seq_no = $("#body").attr("data-s_id");
		var z_reply_content = $(".comment-feed_form_content_text").text();
		
		insUpdReply(member_no, zip_seq_no, z_reply_content);
	});
	
	// 댓글 입력 이벤트 1, 출력 ajax
	$(".comment-feed_form_content_text").keyup(function(key){
		
		if($(this).text().length == 0) {
			$(".comment-feed_form_submit").attr("disabled", "disabled");
		} else {
			$(".comment-feed_form_submit").removeAttr("disabled");
		}
		
		if(key.keyCode == 13) {
			
			
			$(".comment-feed_form_submit").click();
			$(this).text("");
			
		}
	});

	// 페이지 누를 대 currentPage에 해당하는 댓글 리스트 가져오기
	$(document).on('click', '.list-paginator_page', function(){
		var pageNum = $(this).text();
		var member_no = $(".memberNo").val();
		
		if(member_no == "") {
			getCurrentPageReply2(pageNum, zip_seq_no);
		} else {
			getCurrentPageReply(pageNum, zip_seq_no, member_no);
		}
		
	});
	
	$(document).on('click', '.list-paginator_prev', function(){
		var pageNum = $('.list-paginator_page.sm.selected').text();
		var member_no = $(".memberNo").val();
		
		if(member_no == "") {
			getCurrentPageReply2(pageNum-1, zip_seq_no);
		} else {
			getCurrentPageReply(pageNum-1, zip_seq_no, member_no);
		}
	});
	
	$(document).on('click', '.list-paginator_next', function(){
		var pageNum = $('.list-paginator_page.sm.selected').text();
		var member_no = $(".memberNo").val();
		
		if(member_no == "") {
			getCurrentPageReply2(parseInt(pageNum)+1, zip_seq_no);
		} else {
			getCurrentPageReply(parseInt(pageNum)+1, zip_seq_no, member_no);
		}
	});
	
	// 로그인한 사람이 게시글을 작성한 본인일 때 삭제하는 이벤트
	$(".delete").click(function(){
		var conf = confirm("게시글을 정말 삭제하시겠습니까?");
		
		if(conf) {
			$.ajax({
				url: 'deleteZip',
				type: 'post',
				dataType: 'json',
				error:function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				},
				success: function(redata){
					console.log(redata);
				}
			});
			
			location.href="redirect:/zipdle/gotoZipList";
		}
	});
	
	// 로그인한 사람이 댓글 작성한 본인일 때 삭제하는 이벤트
	$(document).on('click', '.comment-feed_item_footer_delete-btn', function(){
		var conf = confirm("댓글을 정말 삭제하시겠습니까?");
		var z_reply_seq_no = $(this).parent().find(".comment-feed_item_footer_likes").attr("data-r-id");
		
		if(conf) {
			$.ajax({
				url: 'deleteZipReply',
				type: 'post',
				dataType: 'json',
				data: {
					'z_reply_seq_no': z_reply_seq_no
				},
				error:function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				},
				success: function(redata){
					console.log(redata);
				}
			});
			
			location.href="redirect:/zipdle/gotoZipList";
		}
	});
	

});

//currentPage에 따라서 댓글 리스트 가져와서 append하는 메서드
function getCurrentPageReply2(pageNum, zip_seq_no) {
	$.ajax({
		url: 'getZipReply2',
		type: 'post',
		dataType: 'json',
		data: {
			'pageNum' : pageNum,
			'z_reply_no' : zip_seq_no
		},
		error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}, success: function(redata){
			// 넘어오는 데이터 => List zrvo
			var replyList = "";
			var pagingList = "";
			
			$(".comment-feed_list").empty();
			$('.list_paginator').empty();
			
			$(".comment-feed_header_count").text(redata.totalCount);
			
			var jsonType = JSON.parse(redata.jsonList);
			
			for(var i=0; i<jsonType.length; i++) {
				
				replyList += `
					<li class="comment-feed_list_item">
						<article class="comment-feed_item">
							<p class="comment-feed_item_content">
								<a class="comment-feed_item_content_author" href="/">
									<img src="/uploadImage/`+jsonType[i].member_image+`" class="comment-feed_item_content_author_image">
									<span class="comment-feed_item_content_author_name">`+jsonType[i].member_nickname+`</span>
								</a>
								<span class="comment-feed_item_content_content">`+jsonType[i].z_reply_content+`</span>
							</p>
							<footer class="comment-feed_item_footer">
								<time class="comment-feed_item_footer_time" datetime="`+jsonType[i].reg_date+`">`+jsonType[i].date+`</time>
								<span class="comment-feed_item_footer_likes" data-r-id="`+jsonType[i].z_reply_seq_no+`">
									`
									if(jsonType[i].isReplyLike != null) {
										replyList += `
											<button class="comment-feed_item_footer_likes_icon liked" type="button">
												<img src="/image/common/like-blue.png" class="badge">
											</button>
										`
									} else {
										replyList += `
											<button class="comment-feed_item_footer_likes_icon" type="button">
												<img src="/image/common/like-gray.png" class="badge">
											</button>
										`
									}
								replyList +=
								`
									<span class="comment-feed_item_footer_likes_count">`+jsonType[i].z_reply_good+`</span>
								</span>
								`
									if(jsonType[i].isReplyLike != null) {
										replyList += `
											<button class="comment-feed_item_footer_like-btn cancel" type="button">좋아요취소</button>
										`
									} else {
										replyList += `
											<button class="comment-feed_item_footer_like-btn" type="button">좋아요</button>
										`
									}
								replyList +=
								`
								<button class="comment-feed_item_footer_report-btn" type="button" style="font-weight: normal">신고</button>
							</footer>
						</article>
					</li>
				`
			}
			
			console.log(redata);
			
			// 페이징 처리
			if(redata.startPage < redata.currentPage){
				pagingList += `
					<li style="display: inline-block; vertical-align: bottom;">
						<button class="list-paginator_prev" type="button">
							<img src="/image/common/left-arrow-outline-button.png">
						</button>
					</li>
				`
			}
			for(var i=redata.startPage; i<=redata.endPage; i++) {
				if(i != redata.currentPage) {
					pagingList +=`
						<li style="display: inline-block; vertical-align: bottom;">
							<button class="list-paginator_page sm" type="button">`+i+`</button>
						</li>
					`
				} else {
					pagingList +=`
						<li style="display: inline-block; vertical-align: bottom;">
							<button class="list-paginator_page sm selected" type="button">`+i+`</button>
						</li>
					`
				}
			}
			if(redata.currentPage < redata.totalPage) {
				pagingList += `
					<li style="display: inline-block; vertical-align: bottom;">
						<button class="list-paginator_next" type="button">
							<img src="/image/common/right-arrow-outline-button.png">
						</button>
					</li>
				`
			}
			
			$(".list_paginator").append(pagingList);
			$(".comment-feed_list").append(replyList);
			
		}
	});
}

// currentPage에 따라서 댓글 리스트 가져와서 append하는 메서드
function getCurrentPageReply(pageNum, zip_seq_no, member_no) {
	
	var zipMemberNo = $(".zipMemberNo").val();
	
	$.ajax({
		url: 'getZipReply',
		type: 'post',
		dataType: 'json',
		data: {
			'pageNum' : pageNum,
			'z_reply_no' : zip_seq_no,
			'member_no': member_no
		},
		error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}, success: function(redata){
			// 넘어오는 데이터 => List zrvo
			var replyList = "";
			var pagingList = "";
			
			$(".comment-feed_list").empty();
			$('.list_paginator').empty();
			
			$(".comment-feed_header_count").text(redata.totalCount);
			
			var jsonType = JSON.parse(redata.jsonList);
			
			for(var i=0; i<jsonType.length; i++) {
				
				replyList += `
					<li class="comment-feed_list_item">
						<article class="comment-feed_item">
							<p class="comment-feed_item_content">
								<a class="comment-feed_item_content_author" href="/">
									<img src="/uploadImage/`+jsonType[i].member_image+`" class="comment-feed_item_content_author_image">
									<span class="comment-feed_item_content_author_name">`+jsonType[i].member_nickname+`</span>
								</a>
								<span class="comment-feed_item_content_content">`+jsonType[i].z_reply_content+`</span>
							</p>
							<footer class="comment-feed_item_footer">
								<time class="comment-feed_item_footer_time" datetime="`+jsonType[i].reg_date+`">`+jsonType[i].date+`</time>
								<span class="comment-feed_item_footer_likes" data-r-id="`+jsonType[i].z_reply_seq_no+`">
									`
									if(jsonType[i].isReplyLike != null) {
										replyList += `
											<button class="comment-feed_item_footer_likes_icon liked" type="button">
												<img src="/image/common/like-blue.png" class="badge">
											</button>
										`
									} else {
										replyList += `
											<button class="comment-feed_item_footer_likes_icon" type="button">
												<img src="/image/common/like-gray.png" class="badge">
											</button>
										`
									}
								replyList +=
								`
									<span class="comment-feed_item_footer_likes_count">`+jsonType[i].z_reply_good+`</span>
								</span>
								`
									if(jsonType[i].isReplyLike != null) {
										replyList += `
											<button class="comment-feed_item_footer_like-btn cancel" type="button">좋아요취소</button>
										`
									} else {
										replyList += `
											<button class="comment-feed_item_footer_like-btn" type="button">좋아요</button>
										`
									}
								replyList +=
									`
									<button class="comment-feed_item_footer_report-btn" type="button" style="font-weight: normal">신고</button>`					
										if(zipMemberNo == member_no) {
											replyList += `
												<button class="comment-feed_item_footer_delete-btn" type="button" style="font-weight: normal">삭제</button>
											`
										}
								replyList +=
								`</footer>
							</article>
						</li>
					`
			}
			
			console.log(redata);
			
			// 페이징 처리
			if(redata.startPage < redata.currentPage){
				pagingList += `
					<li style="display: inline-block; vertical-align: bottom;">
						<button class="list-paginator_prev" type="button">
							<img src="/image/common/left-arrow-outline-button.png">
						</button>
					</li>
				`
			}
			for(var i=redata.startPage; i<=redata.endPage; i++) {
				if(i != redata.currentPage) {
					pagingList +=`
						<li style="display: inline-block; vertical-align: bottom;">
							<button class="list-paginator_page sm" type="button">`+i+`</button>
						</li>
					`
				} else {
					pagingList +=`
						<li style="display: inline-block; vertical-align: bottom;">
							<button class="list-paginator_page sm selected" type="button">`+i+`</button>
						</li>
					`
				}
			}
			if(redata.currentPage < redata.totalPage) {
				pagingList += `
					<li style="display: inline-block; vertical-align: bottom;">
						<button class="list-paginator_next" type="button">
							<img src="/image/common/right-arrow-outline-button.png">
						</button>
					</li>
				`
			}
			
			$(".list_paginator").append(pagingList);
			$(".comment-feed_list").append(replyList);
			
		}
	});
}

//브라우저 시작할 때 댓글 리스트 가져와서 append하는 메서드 (로그인 안한 경우)
function getReplyList2() {
	
	$.ajax({
		url: 'getZipReply2',
		type: 'post',
		dataType: 'json',
		error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}, success: function(redata){
			// 넘어오는 데이터 => List zrvo
			var replyList = "";
			var pagingList = "";
			
			$(".comment-feed_header_count").text(redata.totalCount);
			
			$(".metadata_wrap dl dd:eq(1)").text(redata.totalCount);
			
			var jsonType = JSON.parse(redata.jsonList);
			
			for(var i=0; i<jsonType.length; i++) {
				
				replyList += `
					<li class="comment-feed_list_item">
						<article class="comment-feed_item">
							<p class="comment-feed_item_content">
								<a class="comment-feed_item_content_author" href="/">
									<img src="/uploadImage/`+jsonType[i].member_image+`" class="comment-feed_item_content_author_image">
									<span class="comment-feed_item_content_author_name">`+jsonType[i].member_nickname+`</span>
								</a>
								<span class="comment-feed_item_content_content">`+jsonType[i].z_reply_content+`</span>
							</p>
							<footer class="comment-feed_item_footer">
								<time class="comment-feed_item_footer_time" datetime="`+jsonType[i].reg_date+`">`+jsonType[i].date+`</time>
								<span class="comment-feed_item_footer_likes" data-r-id="`+jsonType[i].z_reply_seq_no+`">
								`
								if(jsonType[i].isReplyLike != null) {
									replyList += `
										<button class="comment-feed_item_footer_likes_icon liked" type="button">
											<img src="/image/common/like-blue.png" class="badge">
										</button>
									`
								} else {
									replyList += `
										<button class="comment-feed_item_footer_likes_icon" type="button">
											<img src="/image/common/like-gray.png" class="badge">
										</button>
									`
								}

								replyList +=
								`
									<span class="comment-feed_item_footer_likes_count">`+jsonType[i].z_reply_good+`</span>
								</span>
								`
									if(jsonType[i].isReplyLike != null) {
										replyList += `
											<button class="comment-feed_item_footer_like-btn cancel" type="button">좋아요취소</button>
										`
									} else {
										replyList += `
											<button class="comment-feed_item_footer_like-btn" type="button">좋아요</button>
										`
									}
								replyList +=
								`
								<button class="comment-feed_item_footer_report-btn" type="button" style="font-weight: normal">신고</button>
							</footer>
						</article>
					</li>
				`
			}
			
			console.log(redata);
			
			// 페이징 처리
			if(redata.startPage < redata.currentPage){
				pagingList += `
					<li style="display: inline-block; vertical-align: bottom;">
						<button class="list-paginator_prev" type="button">
							<img src="/image/common/left-arrow-outline-button.png">
						</button>
					</li>
				`
			}
			for(var i=redata.startPage; i<=redata.endPage; i++) {
				if(i != redata.currentPage) {
					pagingList +=`
						<li style="display: inline-block; vertical-align: bottom;">
							<button class="list-paginator_page sm" type="button">`+i+`</button>
						</li>
					`
				} else {
					pagingList +=`
						<li style="display: inline-block; vertical-align: bottom;">
							<button class="list-paginator_page sm selected" type="button">`+i+`</button>
						</li>
					`
				}
			}
			if(redata.currentPage < redata.totalPage) {
				pagingList += `
					<li style="display: inline-block; vertical-align: bottom;">
						<button class="list-paginator_next" type="button">
							<img src="/image/common/right-arrow-outline-button.png">
						</button>
					</li>
				`
			}
			
			$(".list_paginator").append(pagingList);
			$(".comment-feed_list").append(replyList);
			
		}
	});
}

// 브라우저 시작할 때 댓글 리스트 가져와서 append하는 메서드
function getReplyList(member_no) {
	
	var zipMemberNo = $(".zipMemberNo").val();
	
	$.ajax({
		url: 'getZipReply',
		type: 'post',
		dataType: 'json',
		data: {
			'member_no' : member_no,
		},
		error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}, success: function(redata){
			// 넘어오는 데이터 => List zrvo
			var replyList = "";
			var pagingList = "";
			
			$(".comment-feed_header_count").text(redata.totalCount);
			
			var jsonType = JSON.parse(redata.jsonList);
			
			$(".metadata_wrap dl dd:eq(1)").text(redata.totalCount);
			
			for(var i=0; i<jsonType.length; i++) {
				
				replyList += `
					<li class="comment-feed_list_item">
						<article class="comment-feed_item">
							<p class="comment-feed_item_content">
								<a class="comment-feed_item_content_author" href="/">
									<img src="/uploadImage/`+jsonType[i].member_image+`" class="comment-feed_item_content_author_image">
									<span class="comment-feed_item_content_author_name">`+jsonType[i].member_nickname+`</span>
								</a>
								<span class="comment-feed_item_content_content">`+jsonType[i].z_reply_content+`</span>
							</p>
							<footer class="comment-feed_item_footer">
								<time class="comment-feed_item_footer_time" datetime="`+jsonType[i].reg_date+`">`+jsonType[i].date+`</time>
								<span class="comment-feed_item_footer_likes" data-r-id="`+jsonType[i].z_reply_seq_no+`">
								`
								if(jsonType[i].isReplyLike != null) {
									replyList += `
										<button class="comment-feed_item_footer_likes_icon liked" type="button">
											<img src="/image/common/like-blue.png" class="badge">
										</button>
									`
								} else {
									replyList += `
										<button class="comment-feed_item_footer_likes_icon" type="button">
											<img src="/image/common/like-gray.png" class="badge">
										</button>
									`
								}

								replyList +=
								`
									<span class="comment-feed_item_footer_likes_count">`+jsonType[i].z_reply_good+`</span>
								</span>
								`
									if(jsonType[i].isReplyLike != null) {
										replyList += `
											<button class="comment-feed_item_footer_like-btn cancel" type="button">좋아요취소</button>
										`
									} else {
										replyList += `
											<button class="comment-feed_item_footer_like-btn" type="button">좋아요</button>
										`
									}
								replyList +=
								`
								<button class="comment-feed_item_footer_report-btn" type="button" style="font-weight: normal">신고</button>`					
									if(zipMemberNo == member_no) {
										replyList += `
											<button class="comment-feed_item_footer_delete-btn" type="button" style="font-weight: normal">삭제</button>
										`
									}
							replyList +=
							`</footer>
						</article>
					</li>
				`
			}
			
			console.log(redata);
			
			// 페이징 처리
			if(redata.startPage < redata.currentPage){
				pagingList += `
					<li style="display: inline-block; vertical-align: bottom;">
						<button class="list-paginator_prev" type="button">
							<img src="/image/common/left-arrow-outline-button.png">
						</button>
					</li>
				`
			}
			for(var i=redata.startPage; i<=redata.endPage; i++) {
				if(i != redata.currentPage) {
					pagingList +=`
						<li style="display: inline-block; vertical-align: bottom;">
							<button class="list-paginator_page sm" type="button">`+i+`</button>
						</li>
					`
				} else {
					pagingList +=`
						<li style="display: inline-block; vertical-align: bottom;">
							<button class="list-paginator_page sm selected" type="button">`+i+`</button>
						</li>
					`
				}
			}
			if(redata.currentPage < redata.totalPage) {
				pagingList += `
					<li style="display: inline-block; vertical-align: bottom;">
						<button class="list-paginator_next" type="button">
							<img src="/image/common/right-arrow-outline-button.png">
						</button>
					</li>
				`
			}
			
			$(".list_paginator").append(pagingList);
			$(".comment-feed_list").append(replyList);
			
		}
	});
}

// 댓글 insert 후 새로운 댓글 리스트 가져와서 append하는 메서드
function insUpdReply(member_no, zip_seq_no, z_reply_content) {
	
	var zipMemberNo = $(".zipMemberNo").val();
	
	$.ajax({
		url: 'getZipReply',
		type: 'post',
		dataType: 'json',
		data: {
			'member_no' : member_no,
			'z_reply_no' : zip_seq_no,
			'z_reply_content' : z_reply_content,
		},
		error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}, success: function(redata){
			// 넘어오는 데이터 => List zrvo
			var replyList = "";
			var pagingList = "";
			
			$(".list_paginator").empty();
			$(".comment-feed_list").empty();
			
			$(".comment-feed_header_count").text(redata.totalCount);
			
			var jsonType = JSON.parse(redata.jsonList);
			
			// 댓글 리스트 출력하기 위한 반복문
			for(var i=0; i<jsonType.length; i++) {
				
				replyList += `
					<li class="comment-feed_list_item">
						<article class="comment-feed_item">
							<p class="comment-feed_item_content">
								<a class="comment-feed_item_content_author" href="/">
									<img src="/uploadImage/`+jsonType[i].member_image+`" class="comment-feed_item_content_author_image">
									<span class="comment-feed_item_content_author_name">`+jsonType[i].member_nickname+`</span>
								</a>
								<span class="comment-feed_item_content_content">`+jsonType[i].z_reply_content+`</span>
							</p>
							<footer class="comment-feed_item_footer">
								<time class="comment-feed_item_footer_time" datetime="`+jsonType[i].reg_date+`">`+jsonType[i].date+`</time>
								<span class="comment-feed_item_footer_likes" data-r-id="`+jsonType[i].z_reply_seq_no+`">
									`
									if(jsonType[i].isReplyLike != null) {
										replyList += `
											<button class="comment-feed_item_footer_likes_icon liked" type="button">
												<img src="/image/common/like-blue.png" class="badge">
											</button>
										`
									} else {
										replyList += `
											<button class="comment-feed_item_footer_likes_icon" type="button">
												<img src="/image/common/like-gray.png" class="badge">
											</button>
										`
									}
								replyList +=
								`
									<span class="comment-feed_item_footer_likes_count">`+jsonType[i].z_reply_good+`</span>
								</span>
								`
									if(jsonType[i].isReplyLike != null) {
										replyList += `
											<button class="comment-feed_item_footer_like-btn cancel" type="button">좋아요취소</button>
										`
									} else {
										replyList += `
											<button class="comment-feed_item_footer_like-btn" type="button">좋아요</button>
										`
									}
								replyList +=
									`
									<button class="comment-feed_item_footer_report-btn" type="button" style="font-weight: normal">신고</button>`					
										if(zipMemberNo == member_no) {
											replyList += `
												<button class="comment-feed_item_footer_delete-btn" type="button" style="font-weight: normal">삭제</button>
											`
										}
								replyList +=
								`</footer>
							</article>
						</li>
					`
			}
			
			// 페이징 처리
			if(redata.startPage < redata.currentPage){
				pagingList += `
					<li style="display: inline-block; vertical-align: bottom;">
						<button class="list-paginator_prev" type="button">
							<img src="/image/common/left-arrow-outline-button.png">
						</button>
					</li>
				`
			}
			for(var i=redata.startPage; i<=redata.endPage; i++) {
				if(i != redata.currentPage) {
					pagingList +=`
						<li style="display: inline-block; vertical-align: bottom;">
							<button class="list-paginator_page sm" type="button">`+i+`</button>
						</li>
					`
				} else {
					pagingList +=`
						<li style="display: inline-block; vertical-align: bottom;">
							<button class="list-paginator_page sm selected" type="button">`+i+`</button>
						</li>
					`
				}
			}
			if(redata.currentPage < redata.totalPage) {
				pagingList += `
					<li style="display: inline-block; vertical-align: bottom;">
						<button class="list-paginator_next" type="button">
							<img src="/image/common/right-arrow-outline-button.png">
						</button>
					</li>
				`
			}
			
			$(".list_paginator").append(pagingList);
			$(".comment-feed_list").append(replyList);
			
		}
	});
}

// 좋아요 update ajax 함수
function upDownZipGood(upDown, th, member_no) {
	$.ajax({
		url: 'updateZipGood',
		type: 'post',
		dataType: 'json',
		data: {
			'upDown' : upDown,
			'member_no' : member_no
		},
		error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}, success: function(redata){
			$(th).find(".count").text(redata.zip_good);
			$("#metadata_wrap dl dd:eq(0)").text(redata.zip_good);
		}
	});
}

//좋아요 update ajax 함수
function upDownReplyGood(upDown, th, z_reply_seqno, member_no) {
	$.ajax({
		url: 'upReplyGood',
		type: 'post',
		dataType: 'json',
		data: {
			'upDown' : upDown,
			'z_reply_seqno' : z_reply_seqno,
			'member_no': member_no
		},
		error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}, success: function(redata){
			$(th).next().text(redata.z_reply_good);
		}
	});
}

//조건에 따른 리스트 가져오는 ajax 함수
function getData(seq_no) {
	
	$.ajax({
		url: 'getZipAjax',
		type: 'post',
		dataType: 'json',
		data: {
			'seq_no' : seq_no
		},
		error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}, success: function(redata){
			
			var jsonType = JSON.parse(redata.json);
			
			// json 데이터 jsp에 주입
			$("#cover_image").css("background-image", "url('"+jsonType.data.cover_image_url+"')")
			$(".contents").find(".title").text(jsonType.data.title);
			if(jsonType.data.type == '0') {
				$(".residence").find(".value").text("원룸");
			} else {
				$(".residence").find(".value").text("투룸");
			}
			$(".area").find(".value").text(jsonType.data.pyeong+'평');
			$(".period").find(".value").text(jsonType.data.period+'주');
			$(".budget").find(".value").text(jsonType.data.budget+'만원');
			if(jsonType.data.fmtype == '0') {
				$(".fmtype").find(".value").text("1인 가구");
			} else {
				$(".fmtype").find(".value").text("2인 가구 이상");
			}
			
			if(jsonType.data.region_attributes.province == '0') {
				switch(jsonType.data.region_attributes.district) {
					case '0':
						$(".region").find(".value").text("서울특별시 강남구");
						break;
					case '1':
						$(".region").find(".value").text("서울특별시 강동구");
						break;
					case '2':
						$(".region").find(".value").text("서울특별시 강북구");
						break;
					case '3':
						$(".region").find(".value").text("서울특별시 강서구");
						break;
					case '4':
						$(".region").find(".value").text("서울특별시 관악구");
						break;
					case '5':
						$(".region").find(".value").text("서울특별시 광진구");
						break;
					case '6':
						$(".region").find(".value").text("서울특별시 구로구");
						break;
					case '7':
						$(".region").find(".value").text("서울특별시 금천구");
						break;
					case '8':
						$(".region").find(".value").text("서울특별시 노원구");
						break;
					case '9':
						$(".region").find(".value").text("서울특별시 도봉구");
						break;
					case '10':
						$(".region").find(".value").text("서울특별시 동대문구");
						break;
					case '11':
						$(".region").find(".value").text("서울특별시 동작구");
						break;
					case '12':
						$(".region").find(".value").text("서울특별시 마포구");
						break;
					case '13':
						$(".region").find(".value").text("서울특별시 서대문구");
						break;
					case '14':
						$(".region").find(".value").text("서울특별시 서초구");
						break;
					case '15':
						$(".region").find(".value").text("서울특별시 성동구");
						break;
					case '16':
						$(".region").find(".value").text("서울특별시 성북구");
						break;
					case '17':
						$(".region").find(".value").text("서울특별시 송파구");
						break;
					case '18':
						$(".region").find(".value").text("서울특별시 양천구");
						break;
					case '19':
						$(".region").find(".value").text("서울특별시 영등포구");
						break;
					case '20':
						$(".region").find(".value").text("서울특별시 용산구");
						break;
					case '21':
						$(".region").find(".value").text("서울특별시 은평구");
						break;
					case '22':
						$(".region").find(".value").text("서울특별시 종로구");
						break;
					case '23':
						$(".region").find(".value").text("서울특별시 중구");
						break;
					case '24':
						$(".region").find(".value").text("서울특별시 중랑구");
						break;
					case '25':
						$(".region").find(".value").text("서울특별시 강남구");
						break;
					default:
						break;
				}
			}
			
			// content ajax로 append
			var ajaxContents = "";
			$.each(jsonType.data.zip_detail, function(index, item) {
				var contentSplit = item.content.split('<div>');
				var itemContent = "";
				for(var i=0; i<contentSplit.length; i++) {
					itemContent += "<p>"+contentSplit[i]+"</p>"
				}
//				var replaceCont = item.content.replace('\n\r', '<br>');
				ajaxContents += `
					<div class="contents">
						<div class="title">`+item.sub_title+`</div>
						<div class="card">
							<div class="image_panel">
								<img src="`+item.image_url+`">
							</div>
						</div>
						<div class="image_description">
								`+itemContent+`
						</div>
					</div>
				`
			});
			$("#contents_panel").append(ajaxContents);
		}
	});
}