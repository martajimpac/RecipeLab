<%-- 
    Document   : detallesLista
    Created on : 17 abr 2023, 2:02:03
    Author     : marta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="Modelo.Receta" %>
<%@page import="Datos.ListaDB" %>

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
  <link rel="stylesheet" href="css/ventanaEmergente.css">
</head>
<body>
<!-- ***************************************************************************************************************** -->
<!-- Cabecera                                                                                                          -->
<!-- ***************************************************************************************************************** -->

<%@ include file="/includes/headerSesionIniciada.jsp" %>
                
<!-- ***************************************************************************************************************** -->
<!-- Cuerpo de la pagina                                                                                               -->
<!-- ***************************************************************************************************************** -->

<%
    //Se obtiene el nombre y la descripcion de la lista pasado como parametro
    String nombreLista = request.getParameter("nombreLista");
    String descripcionLista = request.getParameter("descripcionLista");
    
    List<Receta> recetasLista=null;
    boolean notFound = false;
    
    try{
        //Se intentan obtener recetas resultado de una busqueda
        recetasLista = (List<Receta>) request.getAttribute("Recetas");
    }catch(Exception e){};
    
    //De no haberse realizado busqueda se muestran todas las recetas
    if(recetasLista==null) recetasLista = ListaDB.getRecetas(nombreLista);
    //De haberse realizado buqueda pero no haber habido resultados se muestran todas las recetas,
    //y se muestra un mensaje de fallo en la busqueda
    else if (recetasLista.isEmpty()){
        notFound=true; // Flag para mostrar el mensaje de fallo
        recetasLista = ListaDB.getRecetas(nombreLista);
    }
%>

<div class="container-sm contenido">

  <div class="d-flex align-items-center">
    <a href="listas.jsp">
      <img src="images/backArrow.png" alt="atras" class="imagen-nav"/>
    </a>
    <p id="nombre" class="display-6"><%=nombreLista%></p>
    <button id="enlaceLista" class="bg-transparent rounded border-0 text-uppercase"><img src="images/editarPerfil.png" alt="lista favoritos" width="20"></button>  
  </div>
    
  <!----------------- Ventana para editar la lista ------------------------>
    <div id="ventanaAnadir" class="modal">
        <form class="buscador" method="POST" action="EditarListaServlet?viejoNombre=<%=nombreLista%>">
            <div class="modal-content">
              <label>Nombre lista:</label>
              <input type="text" name="nombreLista" placeholder="<%=nombreLista%>">
              <label>Descripcion:</label>
              <input type="text" name="descripcionLista" placeholder="<%=descripcionLista%>">
              <button id="btnAceptar">Aceptar</button>
            </div>
        </form>
    </div>
    
  
  <!-- ***************************************************************************************************************** -->
  <!-- Buscador                                                                                                          -->
  <!-- ***************************************************************************************************************** -->

  <form class="buscador" method="POST" action="DetallesListaServlet?nombreLista=<%=nombreLista%>"> <!--Llamar aqui al servlet -->
    <input type="text" name="busqueda" placeholder="Buscar...">
    <button id="buscar" class="btn btn-secondary"  type="submit" >Buscar</button>
  </form>

  <!-- ***************************************************************************************************************** -->
  <!-- Mis listas                                                                                                          -->
  <!-- ***************************************************************************************************************** -->
  
    <div class="container text-center mt-4">
<%
    if(!recetasLista.isEmpty() && notFound){
%>
    <h3 class="mt-4 mb-4 text-danger">No se han encontrado recetas bajo esos criterios</h3>
<%
    }
    if(recetasLista.isEmpty()){
%>
      <h2 class="mt-4">No hay recetas aun en esta lista</h2>
      <img class="mt-3" src="images/noContent.png" alt="noContent.png"/>
<%
    }else{
        int i=0;
        for (Receta r : recetasLista){
            //Convertir duración en h, min y sec
            int horas=r.getDuracionEnSec()/3600;
            int min=(r.getDuracionEnSec()%3600)/60;
            int sec=(r.getDuracionEnSec()%3600)%60;

            int valoracionRedondeada = (int) Math.round(r.getValoracionMedia());

            String imagen="";
            try{
                imagen = r.getUrlImagen();
            }catch(Exception e){}

            if(i%3==0){
%>
    <div class="row d-flex justify-content-around">
<%
            }
%>
        <div class="col-3">
            <div class="card" style="width: 18rem;">
                <div class="corazon-sobre-div">
                    <a href="#" id="enlace<%=i%>"> <img src="./images/cruz.png" alt="cruz"/></a>
                    <div class="submenu bg-transparent border-0 shadow-none position-absolute top-0 start-0 h-100 w-100" id="submenu<%=i%>">
                        <ul class="list-unstyled">
                            <li>
                                <form class="buscador" method="POST" action="EliminarRecetaDeListaServlet?nombreLista=<%=nombreLista%>&idReceta=<%=r.getId()%>">
                                    <button class="bg-white border-0 rounded text-white h-100 w-100 d-flex justify-content-center align-items-center">
                                        <img src="images/check.png" alt="lista favoritos">
                                    </button>
                                </form>
                            </li>
                        </ul>
                    </div>
                </div>
                <form id="verReceta" action="VerRecetaServlet?id=<%=r.getId()%>" method="POST"></form>
                <a href="#" onclick="$(this).parent().find('#verReceta').submit();">
                    <img src="<%=imagen%>" class="card-img-top" alt="imagen_receta">
                </a>
                <div class="card-body">
                    <h5 class="card-title"><%=r.getNombre()%></h5>
                    <div class="info-receta-pequeño">
                        <div class="item">
<%
                            for(int j = 0;j<valoracionRedondeada;j++){
%>
                            <img src="./images/estrella.png" alt="valoracion">
<%
                            }
%>
                        </div>
                        <div class="item">
                            <img src="images/personas.png" alt="numero personas">
                            <p> <%=r.getNumPersonas()%> </p>
                        </div>
                        <div class="item">
                            <img src="./images/reloj.png" alt="duracion">
                            <p><%=horas%>h <%=min%>m <%=sec%>s </p>
                        </div>
                        <div class="item">
                            <strong> <%=r.getPrecio()%> </strong>
                        </div>
                        <div class="item">
                            <p> <%=r.getDificultad()%> </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%       
            i++;
            if(i%3==0){
%>
    </div>
<%          
            }//Cierre if
        }//Cierre for
        if(i%3!=0){
%>
    </div>
<%
        }//Cierre if
    }//Cierre else
%>
    </div>
</div>

<!-- ***************************************************************************************************************** -->
<!-- Pie de página                                                                                                     -->
<!-- ***************************************************************************************************************** -->

     <%@ include file="/includes/footer.html" %>

<!-- Importar bootstrap -->
<script src="js/app.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

<script src="js/mostrarVentana.js" type="text/javascript"></script>
<script src="js/submenuEliminar.js" type="text/javascript"></script>
</body>
</html>
