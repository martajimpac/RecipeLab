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
<<<<<<< HEAD

=======
    
>>>>>>> a6178d8b24c5f550abaad2e1885a0e67db03a392
    $(".boton-responder").click(function(){
        if($(this).text() === "Responder"){
            var div = $('<div />', {
                className: "col-respuesta",
<<<<<<< HEAD
                style: "margin-left: 9%"
            });
            var textArea = $('<textarea style=" width: 80%" />');
            div.append(textArea);
=======
                style: "margin-left: 9%" 
            });
            var textArea = $('<textarea style=" width: 80%" />');
            div.append(textArea); 
>>>>>>> a6178d8b24c5f550abaad2e1885a0e67db03a392
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
<<<<<<< HEAD
                    div.append('<div class="card">\n\
=======
                div.append('<div class="card">\n\
>>>>>>> a6178d8b24c5f550abaad2e1885a0e67db03a392
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
<<<<<<< HEAD
                });
            } else div.remove();

            textArea.remove();

=======
                });   
            } else div.remove();
            
            textArea.remove();
            
>>>>>>> a6178d8b24c5f550abaad2e1885a0e67db03a392
            $(this).text("Responder");
        }

    });
<<<<<<< HEAD
});
=======
});

>>>>>>> a6178d8b24c5f550abaad2e1885a0e67db03a392
