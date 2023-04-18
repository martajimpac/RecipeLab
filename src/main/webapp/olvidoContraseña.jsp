<%-- 
    Document   : olvidoContraseña
    Created on : 17 abr 2023, 2:03:02
    Author     : marta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>Recordar contraseña</title>
        <link rel="icon" type="image/png" href="images/logoPestanna.png" />
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <LINK rel="stylesheet" type="text/css" href="css/app.css" />
    </head>
    <body>

    <%@ include file="/includes/header.html" %>
        
        
        <div class="container-sm contenido">
            
            
            
            <div class="inicioSesion">
                <form method="POST" action="login.jsp">
                    <input type="text" id="email" name="email" placeholder="Correo electrónico" required>
                    <input type="submit" value="Enviar">
                </form>
                
                <a href="login.jsp">Volver a login </a>
            </div>
        </div>
    
<!-- ***************************************************************************************************************** -->
<!-- Pie de página                                                                                                     -->
<!-- ***************************************************************************************************************** -->

     <%@ include file="/includes/footer.html" %>
     
     <script src="js/app.js" type="text/javascript"></script>
    </body>
</html>
