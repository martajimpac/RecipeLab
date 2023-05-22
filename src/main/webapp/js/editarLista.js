/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

var nombre = document.getElementById("nombre");
var editar = document.getElementById("editarLista");

editar.addEventListener('click' , function(){

    // Valor inicial
    let valor = nombre.textContent;

    // Mostrar ventana emergente y obtener el nuevo valor
    let nuevoValor = prompt("Introduce un nuevo nombre para la lista:", valor);

    // Verificar si se ha ingresado un nuevo valor
    if (nuevoValor !== null) {
      // Actualizar el valor si se ha ingresado algo
      valor = nuevoValor;
      
      console.log("Nuevo valor:", valor);
    } else {
      console.log("No se ha ingresado ningún valor.");
    }
});