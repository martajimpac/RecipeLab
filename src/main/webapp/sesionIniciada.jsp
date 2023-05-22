<%-- 
    Document   : sesionIniciada
    Created on : 17 abr 2023, 2:04:19
    Author     : marta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Receta"%>
<%@page import="Datos.UsuarioDB"%>

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
    <% 
    List<Receta> novedades = (List<Receta>)request.getAttribute("novedades");
    if(novedades!=null){
        for(int i=0; i<novedades.size();i++){
            Receta r = novedades.get(i); 
            int id = r.getId();
            Usuario usuarioReceta = UsuarioDB.obtieneUsuario(r.getEmailUsuario());
    %>

    <div class="div-usuario">
        <a href="VerUsuarioServlet?email=<%= usuarioReceta.getEmail() %>">
            <img src="<%=usuarioReceta.getAvatarUrl()%>" alt="Descripción de la imagen">
        </a>
        <a href="VerUsuarioServlet?email=<%= usuarioReceta.getEmail() %>">
            <h4><%=usuarioReceta.getNombreUsuario()%></h4>
        </a>
    </div>

    <div class="banner">
        <a href="VerRecetaServlet?id=<%= id %>">
            <img src="<%=r.getUrlImagen()%>" class="d-block w-100">
            <div class="div-sobre-imagen">
                <h5> <%=r.getNombre() %> </h5>
                <div class="info-receta">
                    <div class="item">
                        <% for(int estrellas=0; estrellas<r.getValoracionMedia(); estrellas++){ %>
                            <img src="./images/estrella.png" alt="valoracion"> 
                        <%} %>
                    </div>
                    <div class="item">
                        <img src="images/personas.png" alt="numero personas">
                        <p> <%=r.getNumPersonas() %> </p>
                    </div>
                    <div class="item">
                        <img src="./images/reloj.png" alt="duracion">
                        <%  int segundos = r.getDuracionEnSec();
                            int hor=segundos/3600;
                            int min=(segundos-(3600*hor))/60;
                            String tiempo = hor+"h "+min+"m ";
                        %>
                        <p> <%=tiempo %> </p>
                    </div>
                    <div class="item">
                        <strong> <%=r.getPrecio() %>€ </strong>
                    </div>
                    <div class="item">
                        <p> <%=r.getDificultad() %> </p>
                    </div>
                    <div class="item">
                        <p> Los ingredientes están disponibles</p>
                    </div>
                </div>
            </div>
        </a>
    </div> 
        <%} //del for
}//del if%>
</div>



<!-- ***************************************************************************************************************** -->
<!-- Pie de página                                                                                                     -->
<!-- ***************************************************************************************************************** -->

     <%@ include file="/includes/footer.html" %>

<!-- Importar javascript -->
<script src="js/jquery-3.6.4.js" type="text/javascript"></script>
<script src="js/header.js" type="text/javascript"></script>
<script src="js/buscador.js" type="text/javascript"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</body>
</html>
