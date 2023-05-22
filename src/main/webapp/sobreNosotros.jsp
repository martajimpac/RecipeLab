<%-- 
    Document   : sobreNosotros
    Created on : 17 abr 2023, 2:26:38
    Author     : marta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>Sobre Nosotros</title>
        <link rel="icon" type="image/png" href="images/logoPestanna.png" />
        
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <LINK rel="stylesheet" type="text/css" href="css/app.css" />
    </head>
    <body>

<%String email = (String) session.getAttribute("usuario");
 if(email!=null){%>
    <%@ include file="/includes/headerSesionIniciada.jsp" %>
 <%}else{%>
    <%@ include file="/includes/header.html" %>
 <%}%>

        <div class="container-sm contenido sobre-nosotros">
            <p>
                Bienvenido a nuestra web de cocina, un lugar donde podrás encontrar una gran variedad de recetas para convertirte en un maestro culinario.
            </p>
            <p>
                Nuestro equipo está formado por apasionados de la cocina que han decidido compartir sus conocimientos y experiencias con todo aquel que quiera aprender a cocinar platos deliciosos y nutritivos.
                Creemos que la cocina es una forma de arte que debe ser disfrutada tanto por los chefs experimentados como por los novatos, y estamos aquí para ayudarte a descubrir tu potencial culinario.
            </p>
            <p>
                En nuestra web encontrarás recetas de todo tipo, desde platos tradicionales de la cocina local hasta opciones veganas, sin gluten y vegetarianas.
                Nos gusta experimentar con ingredientes nuevos y sabores innovadores, por lo que también encontrarás recetas internacionales y fusiones culinarias que te sorprenderán.
                ¡Todo cuanto los usuarios quieran compartir!
            </p>
            <p>
                Pero no solo nos enfocamos en las recetas. Queremos que disfrutes de todo el proceso de cocinar, desde la selección de ingredientes hasta la presentación del plato final. 
                Por eso, también ofrecemos cómo hacer que tus platos luzcan como si vinieran de un restaurante de alta calidad.
            </p>
            <p>
                En resumen, nuestra web de cocina es un lugar donde podrás aprender y experimentar con nuevas recetas. 
                Nos esforzamos por hacer que la cocina sea accesible para todos, sin importar su nivel de experiencia, y estamos emocionados de formar parte de tu viaje culinario. ¡Gracias por visitarnos!
            </p>
        </div>

<!-- ***************************************************************************************************************** -->
<!-- Pie de página                                                                                                     -->
<!-- ***************************************************************************************************************** -->

     <%@ include file="/includes/footer.html" %>
     
   
    <!-- Importar javascript -->


    </body>
</html>

