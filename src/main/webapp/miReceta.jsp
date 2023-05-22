<%-- 
    Document   : miReceta
    Created on : 17 abr 2023, 2:02:49
    Author     : marta
--%>

<%@page import="Modelo.PasosReceta"%>
<%@page import="Modelo.Comentario"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.DetallesReceta"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.Receta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Mi receta</title>
  <link rel="icon" type="image/png" href="images/logoPestanna.png" />

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  <LINK rel="stylesheet" type="text/css" href="css/app.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body>
    <%@ include file="/includes/headerSesionIniciada.jsp" %>


<div class="contenido container-sm">
  <div class="card">
    <div class="card-body">
        <%     Receta receta = (Receta)request.getAttribute("receta"); 
               Usuario usuarioReceta = (Usuario)request.getAttribute("usuarioReceta");
               List<DetallesReceta> ingredientes = (List<DetallesReceta>)request.getAttribute("ingredientes");
               List<Comentario> comentarios = (List<Comentario>)request.getAttribute("comentarios");
               List<PasosReceta> pasos = (List<PasosReceta>)request.getAttribute("pasos");
               List<Usuario> usuariosComentarios = (List<Usuario>)request.getAttribute("usuariosComentarios");
               
            if (receta != null){ %>
      <div class="row">
        <label class="receta-id" hidden><%=receta.getId()%></label>
        <label id="titulo"><%= receta.getNombre() %></label>
      </div>
      <div class="row">
        <div class="col-2">
          <img class="img-fluid" id="imagenRecetaPerfil" src="<%=receta.getUrlImagen()%>" />
        </div>
        <div class="col-4">
          <div class="card">
            <div class="card-header">
                            Ingredientes
                        </div>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Ingrediente</th>
                                    <th>Cantidad</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for(int i = 0; i<ingredientes.size(); i++){    
                                    DetallesReceta ingrediente = ingredientes.get(i); %>
                                    <tr>
                                        <td><%= ingrediente.getNombreIngrediente() %></td>
                                        <td><%= ingrediente.getCantidad() %>
                                        <%if (ingrediente.isOpcionalidad()){%>
                                             (opcional)
                                            <%}%></td>
                                    </tr>
                                <% } %>
                            </tbody>
                        </table>
          </div>
        </div>
        <div class="col-2">
            <% int valoracion = (int)Math.round(receta.getValoracionMedia());
                    for(int estrellas=0; estrellas<5; estrellas++){ %>
                        <% if (estrellas < valoracion){%>
                            <span class="fa fa-star checked"></span>
                        <% } else {%>
                            <span class="fa fa-star"></span>
                        <% } 
                      }  %>
          <div class="row">
            <div class="col-1">
              <img class="img" id="imagenTiempo" src="images/tiempo.png" />
            </div>
            <div class="col">
                        <% int segundos = receta.getDuracionEnSec();
                           int hor=segundos/3600;
                           int min=(segundos-(3600*hor))/60;
                           String tiempo = hor+"h "+min+"m ";
                        %>
                            <label> <%=tiempo %></label>
            </div>
          </div>
          <div class="row">
            <div class="col-1">
              <img class="img" id="imagenPersona" src="images/personas.png" />
            </div>
            <div class="col">
              <label><%= receta.getNumPersonas() %> personas</label>
            </div>
          </div>
          <div class="row">
            <label><%= receta.getPrecio() %>€</label>
          </div>
          <label>Dificultad : <%= receta.getDificultad() %></label>
          <label id="disponibles">Los ingredientes estan disponibles</label>
        </div>
      </div>
      <% for(PasosReceta i: pasos){%>
      <div class="row">
        <label class="paso">Paso <%=i.getNumeroPaso()%></label>
        <label><%=i.getDescripcion()%></label>
      </div>
          <% } %>
          <% } %> 
    </div>
  </div>
  <div class="row">
    <div class="col">
      <button type="button" class="btn btn-warning">Editar receta</button>
    </div>
  </div>
  
  <div class="row">
    <div class="col">
      <%if(comentarios != null){%>
      <label id="comentarios">Comentarios</label>
      <% for(int i = 0; i < comentarios.size(); i++){ %>
      <div class="card">
        <div class="card-body cuerpo-comentario">
          <label class="comentario-email" hidden><%=comentarios.get(i).getEmailUsuario()%></label>
          <label class="comentario-fecha" hidden><%=comentarios.get(i).getFechaComentario()%></label>
          <div class="row">
            <div class="col-1">
              <img class="img fotoPerfil" src="<%=usuariosComentarios.get(i).getAvatarUrl()%>" />
            </div>
            <div class="col comentario">
              <label><%=comentarios.get(i).getTexto()%></label>
            </div>
          </div>
          <button type="button" class="btn btn-light boton-responder" >Responder</button>
        </div>
      </div>
      <%}%>
      <%}%>
    </div>
  </div>
</div>

<!-- ***************************************************************************************************************** -->
<!-- Pie de página                                                                                                     -->
<!-- ***************************************************************************************************************** -->


<%@ include file="/includes/footer.html" %>


<script src="js/comentariosReceta.js" type="text/javascript"></script>
</body>
</html>
