/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

var corazon =  document.getElementById("corazon");
var submenu = document.getElementsById("submenuCorazon");
var crearLista = document.getElementById("crear-lista");
var anadirLista = document.getElementById("anadir-lista");

corazon.addEventListener("click", function() {
    alert("Has pulsado");
    
    if (submenu.style.display === "block") {
        submenu.style.display = "none";
    } else {
        submenu.style.display = "block";
    }
});

crearLista.addEventListener("click", function() {
    var nombreLista = prompt("Introduce el nombre de la lista:");
    if (nombreLista !== null) {
        // Aquí puedes hacer algo con el nombre de la lista ingresado
        alert("Has creado una nueva lista con el nombre: " + nombreLista);
    }
});

anadirLista.addEventListener("click", function() {
    alert("Se ha añadido la receta a la lista " + "nombreLista");
});