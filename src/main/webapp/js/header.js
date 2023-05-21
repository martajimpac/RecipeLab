/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

<<<<<<< HEAD
$(document).ready(function(){
=======

$(document).ready(function(){
    
   
>>>>>>> a6178d8b24c5f550abaad2e1885a0e67db03a392
    $('#login-image').click(function(){
        console.log($('.submenu').css('display'));
        if($('.submenu').css('display') === 'none') $('.submenu').css('display','block');
        else $('.submenu').css('display','none');
    });
    
    $('#cerrar-sesion').click(function(){
<<<<<<< HEAD
=======
        
>>>>>>> a6178d8b24c5f550abaad2e1885a0e67db03a392
        alert('sesion cerrada correctamante');
    });
});