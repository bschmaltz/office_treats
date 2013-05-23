$(document).ready(function(){
	
	var ignore = false;
	var imgArray = $('.content_image');
	var imgFlags = [];
	for(var i=0; i<imgArray.length; i++){
		imgFlags[i]=1;
	}
	$('.content_image').css("height", 20);
	$('.content_image').click(on_image_click);

	
	postArray = $('.item');
	postFlags = [];
	for(var i=0; i<postArray.length; i++){
		postFlags[i]=1;
	}
	$('.rating').click(function(){ignore=true;});
	$('.gravatar').click(function(){ignore=true;});
	$('.user').click(function(){ignore=true;});
	$('.delete').click(function(){ignore=true;});
	$('.comments_section').click(function(){ignore=true;});
	$('.content_image').click(function(){ignore=true;});

	$('.item').click(on_post_click);
	$('.comments_section').hide();
	
	function on_image_click(){
		var x = imgArray.index($(this));
		if(imgFlags[x]==1)
			$(this).animate({height: '+=330px'}, 200);
		else
			$(this).animate({height: '-=330px'}, 200);

		imgFlags[x] *= -1;
	}
	
	function on_post_click(){
		if(ignore==false){
			var x = $('.item').index($(this));
			if(postFlags[x]==1){
				$($('.comments_section')[x]).slideDown(400);
			}else{
				$($('.comments_section')[x]).slideUp(400);
			}

			postFlags[x] *= -1
		}
		ignore=false;
	}
	
});
