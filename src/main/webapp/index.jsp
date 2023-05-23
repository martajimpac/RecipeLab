<%-- 
    Document   : index
    Created on : 17 abr 2023, 2:01:41
    Author     : marta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Página de inicio</title>
    <link rel="icon" type="image/png" href="images/logoPestanna.png" />

    <!--Vicular boostrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <!--Vincular css -->
    <link rel="stylesheet" href="css/app.css">
    
    <!-- <script src="js/cargarServlet.js" type="text/javascript"></script> -->
</head>

<body>
<!-- ***************************************************************************************************************** -->
<!-- Cabecera                                                                                                          -->
<!-- ***************************************************************************************************************** -->

<%@ include file="/includes/header.html" %>
<!-- ***************************************************************************************************************** -->
<!-- Cuerpo de la pagina                                                                                               -->
<!-- ***************************************************************************************************************** -->
<div class="container-sm contenido">

    <%@ include file="/includes/buscador.jsp" %>
    
</div>


<!-- ***************************************************************************************************************** -->
<!-- Pie de página                                                                                                     -->
<!-- ***************************************************************************************************************** -->

     <%@ include file="/includes/footer.html" %>
     
<!-- Importar javascript -->
<script src="js/jquery-3.6.4.js" type="text/javascript"></script>
<script src="js/buscador.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>
