//current position
var pos = 0;
//number of slides
var totalSlides;
//get the slide width
var sliderWidth;
var slideInterval = 1000 * 2.5;

$(document).ready(function(){
	totalSlides = $('#slider-wrap ul li').length;
	sliderWidth = $('#slider-wrap').width(); 
    /*****************
     BUILD THE SLIDER
    *****************/
    //set width to be 'x' times the number of slides
    $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
    
    //next slide    
    $('#next').click(function(){
        slideRight();
    });
    
    //previous slide
    $('#previous').click(function(){
        slideLeft();
    });
       
    
    /*************************
     //*> OPTIONAL SETTINGS
    ************************/
    //automatic slider
    var autoSlider = setInterval(slideRight, slideInterval);
    
    //for each slide 
    $.each($('#slider-wrap ul li'), function() { 
       //create a pagination
       var li = document.createElement('li');
       $('#pagination-wrap ul').append(li);    
    });
    
    //pagination
    pagination();
    
    //hide/show controls/btns when hover
    //pause automatic slide when hover
    $('#slider-wrap').hover(
      function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
      function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, slideInterval); }
    );
    
	$('.main_header_image img').hover(
		function(){
			$('.main_header_more').addClass('active');
		},
		function(){
			$('.main_header_more').removeClass('active');
		}
    );
    
});//DOCUMENT READY
    


/***********
 SLIDE LEFT
************/
function slideLeft(){
    pos--;
    if(pos==-1){ pos = totalSlides-1; }
    $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));    
    
    //*> optional
    pagination();
}


/************
 SLIDE RIGHT
*************/
function slideRight(){
    pos++;
    if(pos==totalSlides){ pos = 0; }
    $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
    
    //*> optional 
    pagination();
}


/************************
 //*> OPTIONAL SETTINGS
************************/

function pagination(){
    $('#pagination-wrap ul li').removeClass('active');
    $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
}
     

/************************
//*> 오늘의딜 SLIDER SETTINGS
************************/
//current position
var deal_pos = 0;
//number of slides
var deal_totalSlides;
//get the slide width
var deal_sliderWidth;

$(document).ready(function(){
	deal_totalSlides = $('#main_recommends_slider_wrap ul li').length;
	deal_sliderWidth = $('#main_recommends_slider_wrap').width(); 
 
	/*****************
     BUILD THE SLIDER
    *****************/
    //set width to be 'x' times the number of slides
    $('#main_recommends_slider_wrap ul#main_recommends_slider').width(deal_sliderWidth*deal_totalSlides);
    
    //next slide    
    $('#recommends_next').click(function(){
        deal_slideRight();
    });
    
    //previous slide
    $('#recommends_previous').click(function(){
        deal_slideLeft();
    });
       
    
    /*************************
     //*> OPTIONAL SETTINGS
    ************************/
    //automatic slider
    //var autoSlider = setInterval(slideRight, slideInterval);
    
    //for each slide 
    $.each($('#main_recommends_slider_wrap ul li'), function() { 
       //create a pagination
       var deal_li = document.createElement('li.main_recommends_product_items');
       $('#recommends_pagination-wrap ul').append(deal_li);    
    });
    
    //pagination
    deal_pagination();
    
    $('#main_recommends_slider_wrap').hover(
    		function(){ $(this).addClass('active');}, 
    		function(){ $(this).removeClass('active');}
    	    );
    
    
});//DOCUMENT READY
    


/***********
 SLIDE LEFT
************/
function deal_slideLeft(){
    deal_pos--;
    if(deal_pos==-1){ deal_pos = deal_totalSlides-1; }
    $('#main_recommends_slider_wrap ul#main_recommends_slider').css('left', -(deal_sliderWidth*deal_pos));    
    
    //*> optional
    deal_pagination();
}


/************
 SLIDE RIGHT
*************/
function deal_slideRight(){
    deal_pos++;
    if(deal_pos==deal_totalSlides){ deal_pos = 0; }
    $('#main_recommends_slider_wrap ul#main_recommends_slider').css('left', -(deal_sliderWidth*deal_pos)); 
    
    //*> optional 
    deal_pagination();
}


/************************
 //*> OPTIONAL SETTINGS
************************/

function deal_pagination(){
    $('#recommends_pagination-wrap ul li').removeClass('active');
    $('#recommends_pagination-wrap ul li:eq('+deal_pos+')').addClass('active');
}
   
   