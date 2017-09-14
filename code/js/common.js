$(document).ready(function(){
	
	//Home Banner Hight Script START
		var winHight = $(window).height();	 
		$('.i-home-banner').css('min-height', winHight);
	//Home Banner Hight Script END
	
	//Header Sticky Script START
        $(window).scroll(function(){ 
        if ($(this).scrollTop() > 10){
            $(".navbar").stop(true, true).delay(300).addClass("i-bar-fixed"); 
        }
        else{
            $(".navbar").stop(true, true).delay(300).removeClass("i-bar-fixed"); 
        }
        });
	//Header Sticky Script END
	
	$('.i-highlight-panel').prev('div').addClass('i-no-bot-bor');
	
});