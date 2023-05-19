<%-- 
    Document   : sesionIniciada
    Created on : 17 abr 2023, 2:04:19
    Author     : marta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Página de inicio</title>
    <link rel="icon" type="image/png" href="images/logoPestanna.png" />

    <!--Vicular boostrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <!--Vincular css -->
    <link rel="stylesheet" href="css/app.css">
</head>

<body>
<!-- ***************************************************************************************************************** -->
<!-- Cabecera                                                                                                          -->
<!-- ***************************************************************************************************************** -->
<%@ include file="/includes/headerSesionIniciada.jsp" %>

<!-- ***************************************************************************************************************** -->
<!-- Cuerpo de la pagina                                                                                               -->
<!-- ***************************************************************************************************************** -->
<div class="container-sm contenido">
   
    <%@ include file="/includes/buscador.jsp" %>

    <!-- ***************************************************************************************************************** -->
    <!-- Novedades usuarios                                                                                                -->
    <!-- ***************************************************************************************************************** -->
    <p class="display-6"> Novedades </p>

    <div class="div-usuario">
        <a href="perfil.jsp">
            <img src="images/perfil.jpg" alt="Descripción de la imagen">
        </a>
        <a href="perfil.jsp">
            <h4>Nombre del usuario</h4>
        </a>
    </div>

    <div class="banner">
        <a href="receta.jsp">
            <img src="./images/slider3.jpg" alt="Imagen de ejemplo" class="d-block w-100">
            <div class="div-sobre-imagen">
                <h5> Nombre receta </h5>
                <div class="info-receta">
                    <div class="item">
                        <img src="./images/estrella.png" alt="valoracion">
                        <img src="./images/estrella.png" alt="valoracion">
                        <img src="./images/estrella.png" alt="valoracion">
                    </div>
                    <div class="item">
                        <img src="images/personas.png" alt="numero personas">
                        <p> Número de comensales </p>
                    </div>
                    <div class="item">
                        <img src="./images/reloj.png" alt="duracion">
                        <p> Duración </p>
                    </div>
                    <div class="item">
                        <strong> €€ </strong>
                    </div>
                    <div class="item">
                        <p> Fácil </p>
                    </div>
                    <div class="item">
                        <p> Los ingredientes están disponibles</p>
                    </div>
                </div>
            </div>
        </a>
    </div>  
</div>



<!-- ***************************************************************************************************************** -->
<!-- Pie de página                                                                                                     -->
<!-- ***************************************************************************************************************** -->

     <%@ include file="/includes/footer.html" %>

<!-- Importar bootstrap -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="js/header.js" type="text/javascript"></script>
<script src="js/buscador.js" type="text/javascript"></script>
</body>
</body>
</html>