$(function(){
	//상품 수량 옵션
	$('div.amount span.down').click(function(){
		minus();
	});
	$('div.amount span.up').click(function(){
		plus();
	});
	
	$('li').click(function(){
		var dataTarget = $(this).attr('data-target');
		if (dataTarget != null) {
			location.href = '#' + dataTarget;
		}
	})
	
	
	//취소하기 버튼 클릭 시 confirm -> 리뷰 팝업창 CLOSE
	$(".cancel").click(function() {
		var result = confirm("작성 중인 내용이 사라집니다.");
		if(result){
			$(".ui-popup").css("display", "none");
		}
	});
	
	
	//별점 평가
	$('.star_image .avg_star').hover(
		function(){
			$(this).removeClass('empty').addClass('filled');
			$(this).prevAll('div.avg_star').removeClass('empty').addClass('filled');
			$(this).nextAll('div.avg_star').removeClass('filled').addClass('empty');
			$('.star_msg').css("color", "rgb(189, 189, 189)");
			setStarMsg($(this).text());
		},
		function(){
			if (selectedStarIndex != null) {
				$('.star_image .avg_star').eq(selectedStarIndex).removeClass('empty').addClass('filled');
				$('.star_image .avg_star').eq(selectedStarIndex).prevAll('div.avg_star').removeClass('empty').addClass('filled');
				$('.star_image .avg_star').eq(selectedStarIndex).nextAll('div.avg_star').removeClass('filled').addClass('empty');
				$('.star_msg').css("color", "rgb(66, 66, 66)");
				setStarMsg(selectedStarIndex+1);
				
			} else {
				$('.star_image .avg_star').removeClass('filled').addClass('empty');
				$('.star_msg').css("color", "rgb(189, 189, 189)");
				setStarMsg();
			}
		}
	);
	
	$('.star_image .avg_star').click(function(e){
		selectedStarIndex = $('.star_image .avg_star').index(this);
		$('.star_image .avg_star:gt('+selectedStarIndex+')').removeClass('filled').addClass('empty');
	    $("#rewGrade").val($(this).text());
	    $('.star_msg').css("color", "rgb(66, 66, 66)");
	});
	
	//장바구니에 담기 추가 [S] -- JWP
	// 장바구니 담기 버튼 이벤트
	$(".btn-add-to-cart").on('click', function(){
		var prodNo = $("#prodNo").val();
		var counts = $("#counts").val();
		var member_no = $("#memberNo").val();

		if(member_no == 'null') {
			console.log("진입");
			location.href = '../member/gotoSignin';
			return false;
		} else {
			// ajax로 장바구니, 장바구니 상세 테이블에 저장
			$.ajax({
				url: 'insertCart',
				type: 'post',
				dataType: 'json',
				data: {
					'prod_no': prodNo,
					'counts': counts
				},
				error:function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				},
				success: function(redata){

					var conf = confirm("해당 상품을 장바구니에 담았습니다. \n장바구니로 이동하시겠습니까?");
					
					if(conf) {
						location.href="cart";
					}
				}
			});
		}
	});
	
	$(".btn-buy-now").on('click', function(e){
		var prodNo = $("#prodNo").val();
		var counts = $("#counts").val();
		
		$(this).attr('href', 'preorder.do?idx=0&prodNo='+prodNo+"&counts="+counts);
	});
	//장바구니에 담기 추가 [E] -- JWP
});

//별점 HOVER 하단 텍스트 출력
function setStarMsg(starIndex) {
	if(starIndex == 1){
		$('.star_msg').text("I don't like it!");
	} else if (starIndex == 2) {
		$('.star_msg').text("so so");
	} else if (starIndex == 3) {
		$('.star_msg').text("Not bad!");
	} else if (starIndex == 4) {
		$('.star_msg').text("so good!");
	} else if (starIndex == 5) {
		$('.star_msg').text("I love it!!!");
	} else {
		$('.star_msg').text("");
	}
}

