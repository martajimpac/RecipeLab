<%-- 
    Document   : editarPerfil
    Created on : 17 abr 2023, 2:02:16
    Author     : marta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.Receta"%>
<%@page import="java.util.List"%>
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
    <title>Editar perfil</title>
</head>
<body>

<%@ include file="/includes/headerSesionIniciada.jsp" %>

<div class="container-sm contenido">
    
    <% Usuario usuario = (Usuario)request.getAttribute("usuario");
   int seguidores = (int)request.getAttribute("seguidores");
   int seguidos = (int)request.getAttribute("seguidos");
   List<Receta> lista = (List<Receta>)request.getAttribute("lista");
    if(usuario!=null){ %>

    <div class="d-flex">
        <form action="GuardarCambiosPerfilServlet" method="post" enctype="multipart/form-data">
          <div class="image-upload">
                <label for="file-input">
                <img class="img" id="imagenReceta" src="images/placeholder.jpg"/>
                </label>
                <input id="file-input" type="file" name="imagen" hidden="true"/>
           
          </div>

        <div class="info-perfil">
            <div class="row">
                <div class="col">
                    <input type="text" class=" form-control" id="nombre" name="nombre" placeholder="Nombre del usuario" aria-label="nombre" aria-describedby="nombre">
                </div>
                <div class="col">
                    <button id="guardarCambios" class="btn btn-secondary"  type="submit" >Guardar cambios</button>         
                </div>
            </div>
            <div class="row">
            </div>
        </div>
        </form>
    </div>
    
        <div class="recetas-perfil">
        
        <% for(int i=0; i<lista.size();i++){
            Receta receta = lista.get(i);
            int id = receta.getId();%>
        <div class="recetas-perfil__receta">
            <img class="receta__imagen" src="<%=receta.getUrlImagen()%>" alt="imagen-receta"/>
            <div class="receta__informacion">
                <h5 class="card-title"><%=receta.getNombre() %></h5>
                <div class="info-receta-pequeño">
                    <div class="item">
                        <% for(int estrellas=0; estrellas<receta.getValoracionMedia(); estrellas++){ %>
                            <img src="./images/estrella.png" alt="valoracion"> 
                        <%} %>
                    </div>
                    <div class="item">
                      <img src="images/personas.png" alt="numero personas">
                      <p> <%=receta.getNumPersonas() %> </p>
                    </div>
                    <div class="item">
                      <img src="./images/reloj.png" alt="duracion">
                      <% int segundos = receta.getDuracionEnSec();
                         int hor=segundos/3600;
                         int min=(segundos-(3600*hor))/60;
                         String tiempo = hor+"h "+min+"m ";
                      %>
                      <p> <%=tiempo %> </p>
                    </div>
                    <div class="item">
                      <strong> <%=receta.getPrecio() %>€ </strong>
                    </div>
                    <div class="item">
                      <p> <%=receta.getDificultad() %> </p>
                    </div>
                </div>   
            </div>
        </div>
        <% } %> <!-- del for -->
    </div>
    <% } %> <!-- del if -->
</div>
<!-- ***************************************************************************************************************** -->
<!-- Pie de página                                                                                                     -->
<!-- ***************************************************************************************************************** -->

     <%@ include file="/includes/footer.html" %>
     
<!-- Importar javascript -->     
<script src="js/jquery-3.6.4.js" type="text/javascript"></script>  
<script src="js/imageUpload.js" type="text/javascript"></script>
</body>
</html>
