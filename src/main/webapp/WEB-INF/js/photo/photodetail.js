$(function(){
	var session_member_no = $("#comment_append").attr("session-data-member");
	var member_no = $("#comment_append").attr("data-member");
	var photo_seq_no = $("input[name='photo_seq_no']").val();
	var time = new Date();
	commentList(member_no, photo_seq_no);
	
	$("#comment").keydown(function(key){
		if(key.keyCode == 13) {
			var comment = $("#comment").val();
			insertComment(comment, member_no, photo_seq_no);
		}
	});
})

function insertComment(comment, member_no, photo_seq_no) {
	$.ajax({
		url:'writeComment.do',
		type:'post',
		data:{
			"member_no": member_no,
			"p_reply_content": comment,
			"p_reply_no": photo_seq_no  
		},
		dataType: 'json',
		error:function(request,status,error){
            alert("댓글 작성에 실패했음");
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
										str += "<img class='comment-feed__item__content__author__image' src='/image/common/"+data[i].member_image+"'>";
									}
										str += "<span class='comment-feed__item__content__author__name'>"+data[i].member_nickname+"</span>";
							str+= "</a>";
					  	str+= "<span class='comment-feed__item__content__content'>"+data[i].p_reply_content+"</span>";
						str+= "</p>";
						str+= "<footer class='comment-feed__item__footer'>";
							str+= "<time class='comment-feed__item__footer__time'>";
								str+= data[i].reg_date;
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


function commentList(member_no, photo_seq_no) {
	$.ajax({
		url:'writeComment.do',
		type:'post',
		data:{
			"member_no": member_no,
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
									str += "<img class='comment-feed__item__content__author__image' src='/image/common/"+data[i].member_image+"'>";
								}
								str += "<span class='comment-feed__item__content__author__name'>"+data[i].member_nickname+"</span>";
						str+= "</a>";
						str+= "<span class='comment-feed__item__content__content'>"+data[i].p_reply_content+"</span>";
					str+= "</p>";
						str+= "<footer class='comment-feed__item__footer'>";
							str+= "<time class='comment-feed__item__footer__time'>";
								str+= data[i].reg_date;
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