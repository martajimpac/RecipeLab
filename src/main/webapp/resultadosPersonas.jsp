<%-- 
    Document   : resultadosPersonas
    Created on : 17 abr 2023, 2:03:58
    Author     : marta
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Ver lista</title>
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
    <a href="sesionIniciada.jsp">
      <img src="images/backArrow.png" alt="atras" class="imagen-nav"/>
    </a>
    <p class="display-6">Resultados</p>
  </div>

  <!-- ***************************************************************************************************************** -->
  <!-- Mis listas                                                                                                          -->
  <!-- ***************************************************************************************************************** -->
          
   <form class="buscador" method="POST" action=""> <!--Llamar aqui al servlet -->
    <div class="container text-center">
      <div class="row">
          
 <% ArrayList<Usuario> lista = (ArrayList<Usuario>)request.getAttribute("ListaUsuarios");
if(lista!=null){%>
<p>la lista no es nula</p>
<p><%= lista %></p>
 <% for(int i=0; i<lista.size(); i++){
      Usuario user = lista.get(i); %>
          
        <div class="col">
          <div class="card" style="width: 18rem;">
            <a href="perfil.html">
              <img src="./images/fotoPerfil.jpg" class="card-img-top" alt="foto de perfil">
            </a>
            <div class="card-body">
              <h5 class="card-title"><%= user.getNombreUsuario() %> </h5>
            </div>
          </div>
        </div>
 
   <% }
 }%>
        
      </div>
    </div>
  </form>
    
</div>

<!-- ***************************************************************************************************************** -->
<!-- Pie de página                                                                                                     -->
<!-- ***************************************************************************************************************** -->

     <%@ include file="/includes/footer.html" %>

<!-- Importar bootstrap y javascript-->
<script src="js/app.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>