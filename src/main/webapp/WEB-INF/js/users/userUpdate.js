$(function(){
	$("div.filter").click(function(){
		console.log('fileadd');
		$("input[name='profile_image_uploader'").click();
	});
	
	$("input[name='profile_image_uploader']").change(function(e){
	    e.preventDefault();
	    
	    readURL(this);
	 
	});
	
	$("label[for='user_sex_0']").click(function(){
		var isType = $("#user_sex_0:radio[value='0']").attr("aria-state");
		if(isType == 1) {
			$("#user_sex_0:radio[value='0']").prop('checked', true);
			$("#user_sex_1:radio[value='1']").prop('checked', false);
			$("#user_sex_0:radio[value='0']").attr("aria-state", 0);
			$(".man").attr("src", "/image/common/checked.png");
			$(".woman").attr("src", "/image/common/empty.png");
		} 
	});
	
	$("label[for='user_sex_1']").click(function(){
		var isType = $("#user_sex_0:radio[value='0']").attr("aria-state");
		if(isType == 0) {
			$("#user_sex_1:radio[value='1']").prop('checked', true);
			$("#user_sex_0:radio[value='0']").prop('checked', false);
			$("#user_sex_0:radio[value='0']").attr("aria-state", 1);
			$(".woman").attr("src", "/image/common/checked.png");
			$(".man").attr("src", "/image/common/empty.png");
		} 
	});
	
	$(".comment").keyup(function(){
		var len = $(this).val().length;
		$("#typed").text(len);
		
		if(len > 40) {
			$(this).val($(this).val().substring(0, 40));
		}
	});
});

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
        	$(".result").css("background-image", "url('"+e.target.result+"')");
//        	console.log(e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}