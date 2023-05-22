/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

$(document).ready(function(){
    
    $.getJSON("ObtenerComentarios",function(data){
        data.forEach(function(e){
            if(e.respuesta === "")$('.submenu-comentarios').append('<li><a href="VerRecetaServlet?id=' + e.idReceta + '"> Comentario nuevo: <br>'+ e.texto +'</a></li>');
            else $('.submenu-comentarios').append('<li><a href="VerRecetaServlet?id=' + e.idReceta + '"> Respuesta nueva: <br>'+ e.respuesta +'</a></li>');
        });
        
    });
   
    $('#login-image').click(function(){
        if($('.submenu').css('display') === 'none'){
            $('.submenu-comentarios').css('display','none')
            $('.submenu').css('display','block');
        } else $('.submenu').css('display','none');
    });
    
    $('#comentario-image').click(function(){
        if($('.submenu-comentarios').css('display') === 'none') {
            $('.submenu').css('display','none');
            $('.submenu-comentarios').css('display','block');
        } else $('.submenu-comentarios').css('display','none');
    });
    
    $('#cerrar-sesion').click(function(){
        alert('sesion cerrada correctamante');
    });
});
