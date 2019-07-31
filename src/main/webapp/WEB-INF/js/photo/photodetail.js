$(function(){
	var session_member_no = $("#comment_append").attr("session-data-member");
	var member_no = $("#comment_append").attr("data-member");
	var photo_seq_no = $("input[name='photo_seq_no']").val();
	var time = new Date();
	commentList(member_no, photo_seq_no);
	
	$("#comment").keydown(function(key){
		if(key.keyCode == 13) {
			var comment = $("#comment").val();
			insertComment(comment, session_member_no, photo_seq_no);
		}
	});
	
	
	$(".sidebar__action__btn").on('click', function(){
		var src = ($(".icon--common-action>img:eq(0)").attr('src') === '../image/common/heart.png')
			? '../image/common/red_heart.png' : '../image/common/heart.png'
				$(".icon--common-action>img:eq(0)").attr('src', src);
	});
})

function likePhoto(photo_seq_no){
	$.ajax({
		url:'like.do',
		type:'get',
		data:{
			"photo_seq_no" : photo_seq_no
		},
		dataType: 'json',
		error:function(request,status,error){
			alert("test");
		},
		success: function(data){
			
		}
	})
}

function Unix_timestamp(t)
{
	var months_arr = ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'];
	var dt = new Date(t);
	var year = dt.getFullYear();
	var month = months_arr[dt.getMonth()];
	var day = dt.getDate();
	var hr = dt.getHours();
	var m = "0" + dt.getMinutes();
	var s = "0" + dt.getSeconds();
	return year + '년 ' + month + ' ' + day + '일 ' + hr + ':' + m.substr(-2) ;  
}

function insertComment(comment, session_member_no, photo_seq_no) {
	$.ajax({
		url:'writeComment.do',
		type:'post',
		data:{
			"member_no": session_member_no,
			"p_reply_content": comment,
			"p_reply_no": photo_seq_no,
		},
		dataType: 'json',
		error:function(request,status,error){
			alert("로그인 후 댓글 작성이 가능합니다");
			window.location.href = "/member/gotoSignin";
        },
        success:function(data){
        	var str = "";
        	for(i=0;i<data.length;i++) {
			str += "<li class='comment-feed__list__item'>";
				str += 	"<article class='comment-feed__item'>";
					str +=	"<p class='comment-feed__item__content'>";
					str +=		"<a class='comment-feed__item__content__author'>";
									if(data[i].member_image == null){
										str += "<img class='comment-feed__item__content__author__image' src='/image/common/user.png'>";
									} else if(data[i].member_image != null){
										str += "<img class='comment-feed__item__content__author__image' src='/uploadImage/"+data[i].member_image+"'>";
									}
										str += "<span class='comment-feed__item__content__author__name'>"+data[i].member_nickname+"</span>";
							str+= "</a>";
					  	str+= "<span class='comment-feed__item__content__content'>"+data[i].p_reply_content+"</span>";
						str+= "</p>";
						str+= "<footer class='comment-feed__item__footer'>";
							str+= "<time class='comment-feed__item__footer__time'>";
								str+= Unix_timestamp(data[i].reg_date);
							str+= "</time>";
						str+= "</footer>";
					str+= "</article>";
				str+= "</li>";								
        	}
        	$("#comment_append").empty();
        	$("#comment_append").html(str);
        }
	});
}


function commentList(session_member_no, photo_seq_no) {
	$.ajax({
		url:'writeComment.do',
		type:'post',
		data:{
			"member_no": session_member_no,
			"p_reply_no": photo_seq_no  
		},
		dataType: 'json',
		error:function(request,status,error){
            alert("댓글 읽기 실패했음");
        },
        success:function(data){
        	var str = "";
        	for(i=0;i<data.length;i++) {
		str += "<li class='comment-feed__list__item'>";
			str += 	"<article class='comment-feed__item'>";
				str +=	"<p class='comment-feed__item__content'>";
				str +=		"<a class='comment-feed__item__content__author'>";
								if(data[i].member_image == null){
									str += "<img class='comment-feed__item__content__author__image' src='/image/common/user.png'>";
								} else if(data[i].member_image != null){
									str += "<img class='comment-feed__item__content__author__image' src='/uploadImage/"+data[i].member_image+"'>";
								}
								str += "<span class='comment-feed__item__content__author__name'>"+data[i].member_nickname+"</span>";
						str+= "</a>";
						str+= "<span class='comment-feed__item__content__content'>"+data[i].p_reply_content+"</span>";
					str+= "</p>";
						str+= "<footer class='comment-feed__item__footer'>";
							str+= "<time class='comment-feed__item__footer__time'>";
								str+= Unix_timestamp(data[i].reg_date);
							str+= "</time>";
						str+= "</footer>";
					str+= "</article>";
				str+= "</li>";
													
        	}
        	$("#comment_append").empty();
        	$("#comment_append").html(str);
        }
	});
}

