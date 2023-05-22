/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


//login y logout
var loginImage = document.getElementById("login-image");
var submenu = document.querySelector(".submenu");
var cerrarSesion = document.getElementById("cerrar-sesion");

loginImage.addEventListener("click", function() {
    console.log(submenu)
    submenu.style.display = "block";
});

document.addEventListener("click", function(event) {
    if (!submenu.contains(event.target) && event.target !== loginImage) {
        submenu.style.display = "none";
    }
});

cerrarSesion.addEventListener("click", function() {
    alert("La sesion se ha cerrado correctamente");
});