$(document).ready(function(){

	imgArray = $('.content_image');
	imgZoomArray = {};
	for(var i=0; i<imgArray.length; i++){
		imgZoomArray[i]=1;
	}

	function on_image_click(){
		var x = imgArray.index($(this));
		if(imgZoomArray[x]==1)
			$(this).animate({height: '+=330px'}, 200);
		else
			$(this).animate({height: '-=330px'}, 200);

		imgZoomArray[x] *= -1;;
		
	}
	
	for(var i=0; i<imgArray.length; i++){
		imgArray[i].onload = function() {
  			$(this).css("height", 20); 
  			$(this).click(on_image_click);
		}	
	}
});
