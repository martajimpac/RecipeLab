<%-- 
    Document   : resultadosRecetas
    Created on : 17 abr 2023, 2:04:07
    Author     : marta
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.Math"%>
<%@page import="Modelo.Receta"%>
<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Resultados</title>
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

<!-- ***************************************************************************************************************** -->
<%Usuario usuario = (Usuario) session.getAttribute("usuario");
 if(usuario!=null){%>
    <%@ include file="/includes/headerSesionIniciada.jsp" %>
 <%}else{%>
    <%@ include file="/includes/header.html" %>
 <%}%>

<!-- ***************************************************************************************************************** -->
<!-- Cuerpo de la pagina                                                                                               -->
<!-- ***************************************************************************************************************** -->

<div class="container-sm contenido">

  <div class="d-flex align-items-center">
     <%if(usuario==null){%>
    <a href="index.jsp">
      <img src="images/backArrow.png" alt="atras" class="imagen-nav"/>
    </a>
    <%}else{%>
    <a href="sesionIniciada.jsp">
      <img src="images/backArrow.png" alt="atras" class="imagen-nav"/>
    </a>
    <%}%>
    <p class="display-6">Resultados</p>
  </div>

  <!-- ***************************************************************************************************************** -->
  <!-- Mis listas                                                                                                          -->
  <!-- ***************************************************************************************************************** -->

    <div class="container text-center">
        
 <% ArrayList<Receta> lista = (ArrayList<Receta>)request.getAttribute("ListaRecetas");
if(lista!=null){
    int numeroElemento = 0;
    //calcular cuantas filas de usuarios van a hacer falta
    int numeroFilas = (int)Math.ceil((double)lista.size()/4);

    for(int i=0; i<=numeroFilas;i++) {%>
    <div class="row">
     <% for(int j=0; j<4; j++){
            try{
            Receta receta = lista.get(numeroElemento); 
            numeroElemento ++;
            int id = receta.getId();
     %>
          
        <div class="col">
          <div class="card" style="width: 18rem;">
               <% if(usuario!=null){%>
              <div class="corazon-sobre-div">
                 <img src="./images/corazon.png" alt="corazon">
              </div>
               <%}%>

            <a href="VerRecetaServlet?id=<%= id %>">
              <img src="./images/ejemplo-receta-1.jpg" class="card-img-top" alt="receta">
              <!-- <img src="Imagen?email= USUARIO.GETEMAIL " class="card-img-top" alt="receta"> -->
            </a>
            <div class="card-body">
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
        </div>
        
        
       <%  
        } catch(Exception e){%>
        <div class="col"> </div>
        <%}
        } //del segundo for%>
    </div> <!-- cerrar fila -->
    <%} //del primer for
}//del if%>

     </div>
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
