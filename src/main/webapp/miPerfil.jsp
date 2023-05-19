<%-- 
    Document   : miPerfil
    Created on : 17 abr 2023, 2:02:41
    Author     : marta
--%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.Receta"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi perfil</title>
    <link rel="icon" type="image/png" href="images/logoPestanna.png" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    <LINK rel="stylesheet" type="text/css" href="css/app.css" />
    <!--libreria estrellas-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
    
<%@ include file="/includes/headerSesionIniciada.jsp" %>

<div class="container-sm contenido">
<% 
Usuario usuario = (Usuario)request.getAttribute("usuario");
   int seguidores = (int)request.getAttribute("seguidores");
   int seguidos = (int)request.getAttribute("seguidos");
   List<Receta> lista = (List<Receta>)request.getAttribute("lista");
if(usuario!=null){ %>

    <div class="d-flex">
        <div>
            <img class="avatar" src="images/usuario.png"/>
        </div>

        <div class="info-perfil">
            <div class="row">
                <div class="col">
                    <h4 class="strong"><%=usuario.getNombreUsuario() %></h4>
                    <% int valoracion = (int)Math.round(usuario.getValoracion());
                    for(int estrellas=0; estrellas<5; estrellas++){ %>
                        <% if (estrellas < valoracion){%>
                            <span class="fa fa-star checked"></span>
                        <% } else {%>
                            <span class="fa fa-star"></span>
                        <% } 
                      }  %>
                </div>
                <div class="col">
                    <button onclick="document.location='editarPerfil.jsp'" id="editarPerfil" class="btn btn-secondary"  type="submit" >Editar perfil</button>
                </div>
            </div>
            <div class="row">
                <h6><%=usuario.getEmail() %></h6>
            </div>
            <div class="row filaseguidores">
                <div class="col">
                    <p>Nº de publicaciones: <%=lista.size() %></p>
                </div>
                <div class="col">
                    <p>Nº de seguidores: <%=seguidores %></p>
                </div>
                <div class="col">
                    <p>Nº de seguidos: <%=seguidos %></p>
                </div>
            </div>
        </div>
    </div>

    <div class="recetas-perfil">
        
        <% for(int i=0; i<lista.size();i++){
            Receta receta = lista.get(i); %>
        <div class="recetas-perfil__receta">
            <a href="receta.jsp">
                <img class="receta__imagen" src="images/ejemplo-receta-1.jpg" alt="imagen-receta-1"/>
            </a>
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
    <% } %> <!--del if user != null-->
</div>
<!-- ***************************************************************************************************************** -->
<!-- Pie de página                                                                                                     -->
<!-- ***************************************************************************************************************** -->

     <%@ include file="/includes/footer.html" %>
     
<script src="js/app.js" type="text/javascript"></script>
</body>
</html>
