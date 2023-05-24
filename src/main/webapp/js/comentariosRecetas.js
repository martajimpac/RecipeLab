/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


$(document).ready(function(){
    
    $(".boton-comentar").click(function(){

        var sitio = $('.card-comentar');
        var texto = $('#texto-comentario').val();
        if(texto !== ""){
            var idReceta = $('.receta-id').text();
            
            $.getJSON("InsertaComentarioServlet",{
                id: idReceta,
                email: "",
                com: texto
            },function(data){
                sitio.after('<div class="card">\n\
                            <div class="card-body cuerpo-comentario">\n\
                            <div class="row">\n\
                            <div class="col-1">\n\
                            <img class="img fotoPerfil" src="' + data[2] + '" />\n\
                            </div>\n\
                            <div class="col comentario">\n\
                            <label>' + data[0] + '</label>\n\
                            </div>\n\
                            </div>\n\
                            </div>\n\
                            </div>');
            });
        }
    });
    
});