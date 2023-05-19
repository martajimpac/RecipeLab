/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


$(document).ready(function(){
    
    $('#login-image').click(function(){
        console.log($('.submenu').css('display'));
        if($('.submenu').css('display') === 'none') $('.submenu').css('display','block');
        else $('.submenu').css('display','none');
    });
    
    $('#cerrar-sesion').click(function(){
        
        alert('sesion cerrada correctamante');
    });
});