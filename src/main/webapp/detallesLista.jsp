<%-- 
    Document   : detallesLista
    Created on : 17 abr 2023, 2:02:03
    Author     : marta
--%>

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
      <div class="row">
        <div class="col">
          <div class="card" style="width: 18rem;">
            <a href="miReceta.jsp">
              <img src="./images/lista1.jpg" class="card-img-top" alt="receta">
            </a>
            <div class="card-body">
              <h5 class="card-title">Titulo receta</h5>
              <div class="info-receta-pequeño">
                <div class="item">
                  <img src="./images/estrella.png" alt="valoracion">
                  <img src="./images/estrella.png" alt="valoracion">
                  <img src="./images/estrella.png" alt="valoracion">
                </div>
                <div class="item">
                  <img src="images/personas.png" alt="numero personas">
                  <p> 4 </p>
                </div>
                <div class="item">
                  <img src="./images/reloj.png" alt="duracion">
                  <p> 1h. </p>
                </div>
                <div class="item">
                  <strong> €€ </strong>
                </div>
                <div class="item">
                  <p> Fácil </p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card" style="width: 18rem;">
            <a href="miReceta.jsp">
              <img src="./images/lista1.jpg" class="card-img-top" alt="receta">
            </a>
            <div class="card-body">
              <h5 class="card-title">Titulo receta</h5>
              <div class="info-receta-pequeño">
                <div class="item">
                  <img src="./images/estrella.png" alt="valoracion">
                  <img src="./images/estrella.png" alt="valoracion">
                  <img src="./images/estrella.png" alt="valoracion">
                </div>
                <div class="item">
                  <img src="images/personas.png" alt="numero personas">
                  <p> 4 </p>
                </div>
                <div class="item">
                  <img src="./images/reloj.png" alt="duracion">
                  <p> 1h. </p>
                </div>
                <div class="item">
                  <strong> €€ </strong>
                </div>
                <div class="item">
                  <p> Fácil </p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card" style="width: 18rem;">
            <a href="miReceta.jsp">
              <img src="./images/lista1.jpg" class="card-img-top" alt="receta">
            </a>
            <div class="card-body">
              <h5 class="card-title">Titulo receta</h5>
              <div class="info-receta-pequeño">
                <div class="item">
                  <img src="./images/estrella.png" alt="valoracion">
                  <img src="./images/estrella.png" alt="valoracion">
                  <img src="./images/estrella.png" alt="valoracion">
                </div>
                <div class="item">
                  <img src="images/personas.png" alt="numero personas">
                  <p> 4 </p>
                </div>
                <div class="item">
                  <img src="./images/reloj.png" alt="duracion">
                  <p> 1h. </p>
                </div>
                <div class="item">
                  <strong> €€ </strong>
                </div>
                <div class="item">
                  <p> Fácil </p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col">
          <div class="card" style="width: 18rem;">
            <a href="miReceta.jsp">
              <img src="./images/lista1.jpg" class="card-img-top" alt="receta">
            </a>
            <div class="card-body">
              <h5 class="card-title">Titulo receta</h5>
              <div class="info-receta-pequeño">
                <div class="item">
                  <img src="./images/estrella.png" alt="valoracion">
                  <img src="./images/estrella.png" alt="valoracion">
                  <img src="./images/estrella.png" alt="valoracion">
                </div>
                <div class="item">
                  <img src="images/personas.png" alt="numero personas">
                  <p> 4 </p>
                </div>
                <div class="item">
                  <img src="./images/reloj.png" alt="duracion">
                  <p> 1h. </p>
                </div>
                <div class="item">
                  <strong> €€ </strong>
                </div>
                <div class="item">
                  <p> Fácil </p>
                </div>
              </div>
            </div>
          </div>
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
<script src="js/app.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>