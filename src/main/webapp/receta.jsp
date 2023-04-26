<%-- 
    Document   : receta
    Created on : 17 abr 2023, 2:03:22
    Author     : marta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Usuario"%>
<!DOCTYPE html>
<html>
<head>
    <title>RecipeLab</title>
    <link rel="icon" type="image/png" href="images/logoPestanna.png" />

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <LINK rel="stylesheet" type="text/css" href="css/app.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>
<%Usuario usuario = (Usuario) session.getAttribute("usuario");
 if(usuario!=null){%>
    <%@ include file="/includes/headerSesionIniciada.jsp" %>
 <%}else{%>
    <%@ include file="/includes/header.html" %>
 <%}%>

<div class="contenido container-sm">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col">
                    <label id="titulo">Titulo</label>
                </div>
                <div class="col">
                    <a href="perfil.jsp">
                        <img class="img fotoPerfil" src="images/perfil.jpg" />
                    </a>
                    <a href="perfil.jsp">
                        <label id="perfilPublicador">Nombre_usuario</label>
                    </a>
                </div>
            </div>
            <div class="row">
                <div class="col-2">
                    <img class="img-fluid" id="imagenReceta" src="images/ejemplo-receta-1.jpg" />
                </div>
                <div class="col-4">
                    <div class="card">
                        <div class="card-header">
                            Ingredientes
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Ingrediente 1</li>
                            <li class="list-group-item">Ingrediente 2</li>
                            <li class="list-group-item">Ingrediente 3</li>
                        </ul>
                    </div>
                </div>
                <div class="col-2">
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star checked"></span>
                    <span class="fa fa-star"></span>
                    <span class="fa fa-star"></span>
                    <div class="row">
                        <div class="col-1">
                            <img class="img" id="imagenTiempo" src="images/tiempo.png" />
                        </div>
                        <div class="col">
                            <label>1 h</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-1">
                            <img class="img" id="imagenPersona" src="images/personas.png" />
                        </div>
                        <div class="col">
                            <label>4 personas</label>
                        </div>
                    </div>
                    <div class="row">
                        <label>€€</label>
                    </div>
                    <label>Dificultad : Fácil</label>
                    <label id="disponibles">Los ingredientes estan disponibles</label>
                </div>
            </div>
            <div class="row">
                <label class="paso">Paso 1</label>
                <label>Descripcion del paso</label>
            </div>
        </div>
    </div>
    
    <% if(usuario!=null){%>
    <div class="row">
        <div class="col">
            <label id="comentarios">Comentarios</label>
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-1">
                            <a href="perfil.jsp">
                                <img class="img fotoPerfil" src="images/perfil.jpg" />
                            </a>
                        </div>
                        <div class="col">
                            <textarea class="form-control" id="exampleFormControlTextarea1" placeholder="Comentario..." rows="3"></textarea>
                        </div>
                    </div>
                    <button type="button" class="btn btn-light">Comentar</button>
                </div>
            </div>
        </div>
        <div class="col">
            <label id="valorar">Valorar</label>
            <div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups">
                <div class="btn-group me-2" role="group" aria-label="First group">
                    <button type="button" class="fa fa-star btn "></button>
                    <button type="button" class="fa fa-star btn "></button>
                    <button type="button" class="fa fa-star btn "></button>
                    <button type="button" class="fa fa-star btn "></button>
                    <button type="button" class="fa fa-star btn "></button>
                </div>
            </div>
        </div>
    </div>
    <%}%>
    

</div>
<!-- ***************************************************************************************************************** -->
<!-- Pie de página                                                                                                     -->
<!-- ***************************************************************************************************************** -->

     <%@ include file="/includes/footer.html" %>
<script src="js/app.js" type="text/javascript"></script>22
</body>
</html>