//펼치기 버튼 - 상품 상세정보 출력
function showDetail() {
	$('#btn-show-product-detail').addClass('hide');
	$('#btn-show-product-detail').addClass('hide');
	
	$('#product-detail__gradient').removeClass('product-detail__gradient-show');
	$('#product-detail__gradient').addClass('product-detail__gradient-hidden');
	
	$('#product-detail-contents').removeClass('product-detail-hidden');
	$('#product-detail-contents').addClass('product-detail-show');
}

//리뷰 출력 - 베스트순/최신순
function changeSort(sort, thiz) {
	$('.production-review__filter__order__list:eq(0)').removeClass('production-review__filter__order__list--active');
	$('.production-review__filter__order__list:eq(1)').removeClass('production-review__filter__order__list--active');
	$(thiz).addClass('production-review__filter__order__list--active');
	reviewListAjax(1);
}

//별점
var selectedStarIndex;

//리뷰쓰기 버튼 클릭 시 팝업 
function openReviewPopUp(e) {
	e.preventDefault();
	$(".ui-popup").css("display", "block");
	
	//리뷰쓰기 팝업창 open -> 별 평점 초기화
	$('.star_image .avg_star').removeClass('filled').addClass('empty');
	selectedStarIndex = null;
	
	$("#upload_panel").css("display", "none");
	
	$('textarea').val("");
}

//리뷰 수정하기 클릭 시 팝업
function openUpdatePopUp(idx, e) {
	e.preventDefault();
	var rew = reviewArr[idx];
	
	 //별 평점 & 하단 문구 셋팅
	selectedStarIndex = rew.rewGrade-1;
	for(var i=0; i<5; i++) {
		if (rew.rewGrade >= (i+1)) {
			$('.star_image .avg_star:eq('+i+')').removeClass('empty').addClass('filled');
		} else {
			$('.star_image .avg_star:eq('+i+')').removeClass('filled').addClass('empty');
		}
	}
	setStarMsg(selectedStarIndex);
	$("#rewGrade").val(rew.rewGrade);
	
	//이미지 셋팅
	$("#upload_panel img").attr('src', '/uploadImage/review/'+decodeURI(rew.rewImg));
	$("#upload_panel").css("display", "inline-block");
	
	//텍스트 영역 셋팅
	$('textarea').val(rew.rewContent);
	countWords();
	
	//리뷰 시퀀스 셋팅
	$('#rewNo').val(rew.rewNo);
	
	//리뷰쓰기 팝업창 open
	$(".ui-popup").css("display", "block");
}

//Number Format
function formatNumber(price) {
	  return price.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
}

//Date Format
function formatDate(date) {
	var d = new Date(date),
    month = '' + (d.getMonth() + 1),
    day = '' + d.getDate(),
    year = d.getFullYear();

	if (month.length < 2) month = '0' + month;
	if (day.length < 2) day = '0' + day;
	
	return [year, month, day].join('-');
}

//상품 수량 --
function minus() {
	var count = Number($('div.amount input').val());
	if (count > 1) {
		count--;
		$('div.amount input').val(count);
		console.log($('div.amount input').val());
		console.log($('div.amount input'));
		
		var price = $('#salePrice').val() * count;
		$('.text-heading-2').text(formatNumber(price));
		$('span.amount').text(formatNumber(price));
	
	}
}
//상품 수량 ++
function plus() {
	var count = Number($('div.amount input').val());
	if (count < 10) {
		count++;
		$('div.amount input').val(count);
		console.log($('div.amount input').val());
		console.log($('div.amount input'));
		
		var price = $('#salePrice').val() * count;
		$('.text-heading-2').text(formatNumber(price));
		$('span.amount').text(formatNumber(price));
		
	}
}

