$(document).ready(function(){
	
	var ignore = false;
	var imgArray = $('.content_image');
	var imgFlags = [];
	for(var i=0; i<imgArray.length; i++){
		imgFlags[i]=1;
	}
	$('.content_image').css("height", 20);
	$('.content_image').click(on_image_click);
	$('.comment_text_input').val('');

	
	postArray = $('.item');
	postFlags = [];
	for(var i=0; i<postArray.length; i++){
		postFlags[i]=1;
	}
	$('.ignore').click(function(){ignore=true;});

	$('.item').click(on_post_click);
	$('.comments_section').hide();


	$('.delete_comment_img').hover(function() {
                $(this).attr("src", "assets/delete_hover.png");
        }, function(){
        		$(this).attr("src", "assets/delete_static.png");
        });	

	//Set button disabled
    $('.comment_post_btn').attr("disabled", "disabled");

      //Append a change event listener to your input
      $('.comment_text_input').keyup(function(){
      	var x = $('.comment_text_input').index($(this));
      	if($(this).val() != ''){
        	$($('.comment_post_btn')[x]).removeAttr('disabled');
        }else{
        	$($('.comment_post_btn')[x]).attr("disabled", "disabled");
        }
      });


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
				$($('.comments_section')[x]).css('opacity', 0)
																	  .slideDown('slow')
																	  .animate(
																	    { opacity: 1 },
																	    { queue: false, duration: 500 }
																	  );
			}else{
				$($('.comments_section')[x]).css('opacity', 1)
																	  .slideUp('slow')
																	  .animate(
																	    { opacity: 0 },
																	    { queue: false, duration: 500 }
																	  );
			}

			postFlags[x] *= -1
		}
		ignore=false;
	}
	
});
