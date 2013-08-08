
                


jQuery(document).ready(function($) {
	initmasonry();
});

function initmasonry() {
	resizingDesigner();
	
	addSelected();
	fixedFilterNav();
	
}
var $wwSize;

jQuery(window).resize(function() {
		function whatsize() {
		$wwSize = jQuery('body').width();
		return $wwSize;
		}
});


function resizingDesigner() {
	$wwSize = jQuery('body').width();
	
	jQuery('#container').isotope
	({
	  // options
	 itemSelector : '.item',
	 animationEngine: 'jquery',
	 animationOptions:
	 {
		 duration: 400,
		 easing: 'linear',
		 queue: false
  	 },
	  masonry:{
		  	itemSelector:'.item',
			columnWidth:160,
			isAnimated: true,
			isFitWidth:false
		  
		  }
	});

	/*if($wwSize  > 767)
	{
		jQuery('#container').masonry
		({
			itemSelector:'.item',
			columnWidth:170,
			isAnimated: true,
			animationOptions: 
			{
				duration: 300,
				easing: 'linear',
				queue: false
			},
			isFitWidth:false
		})
	}
	else 
	{
		jQuery('#container').masonry
		({
			itemSelector:'.item',
			columnWidth:156,
			isAnimated: true,
			animationOptions: 
			{
				duration: 300,
				easing: 'linear',
				queue: false
			},
			isFitWidth:true
		})
	}*/
	doisotope();
}


function doisotope() {
	var $container = jQuery('#container');
	// initialize isotope
	$container.isotope({
	  // options...
	});
	
	// filter items when filter link is clicked
	jQuery('#filters a').click(function(){
	  var selector = jQuery(this).attr('data-filter');
	  $container.isotope({ filter: selector });
	  return false;
	});
}
function addSelected() {
jQuery('#filters li a').click(
    function(e) {
        e.preventDefault(); // prevent the default action
        e.stopPropagation(); // stop the click from bubbling
        jQuery(this).closest('ul').find('.selected').removeClass('selected');
        jQuery(this).parent().addClass('selected');
    });

}


function fixedFilterNav(){
    
    var nav = jQuery('#nav-filter');
	var bannerh = jQuery('#banner').height();
    if($wwSize<767) {
	
    jQuery(window).scroll(function () {
        if (jQuery(this).scrollTop() > bannerh) {
            nav.addClass("nav-filter-fixed");
        } else {
            nav.removeClass("nav-filter-fixed");
        }
    });
	}
	else {
		nav.addClass("nav-filter-fixed");
		jQuery('page-template-page-designer-php #main').css({'margin-top':'3.3em'})
	}
 
}
