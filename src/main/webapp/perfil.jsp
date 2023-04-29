<%-- 
    Document   : perfil
    Created on : 17 abr 2023, 2:03:12
    Author     : marta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Usuario"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" type="image/png" href="images/logoPestanna.png" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <LINK rel="stylesheet" type="text/css" href="css/app.css" />
    <!--libreria estrellas-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Perfil del usuario</title>
</head>
<body>

<%Usuario usuario = (Usuario) session.getAttribute("usuario");
 if(usuario!=null){%>
    <%@ include file="/includes/headerSesionIniciada.jsp" %>
 <%}else{%>
    <%@ include file="/includes/header.html" %>
 <%}%>

<div class="container-sm contenido">

    <div class="d-flex">
        <div>
            <img class="avatar" src="images/usuario.png"/>
        </div>

        <div class="info-perfil">
            <div class="row">
                <div class="col">
                    <h4 class="strong">Nickname del usuario</h4>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                </div>
                <%if(usuario!=null){%>
                    <div class="col">
                        <button id="Seguir" class="btn btn-secondary"  type="submit" >Seguir</button>
                    </div>
                <%}%>
            </div>
            <div class="row">
                <h6>Nombre completo asociado al perfil</h6>
                <p>Descripción breve del perfil</p>
            </div>
            <div class="row filaseguidores">
                <div class="col">
                    <p>Numero de publicaciones</p>
                </div>
                <div class="col">
                    <p>Numero de seguidores</p>
                </div>
                <div class="col">
                    <p>Numero de seguidos</p>
                </div>
            </div>
        </div>
    </div>
    
            <%@ include file="/includes/publicacionesPerfil.jsp" %>
</div>
<!-- ***************************************************************************************************************** -->
<!-- Pie de página                                                                                                     -->
<!-- ***************************************************************************************************************** -->

     <%@ include file="/includes/footer.html" %>
<script src="js/app.js" type="text/javascript"></script>
</body>
</html>