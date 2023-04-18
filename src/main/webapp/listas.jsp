<%-- 
    Document   : listas
    Created on : 17 abr 2023, 2:02:25
    Author     : marta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ver mis listas</title>
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
  <p class="display-6">Mis listas</p>
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
      <div class="row">
        <div class="col">
          <div class="card" style="width: 18rem;">
            <a href="detallesLista.html">
              <img src="./images/corazon2.png" class="card-img-top" alt="lista favoritos">
            </a>
            <div class="card-body">
              <h5 class="card-title">Titulo lista</h5>
              <p class="card-text">Aqui va la descripcion de la lista</p>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card" style="width: 18rem;">
            <a href="detallesLista.html">
              <img src="./images/lista1.jpg" class="card-img-top" alt="lista 1">
            </a>
            <div class="card-body">
              <h5 class="card-title">Titulo lista</h5>
              <p class="card-text">Aqui va la descripcion de la lista</p>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card" style="width: 18rem;">
            <a href="detallesLista.html">
              <img src="./images/lista2.jpg" class="card-img-top" alt="lista 2">
            </a>
            <div class="card-body">
              <h5 class="card-title">Titulo lista</h5>
              <p class="card-text">Aqui va la descripcion de la lista</p>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card" style="width: 18rem;">
            <a href="detallesLista.html">
              <img src="./images/lista3.jpg" class="card-img-top" alt="lista 2">
            </a>
            <div class="card-body">
              <h5 class="card-title">Titulo lista</h5>
              <p class="card-text">Aqui va la descripcion de la lista</p>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col">
          <div class="card" style="width: 18rem;">
            <a href="detallesLista.html">
              <img src="./images/lista3.jpg" class="card-img-top" alt="lista 3">
            </a>
            <div class="card-body">
              <h5 class="card-title">Titulo lista</h5>
              <p class="card-text">Aqui va la descripcion de la lista</p>
            </div>
          </div>
        </div>
        <div class="col">
        </div>
        <div class="col">
        </div>
      </div>
    </div>
  </form>
</div>

<!-- ***************************************************************************************************************** -->
<!-- Pie de página                                                                                                     -->
<!-- ***************************************************************************************************************** -->

     <%@ include file="/includes/footer.html" %>
     

<!-- Importar bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="js/app.js" type="text/javascript"></script>
</body>
</html>