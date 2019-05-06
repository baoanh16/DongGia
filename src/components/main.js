$(document).ready(function () {
	if ($(window).scrollTop() > 0) {
		$('header').addClass('fixed')
	} else {
		$('header').removeClass('fixed')
	}
	$(window).on('scroll', function () {
		if ($(window).scrollTop() > 0) {
			$('header').addClass('fixed')
		} else {
			$('header').removeClass('fixed')
		}
	})

	// Cart
	$('body').on('click', '.cart-toggle', function () {
		$('header .cartpanel').toggleClass('open')
	})

	$('body').on('click', '.btn-closecart .lnr-cross', function () {
		$('header .cartpanel').removeClass('open')
	})


	// Header Language
	$('header .language .current').on('click', function () {
		$('header .language .dropdown').toggleClass('active')
		$(this).toggleClass('active')
	})

	// Header search
	$('header .search .search-toggle').on('click', function () {
		$('body').removeClass('hiddenX')
		$('header .search .searchbox').slideToggle()
		$('header .backdrop').hide()
		$('header .category-list').removeClass('active')
		$('header .sub-menu').removeClass('active')
		$('header .language .dropdown').removeClass('active')
		$('header .language .current').removeClass('active')
	})

	// Header menu mobile
	$('header .toggle-menu').on('click', function () {
		$('header .search .searchbox').hide()
		$('header .language .dropdown').removeClass('active')
		$('header .language .current').removeClass('active')
		$('header .backdrop').fadeToggle()
		$('header .category-list').toggleClass('active')
		$('header .sub-menu').toggleClass('active')
		$('body').toggleClass('hiddenX')
	})

	// Remove menu toggle effect
	$('header .backdrop').on('click', function () {
		$('body').removeClass('hiddenX')
		$('header .search .searchbox').hide()
		$('header .language .dropdown').removeClass('active')
		$('header .language .current').removeClass('active')
		$('header .backdrop').hide()
		$('header .category-list').removeClass('active')
		$('header .sub-menu').removeClass('active')
	})
	$(window).on('resize', function () {
		$('body').removeClass('hiddenX')
		$('header .search .searchbox').hide()
		$('header .language .dropdown').removeClass('active')
		$('header .language .current').removeClass('active')
		$('header .backdrop').hide()
		$('header .category-list').removeClass('active')
		$('header .sub-menu').removeClass('active')
	})

	var Banner = new Swiper('.dg-about-banner .swiper-container', {
		slidesPerView: 1,
		loop: true,
		navigation: {
			nextEl: '.dg-about-banner .swiper-next',
			prevEl: '.dg-about-banner .swiper-prev'
		},
		lazy: true,
	})

	var $isoGrid = $('.gallery .grid').isotope({
		itemSelector: '.grid-item',
		percentPosition: true,
		masonry: {
			columnWidth: '.grid-sizer',
			gutter: 0,
		}
	})
	$isoGrid.imagesLoaded().progress(function () {
		$isoGrid.isotope('layout');
	});
	// $(window).on('resize', function () {
	// 	$('.gallery .grid').isotope('shuffle')
	// })

	$('.gallery .viewmore a').on('click', function (e) {
		e.preventDefault()
		var url = $(this).attr('href')
		$.ajax({
			url: url,
			data: { isAjax: true },
			success: function (data) {
				let newHtml = $($(data).find('.grid').html()).filter('.grid-item')
				$isoGrid.isotope('insert', newHtml)
				let newUrl = $($(data).find('.viewmore').html()).attr('href')
				$('.gallery .viewmore a').attr('href', newUrl)
			},
		})
	})

	var Banner = new Swiper('.dg-banner .swiper-container', {
		slidesPerView: 1,
		autoplay: {
			disableOnInteraction: false,
			delay: 4000
		},
		speed: 1200,
		loop: true,
		loopAdditionalSlides: 1,
		lazy: true,
	})

	$('.product-category .nav-item').on('click', function () {
		$(this).toggleClass('active')
		$(this).find('.dropdown').fadeToggle()
		$('.product-category .nav-item').not(this).removeClass('active')
		$('.product-category .nav-item').not(this).find('.dropdown').hide()
	})

	var productThumbnail = new Swiper('.product-image .thumbnail', {
		slidesPerView: 4,
		speed: 1200,
		loop: true,
		slideToClickedSlide: true,
		autoplay: {
			delay: 3500,
			disableOnInteraction: false,
		}
	})
	productThumbnail.on('click', function () {
		var target = $('.product-image .thumbnail .swiper-slide-active').attr('data-target')
		$('.product-image .big .slide').not('[data-id=' + target + ']').hide()
		$('[data-id=' + target + ']').fadeIn(400)
	})
	productThumbnail.on('transitionStart', function () {
		var target = $('.product-image .thumbnail .swiper-slide-active').attr('data-target')
		$('.product-image .big .slide').not('[data-id=' + target + ']').hide()
		$('[data-id=' + target + ']').fadeIn(400)
	})

	// Product Tab
	$('.product-tab nav a').on('click', function (e) {
		e.preventDefault()
		$(this).addClass('active')
		$('.product-tab nav a').not(this).removeClass('active')
		$('.product-tab .pcontent').not(target).hide()
		var target = $(this).attr('href')
		$(target).fadeIn()
	})

	// product other slide
	var productOther = new Swiper('.product-wrapper .product-other .swiper-container', {
		slidesPerView: 3,
		loop: true,
		speed: 1000,
		spaceBetween: 20,
		autoplay: {
			delay: 3000,
			disableOnInteraction: false,
		},
		breakpoints: {
			768: {
				slidesPerView: 2,
			}
		}
	})
	var productOther = new Swiper('.checkout .product-other .swiper-container', {
		slidesPerView: 4,
		loop: true,
		speed: 1000,
		spaceBetween: 20,
		autoplay: {
			delay: 3000,
			disableOnInteraction: false,
		},
		breakpoints: {
			992: {
				slidesPerView: 3,
			},
			768: {
				slidesPerView: 2,
			}
		}
	})

	let contentDropdown = $('.dg-sp-body .sp-item .question')
	contentDropdown.on('click', function () {
		if ($(this).next().is(':hidden') === true) {
			$(this).next().slideDown('slow')
			$(this).addClass('active')
		} else {
			$(this).next().slideUp('slow')
			$(this).removeClass('active')
		}
	});

	$('#gotop').on('click', function () {
		$('html,body').animate({
			scrollTop: 0
		}, 1000)
	})


	// Cart
	$('.minus').each(function () {
		$(this).on('click', function () {
			let quantity = parseInt($(this).siblings('.quantity-number').attr('value'))
			if ($(this).siblings('.quantity-number').val() <= 0) {
				quantity = 0;
			} else {
				quantity = quantity - 1;
			}
			$(this).siblings('.quantity-number').attr('value', quantity)
		})
	})
	$('.plus').each(function () {
		$(this).on('click', function () {
			let quantity = parseInt($(this).siblings('.quantity-number').attr('value'))
			quantity = quantity + 1;
			$(this).siblings('.quantity-number').attr('value', quantity)
		})
	})


	$('#btn-ttmh').click(function () {
		$(this).toggleClass('active')
		$('.checkout-address-edit .address-edit-other').slideToggle();
	})
	$('#btn-cntt').click(function () {
		$(this).toggleClass('active')
	})
	$('.checkout-address-edit .cart-bill-export #btn-xuathd').click(function () {
		$(this).toggleClass('active')
		$('.checkout-address-edit .cart-bill-info').slideToggle();
	})
	$('.cart-payment-method .method label').click(function () {
		$(this).addClass('active')
		$(this).parent().siblings('.method').find('label').removeClass('active')
	})
	$('.quantity.input-number .minus, .quantity.input-number .plus').click(function () {
		$(this).siblings('input').trigger('change')
	})

	if ($('.en-us').length > 0) {
		if ($('.guest-email').length > 0) {
			$('.en-us .guest-email .module-title').html('Email')
		}
		if ($('.login-form').length > 0) {
			$('.en-us .login-form .module-title').html('Email')
		}
	}
	var videoPlay = false;
	$('.dg-about-profile .button-video').on('click', function () {
		if (videoPlay == false) {
			console.log(videoPlay)
			$('.dg-about-profile video').trigger('play')
			videoPlay = true;
		} else {
			console.log(videoPlay)
			$('.dg-about-profile video').trigger('pause')
			videoPlay = false;
		}
	})
	$('.dg-about-profile .video').on('mouseover', function () {
		$('.dg-about-profile .button-video').fadeIn(300)
	}).on('mouseleave', function () {
		$('.dg-about-profile .button-video').fadeOut(400)
	})

	$('#wowbook').wowBook({
		width: 1240,
		height: 790,
		centeredWhenClosed: true,
		hardcovers: true,
		pageNumbers: false,
		controls: {
			zoomIn: '#zoomin',
			zoomOut: '#zoomout',
			next: '#next',
			back: '#back',
			first: '#first',
			last: '#last',
		},
		scaleToFit: ".wowbook-wrapper"
	});
})