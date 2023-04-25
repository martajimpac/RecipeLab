/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

document.getElementById('file-input').onchange = function(e) {
    // Get the first file in the FileList object
    var imageFile = this.files[0];
    // get a local URL representation of the image blob
    var url = window.URL.createObjectURL(imageFile);
    document.getElementById('imagenReceta').src = url;
};

$(document).ready(function() {
    $("#botonPaso").click(function(){
        var paso =$('#textoPaso').val();
        $('#textoPaso').val("");
        $('#listaPasos').append("<li>"+paso+"</li>");
        var input = $("<input/>",{
        type: "hidden",
        name: ""+$("#listaPasos").length,
        value: paso });
        $('#listaPasos').after(input);
    });
    // all custom jQuery will go here
});



