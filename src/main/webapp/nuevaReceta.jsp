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

</head>

<body>
<%@ include file="/includes/headerSesionIniciada.jsp" %>

<div class="contenido container-sm">
  <form action="publicacion" method="post" enctype="multipart/form-data">
  <div class="card">
    <div class="card-body">
        
      <input type="text" class=" form-control" id="nombre" name ="nombre" placeholder="Nombre de la receta" aria-label="nombre" aria-describedby="nombre">

      <div class="input-group">
        <div class="col-2">
          <div class="image-upload">
           <!-- <button class="btn btn-md btn-light"t  >
              <img class="img" id="imagenReceta" src="images/placeholder.jpg" />
            </button>-->
               <label for="file-input">
                <img class="img" id="imagenReceta" src="images/placeholder.jpg"/>
                </label>
                <input id="file-input" type="file" name="imagen" hidden="true"/>
           
          </div>
        </div>
        <div class="col-5">
          <div class="container-inputs">
              <label for="basic-url" class="form-label">Añade ingrediente y su cantidad</label>
              <div class="row ingredientes-inline">
                  <div class ="col-1">
                      <button id="botonIngrediente" type="button" class="btn btn-secondary btn-circle">+</button>
                  </div>
                  <div class="col-7">
                    <input type="text" class="form-control" id="nombreIngredienteForm" name="ingrediente">
                  </div>
                  <div class="col-4">
                      <input type="text" class="form-control" id="cantidadForm" name="cantidad">
                  </div>
              </div>
              <ul class="lista-ingredientes" id="listaIngredientes"></ul>
              <label for="duracionForm" class="form-label">Duracion estimada</label>
                <div class="row tiempo-inline">
                    <div clas="col-3">
                        <input type="number" class="form-control" id="duracionForm" name="duracion">
                    </div>
                    <div class="col-8">
                    <select class="form-select" aria-label="Default select example" id="selectTiempo" name="tiempo">
                        <option selected hidden>Selecciona la medida de tiempo</option>
                        <option value="segundos">Segundos</option>
                        <option value="minutos">Minutos</option>
                        <option value="horas">Horas</option>
                    </select>
                    </div>
                </div>
                <label for="personasForm" class="form-label">Número de personas</label>
                <input type="number" class="form-control" id="personasForm" name="numPersonas">
          </div>

        </div>
        <div class="col-3">
          <select class="form-select" aria-label="Default select example" id="selectDificultad" name="dificultad">
            <option selected hidden>Selecciona la dificultad</option>
            <option value="facil">Facil</option>
            <option value="media">Media</option>
            <option value="dificil">Dificil</option>
          </select>
            
        </div>
      </div>
      <div class="form-inline" id="pasos">
        <button id="botonPaso" type="button"  class="btn btn-secondary btn-circle">+</button>
        <label for="exampleFormControlInput1" class="form-label">Añade un paso</label>
        <textarea id="textoPaso" class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
        <ol id="listaPasos"></ol>
      </div>
    </div>
  </div>
    
    
  <button class="btn btn-secondary"  type="submit" >Guardar y publicar</button>
  </form>


</div>
<!-- ***************************************************************************************************************** -->
<!-- Pie de página                                                                                                     -->
<!-- ***************************************************************************************************************** -->

     <%@ include file="/includes/footer.html" %>

<!-- Importar javascript -->
<script src="js/jquery-3.6.4.js" type="text/javascript"></script>
<script src="js/header.js" type="text/javascript"></script>     
<script src="js/imageUpload.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>    
</body>
</html>