<%-- 
    Document   : nuevaReceta
    Created on : 17 abr 2023, 2:15:28
    Author     : marta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
  <title>RecipeLab</title>
  <link rel="icon" type="image/png" href="images/logoPestanna.png" />

  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">


  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
  <LINK rel="stylesheet" type="text/css" href="css/app.css" />
  <LINK rel="stylesheet" type="text/css" href="css/nuevaReceta.css" />

</head>

<body>
<%@ include file="/includes/headerSesionIniciada.jsp" %>

<div class="contenido container-sm">
  <div class="card">
    <div class="card-body">
      <input type="text" class=" form-control" id="nombre" placeholder="Nombre de la receta" aria-label="nombre" aria-describedby="nombre">

      <div class="input-group">
        <div class="col-2">
          <div class="button-container">
            <button class="btn btn-md btn-light"  >
              <img class="img" id="imagenReceta" src="images/placeholder.jpg" />
            </button>
          </div>
        </div>
        <div class="col-4">
          <div class="container-inputs">
            <label for="basic-url" class="form-label">Añade los ingredientes</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
            <label for="duracionForm" class="form-label">Duracion estimada</label>
            <input type="text" class="form-control" id="duracionForm" >
            <label for="personasForm" class="form-label">Número de personas</label>
            <input type="number" class="form-control" id="personasForm" >
          </div>

        </div>
        <div class="col-2">
          <select class="form-select" aria-label="Default select example" id="selectDificultad">
            <option selected hidden>Selecciona la dificultad</option>
            <option value="1">Facil</option>
            <option value="2">Media</option>
            <option value="3">Dificil</option>
          </select>
        </div>
      </div>
      <div class="form-inline">
        <button type="button" class="btn btn-secondary btn-circle">+</button>
        <label for="exampleFormControlInput1" class="form-label">Añade un paso</label>
        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
      </div>
    </div>

  </div>

  <button onclick="document.location='miPerfil.html'" class="btn btn-secondary"  type="submit" >Guardar y publicar</button>


</div>
<!-- ***************************************************************************************************************** -->
<!-- Pie de página                                                                                                     -->
<!-- ***************************************************************************************************************** -->

     <%@ include file="/includes/footer.html" %>
     
<script src="js/app.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>