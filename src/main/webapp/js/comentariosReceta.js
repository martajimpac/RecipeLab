/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

$(document).ready(function() {
    $(".cuerpo-comentario").hover(function(){
        var boton = $(this).find("button");
        boton.css('display','inline-block');
    },function(){
        var boton = $(this).find("button");
        if(boton.text() === "Enviar"){
            boton.parent().find("textarea").remove();
            boton.text("Responder");
        }
        boton.css('display','none');
    });
    
    $(".boton-responder").click(function(){
        if($(this).text() === "Responder"){
            var div = $('<div />', {
                className: "col-respuesta",
                style: "margin-left: 9%" 
            });
            var textArea = $('<textarea style=" width: 80%" />');
            div.append(textArea); 
            $(this).before(div);
            $(this).text("Enviar");
        } else {
            var idReceta = $('.receta-id').text();
            var texto = $(this).parent().find("label").text();
            var emailCom = $('.comentario-email').text();
            var fechaCom = $('.comentario-fecha').text();
            var textArea = $(this).parent().find("textarea");
            var respuesta = textArea.val();
            var div = textArea.parent();
            if(respuesta !== ""){
                $.getJSON("InsertaComentarioServlet",{
                    id: idReceta,
                    email: emailCom,
                    fecha: fechaCom,
                    com: texto,
                    resp: respuesta
                }, function(data){
                div.append('<div class="card">\n\
                            <div class="card-body cuerpo-comentario">\n\
                            <div class="row">\n\
                            <div class="col-1">\n\
                            <img class="img fotoPerfil" src="' + data[1] + '"/>\n\
                            </div>\n\
                            <div class="col respuesta">\n\
                            <label>' + data[2] + '</label>\n\
                            </div>\n\
                            </div>\n\
                            </div>\n\
                            </div>');
                });   
            } else div.remove();
            
            textArea.remove();
            
            $(this).text("Responder");
        }

    });
});
