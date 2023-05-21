<%-- 
    Document   : login
    Created on : 17 abr 2023, 2:02:32
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
    <title>Iniciar Sesion</title>
    <link rel="icon" type="image/png" href="images/logoPestanna.png" />

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <LINK rel="stylesheet" type="text/css" href="css/app.css" />
</head>
<body>


    <%@ include file="/includes/header.html" %>


<div class="container-sm contenido">

    <br><br><br>
    
    <%
    String error = request.getHeader("error");
    %>

    <div class="inicioSesion">
        <form method="POST" action="Login">
            <input type="text" id="email" name="email" placeholder="email" required>
            <input type="password" id="contrasena" name="contrasena" placeholder="Constraseña" required>
            <p><a href="olvidoContrasena.jsp">¿Has olvidado la contraseña?</a></p>
            <input type="submit" value="Iniciar Sesión">

            <p class="noRegistrado">¿Aún no tienes cuenta?</p>
            <p> <%=error %> </p>

        </form>
        <button onclick="document.location='registro.jsp'">Regístrate</button>
    </div>
    <br><br><br>
</div>
<!-- ***************************************************************************************************************** -->
<!-- Pie de página                                                                                                     -->
<!-- ***************************************************************************************************************** -->

     <%@ include file="/includes/footer.html" %>
     
<!-- Importar javascript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>