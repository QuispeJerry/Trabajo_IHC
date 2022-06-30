
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

