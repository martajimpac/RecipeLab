<%-- 
    Document   : editarPerfil
    Created on : 17 abr 2023, 2:02:16
    Author     : marta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <title>Perfil del usuario</title>
</head>
<body>

<%@ include file="/includes/headerSesionIniciada.jsp" %>

<div class="container-sm contenido">

    <div class="d-flex">
        <div>
            <button class="btn btn-md btn-light"  >
                <img class="avatar" src="./images/placeholder.jpg"/>
            </button>
        </div>

        <div class="info-perfil">
            <div class="row">
                <div class="col">
                    <input type="text" class=" form-control" id="nickname" placeholder="Nickname del usuario" aria-label="nombre" aria-describedby="nombre">
                </div>
                <div class="col">
                    <button onclick="document.location='miPerfil.jsp'" id="guardarCambios" class="btn btn-secondary"  type="submit" >Guardar cambios</button>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <input type="text" class=" form-control" id="nombre usuario" placeholder="Nombre completo asociado al perfil" aria-label="nombre" aria-describedby="nombre">
                    <label class="form-label">Introduce una descripción</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                </div>

            </div>
        </div>
    </div>

    <%@ include file="/includes/publicacionesPerfil.jsp" %>
</div>
<!-- ***************************************************************************************************************** -->
<!-- Pie de página                                                                                                     -->
<!-- ***************************************************************************************************************** -->

     <%@ include file="/includes/footer.html" %>
     
<script src="js/app.js" type="text/javascript"></script>
</body>
</html>