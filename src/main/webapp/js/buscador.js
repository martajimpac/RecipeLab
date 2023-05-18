
//filtros tipo slider
const sliderPrecio = document.getElementById("precio");
const valorPrecio = document.getElementById("valor-precio");

sliderPrecio.value = -1;
sliderPrecio.addEventListener("input", function() {
    // Obtiene el valor seleccionado por el usuario
    valorPrecio.textContent = sliderPrecio.value + " €";

    // Cambia el color de fondo del control deslizante
    sliderPrecio.style.color = `#ff9900`;
});

const sliderDuracion = document.getElementById("duracion");
const valorDuracion = document.getElementById("valor-duracion");

sliderDuracion.value = -1;
sliderDuracion.addEventListener("input", function() {
  // Obtiene el valor seleccionado por el usuario
  valorDuracion.textContent = secondsToString(sliderDuracion.value) + " segundos";
  
  // Cambia el color de fondo del control deslizante
  sliderDuracion.style.color = `#ff9900`;
});


//funcion que pasa los segundos a un string
function secondsToString(seconds) {
    var hour = Math.floor(seconds / 3600);
    hour = (hour < 10)? '0' + hour : hour;
    var minute = Math.floor((seconds / 60) % 60);
    minute = (minute < 10)? '0' + minute : minute;
    var second = seconds % 60;
    second = (second < 10)? '0' + second : second;
    return hour + ':' + minute + ':' + second;
}


//añadir menu desplegable en el header


//ocultar los filtros cuando seleccionamos personas
const select = document.getElementById("tipo-busqueda");
const filtros = document.getElementById("divfiltros");

select.addEventListener("change", function() {
    if (this.value === "personas") {
        filtros.style.display = "none";
    }else{
        filtros.style.display = "block";
    }
});
