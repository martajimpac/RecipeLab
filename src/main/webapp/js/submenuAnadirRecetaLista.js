/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

var i = 0;
var enlace;
var submenu;

while(document.getElementById('enlace'+i)){
    enlace = document.getElementById('enlace'+i);
    submenu = document.getElementById('submenu'+i);
    
    (function(enlace, submenu) {
        enlace.addEventListener('click', function() {
            enlace.style.display = "none";
            submenu.style.display = "block";
        });
        
        document.addEventListener('click', function(e) {
            if (!enlace.contains(e.target) && !submenu.contains(e.target)) {
                enlace.style.display = "block";
                submenu.style.display = "none";
            }
        });
    })(enlace, submenu);
    
    i++;
}