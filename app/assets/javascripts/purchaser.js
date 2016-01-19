//= require jquery
//= require jquery_ujs
//= require flat-ui
$(function(){
	//alert(window.innerWidth);
	//alert($(".cart_click").css('width'));																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																		  
	$(".cart").css({
		left:window.innerWidth-parseInt($(".cart").css('width'))+'px',
		top:window.innerHeight/2-parseInt($(".cart").css('height'))/2,
	});
	$(".cart_click").click(function(){
		$(".cart").animate({
			opacity:1
		});
	});
	$(".close").click(function(){
		$(".cart").animate({
			opacity:0
		});
	});
});