//리뷰쓰기 - Counting words
function countWords(){
	  var txtVal = $('textarea').val();
	  var words = txtVal.trim().replace(/\s+/gi, ' ').split(' ').length;
	  var chars = txtVal.length;
	  
	  if(chars===0){words=0;}
	  //$('#comment_count').html('<br>'+words+' words and '+ chars +' characters');
	  $('#comment_count').html(chars);
	}
countWords();

$('textarea').on('keyup propertychange paste', function(){ 
	countWords();
});

//리뷰쓰기 - 리뷰 내용 최소 20자 제한
function frmsubmit() {
	var countWords = $('#comment_count').text();
	if(countWords < 20){
		alert("글자 수 최소 20자 제한");
		return false;
	}
	return true;
}


//리뷰쓰기 - 업로드 파일 이미지 미리보기
var sel_file;

$(document).ready(function() {
	$("#card_uploader").on("change", handleImgFileSelect);
	
	$("#delete_review_card").click(function() {
		$('#previewImage').attr('src', '');
		
		if ($('#previewImage').attr('src') == '')
		{
			$("#upload_panel").css("display", "none");
		}else{
			$("#upload_panel").css("display", "block");
		}
	});
	
	$(window).scroll(function(){
		var contentsTop = $('#contents').offset().top;
		var scrollTop = $(document).scrollTop();
		
		if (contentsTop < scrollTop) {
			$('#selling-helper').css('position','fixed');
		} else {
			$('#selling-helper').css('position','absolute');
		}
	});
	
	$('.production-review__filter__order__list:last').click(function(){
		if ( $(this).hasClass('production-review__filter__order__list--active')) {
			$(this).removeClass('production-review__filter__order__list--active');
			document.getElementById('photoIcon').className.baseVal = 'production-review__filter__order__list__icon';
			reviewListAjax(1);
		} else {
			$(this).addClass('production-review__filter__order__list--active');
			document.getElementById('photoIcon').className.baseVal = 'production-review__filter__order__list__icon--active';
			reviewListAjax(1);
		}
	})
	
	reviewListAjax(1);
});

function fileChange() {
	$("#upload_panel").css("display", "block");
}

function handleImgFileSelect (e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function (f) {
		if(!f.type.match("image.*")){
			alert("이미지 확장자만 가능");
			return;
		}
		
		sel_file = f;
		
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#previewImage").attr("src", e.target.result);
			
			//리뷰 파일 선택 시 이미지 미리보기
			if ($('#previewImage').attr('src') != '')
			{
				$("#upload_panel").css("display", "block");
			}
		}
		reader.readAsDataURL(f);
	});
}

