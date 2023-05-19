<%-- 
    Document   : detallesLista
    Created on : 17 abr 2023, 2:02:03
    Author     : marta
--%>

<%@page import="Modelo.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Receta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Ver lista</title>
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

  <div class="d-flex align-items-center">
    <a href="listas.jsp">
      <img src="images/backArrow.png" alt="atras" class="imagen-nav"/>
    </a>
    <p class="display-6">Titulo lista</p>
  </div>
  <!-- ***************************************************************************************************************** -->
  <!-- Buscador                                                                                                          -->
  <!-- ***************************************************************************************************************** -->

  <form class="buscador" method="POST" action=""> <!--Llamar aqui al servlet -->
    <input type="text" name="busqueda" placeholder="Buscar...">
    <button id="buscar" class="btn btn-secondary"  type="submit" >Buscar</button>
    <button id="editar_lista" class="btn btn-secondary"  type="submit" >Editar lista</button>
  </form>

  <!-- ***************************************************************************************************************** -->
  <!-- Mis listas                                                                                                          -->
  <!-- ***************************************************************************************************************** -->

  <form class="buscador" method="POST" action=""> <!--Llamar aqui al servlet -->
    <div class="container text-center">
        <div class="resultados-busqueda">
          <%
              List<Receta> recetas = (List<Receta>) request.getAttribute("recetas");
              if(recetas != null && recetas.size() > 0){
                for(Receta i: recetas){
              
              %>
          <div class="card" >
              <div class="text-center ">
                  <% 
                        String salto = "VerRecetaServlet?id="+i.getId();
                      %>
                  <a href="<%=salto%>">
                    <img src="<%=i.getUrlImagen()%>" class="card-img-top" alt="receta" >
                  </a>
              </div>
            
            <div class="card-body">
              <h5 class="card-title"><%=i.getNombre()%></h5>
              <div class="info-receta-pequeño">
                <div class="item">
                    <% for(int j = 0; j < i.getValoracionMedia(); j++){ %>
                  <img src="./images/estrella.png" alt="valoracion">
                    <% }%>
                </div>
                <div class="item">
                  <img src="images/personas.png" alt="numero personas">
                  <p> <%=i.getNumPersonas()%> </p>
                </div>
                <div class="item">
                  <img src="./images/reloj.png" alt="duracion">
                  <% int segundos = i.getDuracionEnSec();
                           int hor=segundos/3600;
                           int min=(segundos-(3600*hor))/60;
                           String tiempo = hor+"h "+min+"m ";
                        %>
                  <p> <%=tiempo%> </p>
                </div>
                <div class="item">
                  <strong><%=i.getPrecio()%>€</strong>
                </div>
                <div class="item">
                  <p> <%=i.getDificultad()%> </p>
                </div>
              </div>
            </div>
          </div>
        <%  }
           }
        %>
        
      </div>
    </div>
</div>

<!-- ***************************************************************************************************************** -->
<!-- Pie de página                                                                                                     -->
<!-- ***************************************************************************************************************** -->

     <%@ include file="/includes/footer.html" %>

<!-- Importar bootstrap -->
<script src="js/jquery-3.6.4.js" type="text/javascript"></script>
<script src="js/header.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>