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




function mostrarcontraseña(){

    var boton = document.getElementById('botonVer');
    var boton1 = document.getElementById('botonOcultar');
    var input =document.getElementById('contraseña');

    if(input.type == "password"){
        input.type = "text";
        boton.style.display = "none"
        boton1.style.display = "block"
    } else {
        input.type = "password";
        boton.style.display = "block"
        boton1.style.display = "none"
    }
}