//리뷰 출력 
//한번만 동작할 수 있도록 작동 후 true -> false
var doAjax = true;
var root = $('#root').val();
var reviewArr = [];
function reviewListAjax(pageNo) {
	if(doAjax) {
		doAjax = false;
		var prodNo = $("#prodNo").val();
		
		var imageOnly = $('li.production-review__filter__order__list:last').hasClass('production-review__filter__order__list--active') ? 'Y' : 'N';
		var sorting = $('li.production-review__filter__order__list:first').hasClass('production-review__filter__order__list--active') ? 'best' : 'new';
		$.ajax({
			url: "/store/reviewAjax.do",
			type: "post",
			data: {'pageNo' : pageNo, 'prodNo' : prodNo, 'imageOnly':imageOnly, 'sorting':sorting},
			dataType: "json",
			success: function(data){
				doAjax = true;
				var rewList = JSON.parse(data.jsonList);
				
				reviewArr = [];
				var reviewList = '';
				for(var i=0; i<rewList.length; i++){
					var rew = rewList[i];
					reviewArr[i] = rew;
					reviewList += `
						<div class="production-review-item__list">
							<div class="production-review-item__container">
								<article class="production-review-item">
									<div class="production-review-item__writer">
										<a href="">
											<img class="production-review-item__writer__img" src="`+root+`/uploadImage/`+rew.memberImage+`">
										</a>
										<div class="production-review-item__writer__info">
											<p class="production-review-item__writer__info__name">`+rew.memberNickname+`</p>
											<button class="production-review-item__writer__info__total-star-wrap" type="button">
												<span class="production-review-item__writer__info__total-star" aria-label="별점 5.0점">
													`;
									for(var j=1; j<6; j++){
										if (j <= rew.rewGrade) {
								reviewList += `<svg fill="#35C5F0" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16">
												<defs>
													<path id="star-path-1.000" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path>
													<clipPath id="star-clip-1.000">
														<rect x="0" y="0" width="16" height="16"></rect>
													</clipPath>
												</defs>
												<use xlink:href="#star-path-1.000" fill="#DBDBDB"></use>
												<use clip-path="url(#star-clip-1.000)" xlink:href="#star-path-1.000"></use>
											</svg>`
										} else {
								reviewList += `<svg fill="#35C5F0" width="1em" height="1em" preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16">
												<defs>
													<path id="star-path-111" d="M8 13.54l-4.37 1.85c-.5.22-.88-.06-.83-.6l.4-4.73L.1 6.47c-.37-.41-.22-.85.32-.98l4.62-1.07L7.48.36c.29-.48.75-.47 1.04 0l2.44 4.06 4.62 1.07c.54.13.68.57.32.98l-3.1 3.59.4 4.72c.05.55-.33.83-.83.61L8 13.54z"></path>
													<clipPath id="star-clip-111">
														<rect x="0" y="0" width="0" height="16"></rect>
													</clipPath>
												</defs>
												<use xlink:href="#star-path-111" fill="#DBDBDB"></use>
												<use clip-path="url(#star-clip-111)" xlink:href="#star-path-111"></use>
											</svg>`
										}
									}
									
								reviewList += `</span>
											</button>
											<span class="production-review-item__writer__info__date">
												`+formatDate(rew.regDate)+`&nbsp; 구매</span>
										</div>
									</div>`
								if (rew.isLogin == "true") {
									reviewList += `<a class="production-review-item__edit" data-remote="true" href="javascript:void(0);" onclick="openUpdatePopUp('`+i+`',event)">수정</a>
										<a class="production-review-item__delete" data-remote="true" href="javascript:void(0);" onclick="location.href='deleteReview.do?rewNo=`+rew.rewNo+`&prodNo=`+rew.prodNo+`&pageNo=`+pageNo+`'">삭제</a>`	
								}
								reviewList += `<button class="production-review-item__img__btn">
										<img class="production-review-item__img" src="/uploadImage/review/`+decodeURI(rew.rewImg)+`"
										  onerror="this.src='${root}/uploadImage/review/noimage.jpg'; this.onerror='';">
									</button>
									<p class="production-review-item__description">`+rew.rewContent+`</p>
									<div class="production-review-item__help">
					`;
					
					if (rew.reviewLike == 'Y') {
						reviewList += `
										<button type="button" class="production-review-item__help__btn production-review-item__help__btn--active" onclick="reviewToggleAjax(`+rew.rewNo+`, this)">
											<svg width="16" height="16" viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet">
												<path fill="#FFF" d="M2.28 4.99l4.15 6.03 7.36-9.35 1.54 1.2-9 11.46L.67 6.1z" fill-rule="evenodd"></path>
											</svg>
											도움됨
										</button>
						`;
					} else {
						reviewList += `<button type="button" class="production-review-item__help__btn" onClick="reviewToggleAjax(`+rew.rewNo+`, this)">도움이 돼요</button>`;
					}
					reviewList += `
										<div class="production-review-item__help__text">
											<span class="production-review-item__help__text__number">`+rew.reviewLikeCnt+`</span>명에게 도움이 되었습니다.
										</div>
									</div>
								</article>
							</div>
						</div>
					`
				}
				
				//paging
				var paging = '';
				if(data.startPage < data.currentPage){
					paging += `
						<li>
							<button class="list-paginator__prev" type="button" onClick="reviewListAjax(`+(data.currentPage-1)+`)">
								<svg width="26" height="26" viewBox="0 0 26 26" preserveAspectRatio="xMidYMid meet">
									<g fill="none" fill-rule="evenodd">
										<rect width="25" height="25" x=".5" y=".5" stroke="#DCDCDC" rx="4"></rect>
										<g stroke="#424242" stroke-linecap="square" stroke-width="2">
											<path d="M14.75 8.263L10.25 13M10.25 13l4.5 4.737"></path>
										</g>
									</g>
								</svg>
							</button>
						</li>
					`
				}
				for(var i = data.startPage; i <= data.endPage; i++){
					if(i == data.currentPage){
						paging += `
							<li>
								<button class="list-paginator__page sm selected" type="button" onclick="reviewListAjax('`+i+`')">`+i+`</button>
							</li>
						`
					} else {
						paging += `
							<li>
								<button class="list-paginator__page sm" type="button" onclick="reviewListAjax('`+i+`')">`+i+`</button>
							</li>
						`
					}
				}
				if(data.currentPage < data.totalPage){
					paging += `
					<li>
						<button class="list-paginator__next" type="button" onClick="reviewListAjax(`+(data.currentPage+1)+`)">
							<svg width="26" height="26" viewBox="0 0 26 26" preserveAspectRatio="xMidYMid meet">
								<g fill="none" fill-rule="evenodd" transform="matrix(-1 0 0 1 26 0)">
									<rect width="25" height="25" x=".5" y=".5" stroke="#DCDCDC" rx="4"></rect>
									<g stroke="#424242" stroke-linecap="square" stroke-width="2">
										<path d="M14.75 8.263L10.25 13M10.25 13l4.5 4.737"></path>
									</g>
								</g>
							</svg>
						</button>
					</li>
					`
				}
				
				$(".production-review-item__list").html(reviewList);
				$(".list-paginator").html(paging);
			}, 
			fail:function(error){
				console.log(error);
				doAjax = true;
			}
		});
	}
}


