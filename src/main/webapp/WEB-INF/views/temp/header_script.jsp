<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- ========================= JS here ========================= -->
    <script src="/resources/assets/js/bootstrap.min.js"></script>
    <script src="/resources/assets/js/wow.min.js"></script>
    <!-- <script src="/resources/assets/js/tiny-slider.js"></script> home에서만 필요한 js-->
    <script src="/resources/assets/js/glightbox.min.js"></script>
    <script src="/resources/assets/js/count-up.min.js"></script>
    <script src="/resources/assets/js/imagesloaded.min.js"></script>
    <script src="/resources/assets/js/isotope.min.js"></script>
    <script src="/resources/assets/js/main.js"></script>
    <script type="text/javascript">
	  /* //======== Hero Slider
	    var slider = new tns({
	        container: '.hero-slider',
	        slideBy: 'page',
	        autoplay: true,
	        autoplayButtonOutput: false,
	        mouseDrag: true,
	        gutter: 0,
	        items: 1,
	        nav: false,
	        controls: true,
	        controlsText: [
	            '<i class="lni lni-chevron-left"></i>',
	            '<i class="lni lni-chevron-right"></i>'
	        ],
	        responsive: {
	            1200: {
	                items: 1,
	            },
	            992: {
	                items: 1,
	            },
	            0: {
	                items: 1,
	            }
	
	        }
	    }); */
	    //========= testimonial 
	    /* tns({
	        container: '.testimonial-slider',
	        items: 3,
	        slideBy: 'page',
	        autoplay: false,
	        mouseDrag: true,
	        gutter: 0,
	        nav: true,
	        controls: false,
	        controlsText: ['<i class="lni lni-arrow-left"></i>', '<i class="lni lni-arrow-right"></i>'],
	        responsive: {
	            0: {
	                items: 1,
	            },
	            540: {
	                items: 1,
	            },
	            768: {
	                items: 2,
	            },
	            992: {
	                items: 2,
	            },
	            1170: {
	                items: 3,
	            }
	        }
	    }); */
	
	    //====== counter up 
	    var cu = new counterUp({
	        start: 0,
	        duration: 2000,
	        intvalues: true,
	        interval: 100,
	        append: " ",
	    });
	    cu.start();
	    /* //========= glightbox
	    GLightbox({
	        'href': 'https://www.youtube.com/watch?v=r44RKWyfcFw&fbclid=IwAR21beSJORalzmzokxDRcGfkZA1AtRTE__l5N4r09HcGS5Y6vOluyouM9EM',
	        'type': 'video',
	        'source': 'youtube', //vimeo, youtube or local
	        'width': 900,
	        'autoplayVideos': true,
	    }); */
	    //============== isotope masonry js with imagesloaded
	    imagesLoaded('#container', function () {
	        var elem = document.querySelector('.grid');
	        var iso = new Isotope(elem, {
	            // options
	            itemSelector: '.grid-item',
	            masonry: {
	                // use outer width of grid-sizer for columnWidth
	                columnWidth: '.grid-item'
	            }
	        });
	
	        let filterButtons = document.querySelectorAll('.portfolio-btn-wrapper button');
	        filterButtons.forEach(e =>
	            e.addEventListener('click', () => {
	
	                let filterValue = event.target.getAttribute('data-filter');
	                iso.arrange({
	                    filter: filterValue
	                });
	            })
	        );
	    });
    </script>