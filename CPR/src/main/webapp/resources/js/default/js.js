jQuery(document).ready(function($) {
	initJsSweetness();
});

jQuery(window).load(function() {
	if (jQuery('body').hasClass('single-portfolio')) { jQuery('#portfolio_top_loader').hide(); }
});

function initJsSweetness() {
	portfolioHover();
	portfolioArchiveResize();
	motionNav();
	flexslider();

}
function flexslider() {
	jQuery('li iframe').parent().parent().parent().css({'padding-bottom': '56.25%'});

}
	

function resizeContents() {
	jQuery('.row-fluid .span9').css({});
}

/*jQuery(window).resize(function(){
motionNav();
});
*/	

function motionNav() 
{
	var content_w = jQuery('body').width();
	if ( content_w < 479 || content_w >767 ) 
	{
		jQuery('.main-nav a').hover
		(
		function () 
		{
			jQuery(this).animate(
			{
				paddingLeft: "10px"
			}, 300);
		},
		function()
		{
			jQuery(this).stop().animate(
			{
				paddingLeft:0
			}, 300);
		}
		)
	}	
};

function responsiveMenuToggle() {
	jQuery('#mobile_nav_toggle').toggle(
		function (e) {
            e.preventDefault();
            jQuery('#nav-main, #nav-second').slideDown();
        },
		function (e) {
			e.preventDefault();
			jQuery('#nav-main, #nav-second').slideUp();
		}
	);
}


/*function responsiveMenuToggle() {
	jQuery('#mobile_nav_toggle').click(
		function (e) {
            e.preventDefault();
            jQuery('#nav-main, #nav-second').toggle("slow");
        }
	);
}*/
function portfolioHover() {
	jQuery('.portfolio_thumb').hover(
		function () 
		{
			//mouse hover
			var header = jQuery(this).find('header');
			var mt = ((jQuery(this).height()/2));
			//jQuery(this).find('.post-thumb').css({'position':'relative','top':0,'z-index':890,'box-shadow':'0 -2px 2px 0 rgba(0, 0, 0, 0.5)'}).animate({'top':0});
			jQuery(this).find('.post-thumb').css({'top':0,'z-index':0}).animate({'top':0});
			/*jQuery(this).find('.s-text').removeClass('s-text').addClass('trans');*/
			//jQuery('.s-text').ellipsis();
			//header.find('.post-format').css({	'position': 'absolute',
			//									'top' : -50,
			//									'left' : (header.width()-header.find('.post-format').width())/2});
			//header.find('.post-format').css({opacity: 0, display: 'block'}).animate({opacity: 1, 'top' :-header.find('.post-format').height()/2}, 800);
			header.stop().css({opacity: 0.5, display: 'block', top:0 , 'z-index':900}).animate({opacity: 1, top:mt},400, "linear");
			header.find('.s-text').css({ 'margin-top' : 0, "position" : "relative", "top" : -5}).animate({ "top" :mt-24-(header.find('.s-text').height()/2)},800);
			
			
			//header.find('.s-text').css({ 'margin-top' : 0, "position" : "relative", "top" : -100}).animate({ "top" :-(header.height()-header.find('.s-text').height()+10)},800);
	
		}, 
		function () 
		{
			//mouse out
			jQuery(this).find('.post-thumb').stop().animate({'top':0, 'box-shadow':'none'});
            jQuery(this).find('header').stop().animate({'top':0, opacity: 0}, '', function(){
                jQuery(this).css({display: 'none'});
            });
			/*jQuery(this).find('.trans').removeClass('trans').addClass('s-text');*/
		}
	)
	.click(function(){
		var href = jQuery(this).find('header h2 a').attr("href");
		window.location = href;
	});
}


