$(function(){

	var countDownDate = new Date(randomDate(new Date(), new Date(2019, 08, 01))).getTime();

	var count = setInterval(function(){
	    var now = new Date().getTime();
	    var distance = countDownDate - now;
	    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
	    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
	    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
	    
	    for(var i=0; i<4; i++){
	    	document.getElementById("timer_"+i).innerHTML = days + "일 " + hours + "시 " + minutes + "분 " + seconds + "초 ";
	    }      
	},1000);
});
	
function randomDate(start, end){
    return new Date(start.getTime() + Math.random() * (end.getTime() - start.getTime()));
}