function reviewToggleAjax(rewNo, thiz) {
	if(doAjax) {
		doAjax = false;
		var imageOnly = $('li.production-review__filter__order__list').hasClass('production-review__filter__order__list--active') ? 'Y' : 'N';
		$.ajax({
			url: '/store/reviewToggleAjax.do',
			dataType: 'json',
			data: {'rewNo':rewNo, 'imageOnly':imageOnly},
			type: 'post',
			success: function(data) {
				doAjax = true;
				if (data.result == 'loginForm') {
					location.href = '/member/gotoSignin';
				} else if(data.result == 'Y' ){
					var button = `
							<button type="button" class="production-review-item__help__btn production-review-item__help__btn--active" onclick="reviewToggleAjax(`+rewNo+`, this)">
								<svg width="16" height="16" viewBox="0 0 16 16" preserveAspectRatio="xMidYMid meet">
									<path fill="#FFF" d="M2.28 4.99l4.15 6.03 7.36-9.35 1.54 1.2-9 11.46L.67 6.1z" fill-rule="evenodd"></path>
								</svg>
								도움됨
							</button>
						`;
					$(thiz).parent().prepend(button);
					$(thiz).next().find('span').text(Number($(thiz).next().find('span').text())+1);
					$(thiz).remove();
				} else if(data.result == 'N' ){
					var button = '<button type="button" class="production-review-item__help__btn" onClick="reviewToggleAjax('+rewNo+', this)">도움이 돼요</button>';
					$(thiz).parent().prepend(button);
					$(thiz).next().find('span').text(Number($(thiz).next().find('span').text())-1);
					$(thiz).remove();
				}
			},
			fail: function(error) {
				console.log(error);
				doAjax = true;
			}
		});
	}
}