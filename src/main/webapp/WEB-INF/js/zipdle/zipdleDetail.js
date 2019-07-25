$(function(){
	var zip_seq_no = $("#body").attr("data-s_id");
	getData(zip_seq_no);
	
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
		console.log(width_size);
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
	
	$("#user_action .buttons a").click(function(e){
		e.preventDefault();
		console.log(!$(this).hasClass("active"));
		var th = $(this);
		var upDown = 0;
		if(!$(this).hasClass("active")) {
			$(this).addClass("active");
			$(this).find(".icon").attr("src", "/image/common/like-white.png");
			
			upDown = 0;
			
			// zip_good Up ajax
			upDownZipGood(upDown);
		} else {
			$(this).removeClass("active");
			$(this).find(".icon").attr("src", "/image/common/like-gray.png");
			
			upDown = 1;
			
			// zip_good Down ajax
			upDownZipGood(upDown);
		}
		
	});
	
	// 댓글 입력 이벤트, 출력 ajax
	$("comment-feed_form_content_text").keydown(function(key){
		
		var member_no = $(".memberNo").val();
		var zip_seq_no = $("#body").attr("data-s_id");
		
		if(key.keyCode == 13) {
			
			var z_reply_content = $(".comment-feed_form_content_text").text();
			
			$.ajax({
				url: 'getZipReply',
				type: 'post',
				dataType: 'json',
				data: {
					'member_no' : member_no,
					'z_reply_seq_no' : zip_seq_no,
					'z_reply_content' : z_reply_content	
				},
				error:function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}, success: function(redata){
					
				}
			});
		}
		
	})
	
});


// 좋아요 update ajax 함수
function upDownZipGood(upDown) {
	$.ajax({
		url: 'updateZipGood',
		type: 'post',
		dataType: 'json',
		data: {
			'upDown' : upDown
		},
		error:function(request,status,error){
		    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}, success: function(redata){
			$(th).find(".count").text(redata.zip_good);
			$("#metadata_wrap dl dd:eq(0)").text(redata.zip_good);
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
			
			console.log(jsonType.data.region_attributes);
			console.log(jsonType.data.region_attributes.province);
			console.log(jsonType.data.region_attributes.district);
			if(jsonType.data.region_attributes.province == '0') {
				switch(jsonType.data.region_attributes.district) {
					case '0':
						$(".region").find(".value").text("서울특별시 강남구");
						break;
					case '1':
						console.log("11");
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