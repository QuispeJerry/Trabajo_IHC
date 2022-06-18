var swiper = new Swiper('.swiper-container', {
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev'
    },
    slidesPerView: 1,
    spaceBetween: 10,
    // init: false,
    pagination: {
        el: '.swiper-pagination',
        clickable: true,
    },


    breakpoints: {
        620: {
            slidesPerView: 1,
            spaceBetween: 20,
        },
        680: {
            slidesPerView: 1,
            spaceBetween: 40,
        },
        920: {
            slidesPerView: 1,
            spaceBetween: 40,
        },
        1240: {
            slidesPerView: 1,
            spaceBetween: 50,
        },
    }
});