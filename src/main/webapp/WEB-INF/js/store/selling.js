//상품 수량 옵션
$(function(){
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
		
		$(this).attr('href', 'preorder.do?prodNo='+prodNo+"&counts="+counts);
	});
});

//리뷰쓰기 버튼 클릭 시 팝업 
function openReviewPopUp(e) {
	e.preventDefault();
	$(".ui-popup").css("display", "block");
}

//Number Format
function formatNumber(price) {
	  return price.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,');
}

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
});

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