function portfolioArchiveResize() {
	// TODO: Better resize logic
	if ( jQuery('body').hasClass('page-template-page-portfolio-php') || jQuery('body').hasClass('tax-portfolio_category') || jQuery('body').hasClass('single-portfolio')) {
		setPortfolioThumbSize();
		//centerPortfolioHeading();
		animateThumbIn();
		jQuery(window).resize(function() {
			setPortfolioThumbSize();
			//centerPortfolioHeading();
		});
	}
}
	function animateThumbIn() {
        if ( animate_thumbs == false || jQuery('body').hasClass('single-portfolio') ) { jQuery('.portfolio_thumb .post-thumb img').css({"opacity" : 1}); return; }
        
        var img_w = jQuery('.portfolio_thumb .post-thumb').width(),
            img_h = jQuery('.portfolio_thumb .post-thumb').height();
            
        jQuery('.portfolio_thumb .post-thumb img').each(function(index) {
            var randomNum = Math.ceil(Math.random()*4);
            
            if (img_h == 0 ) { img_h = parseInt(jQuery(this).attr("height")); }
            
            if ( randomNum == 1 ) {
                jQuery(this).css({"position" : "relative", "left" : -img_w}).attr({"data-animation": "left"});
            }
            else if ( randomNum == 2 ) {
                jQuery(this).css({"position" : "relative", "left" : img_w}).attr({"data-animation": "right"});
            }
            else if ( randomNum == 3 ) {
                jQuery(this).css({"position" : "relative", "top" : -img_h}).attr({"data-animation": "top"});
            }
            else { // 4
                jQuery(this).css({"position" : "relative", "top" : img_h}).attr({"data-animation": "bottom"});
            }
        });
        
        var photoDivs = jQuery('.portfolio_thumb').length,
            indexArray = [],
            animation_speed = 500,
            animation_interval = 70,
            start_hack = 'start_hack';
        
        for (i=photoDivs; i>0; i--) {
            indexArray.push(i-1);
        }
        
        fisherYates(indexArray);
        //animateSingleThumbIn();
        
        checkImagesLoad();
        
        function checkImagesLoad() {
        	var count = 0;
	        jQuery('.portfolio_thumb .post-thumb img').load(function() {
		        count++;
		        if ( indexArray.length == count) { animateSingleThumbIn(); }
	        });
        }
        
        function animateSingleThumbIn() {
        	start_hack = 'started';
            jQuery('#portfolio_top_loader').hide();
            for (i in indexArray) {
	            var th_to_animate = jQuery('.portfolio_thumb:eq('+indexArray[i]+') .post-thumb img'),
	            	delay = i * animation_interval;
	            if ( th_to_animate.attr("data-animation") == "left" || th_to_animate.attr("data-animation") == "right" ) {                    	
	            	th_to_animate.delay(delay).animate({ 
	                    left: 0,
	                    opacity: 1
	                }, animation_speed );
                } else {
                	th_to_animate.delay(delay).animate({ 
                        top: 0,
                        opacity: 1
                    }, animation_speed );
                }          
            }
        }
        
        jQuery(window).load(function() {
	        if ( start_hack == 'start_hack' ) animateSingleThumbIn();
        });
        
        //var th_intervalId = setTimeout(animateSingleThumbIn, animation_interval);
    }
	
	function setPortfolioThumbSize() {
		//var content_w = jQuery('#content').width();
		var content_w = jQuery('body').width();
		if ( content_w >1800) {
			jQuery('.portfolio_thumb').removeClass("span3 span4 span2").addClass("span1");
			
		}
		else if ( content_w < 1800 && content_w > 1400) {
			jQuery('.portfolio_thumb').removeClass("span3 span4 span1").addClass("span2");
			
		}
		else if ( content_w < 1400 && content_w > 1150) {
			jQuery('.portfolio_thumb').removeClass("span2 span4 span1").addClass("span3");
			
		}
		else if ( content_w < 1150) {
			jQuery('.portfolio_thumb').removeClass("span2 span3 span1").addClass("span4");
			
		}
	}
/* Helpers
---------------------------------------------------------- */
function fisherYates ( myArray ) {
	var i = myArray.length;
	if ( i == 0 ) return false;
	while ( --i ) {
		var j = Math.floor( Math.random() * ( i + 1 ) );
		var tempi = myArray[i];
		var tempj = myArray[j];
		myArray[i] = tempj;
		myArray[j] = tempi;
	}
}

/**
 * Disable right click
 *
 * */

if ( block_rc === true ) {
    jQuery(this).bind("contextmenu", function(e) {
        e.preventDefault();
    });
}