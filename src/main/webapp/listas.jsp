<%-- 
    Document   : listas
    Created on : 17 abr 2023, 2:02:25
    Author     : marta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="Modelo.ListaRecetas" %>
<%@page import="Datos.ListaDB" %>
<%@page import="Modelo.Usuario" %>
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
    <link rel="stylesheet" href="css/ventanaEmergente.css">
</head>
<body> 
<!-- ***************************************************************************************************************** -->
<!-- Cabecera                                                                                                          -->
<!-- ***************************************************************************************************************** -->

<%@ include file="/includes/headerSesionIniciada.jsp" %>

<!-- ***************************************************************************************************************** -->
<!-- Mostrar todas las listas                                                                                           -->
<!-- ***************************************************************************************************************** -->

<%
    //Obtencion session usuario identificado
    Usuario user = (Usuario) session.getAttribute("usuario");
    
    boolean notFound = false;
    List<ListaRecetas> listas = null;
   
    try{
        listas = (List<ListaRecetas>) request.getAttribute("Listas");
    }catch(Exception e){};
    
    if(listas==null) listas = ListaDB.getAll(user.getEmail());
    else if(listas.isEmpty()){
        notFound=true;
        listas = ListaDB.getAll(user.getEmail());
    }
%>

<!-- ***************************************************************************************************************** -->
<!-- Cuerpo de la pagina                                                                                               -->
<!-- ***************************************************************************************************************** -->
<div class="container-sm contenido">
  <p class="display-6">Mis listas</p>
  <!-- ***************************************************************************************************************** -->
  <!-- Buscador                                                                                                          -->
  <!-- ***************************************************************************************************************** -->

    <div class="d-flex justify-content-between">   
        <form class="buscador" method="POST" action="BuscarListasServlet">
          <input type="text" name="busqueda" placeholder="Buscar...">
          <button id="buscar" class="btn btn-secondary btn-sm"  type="submit">Buscar</button>
        </form>
        <button id="enlaceLista" class="rounded bg-warning text-secondary fw-bold">NUEVA LISTA</button>
    </div>
  
    <!----------------- Ventana para añadir listas ------------------------>
    <div id="ventanaAnadir" class="modal">
        <form class="buscador" method="POST" action="CrearListaServlet">
            <div class="modal-content">
              <label>Nombre lista: (Obligatorio) </label>
              <input type="text" name="nombreLista" placeholder="Nombre lista...">
              <label>Descripcion:</label>
              <input type="text" name="descripcionLista" placeholder="Descripcion...">
              <button id="btnAceptar">Aceptar</button>
            </div>
        </form>
    </div>


  <!-- ***************************************************************************************************************** -->
  <!-- Mis listas                                                                                                          -->
  <!-- ***************************************************************************************************************** -->

    <div class="container text-center mt-3">

        <%
            if(!listas.isEmpty() && notFound){
        %>
        <h3 class="mt-4 mb-4 text-danger">No se han encontrado listas bajo esos criterios</h3>
        <%  
            //Cierre if
            }

            if(listas.isEmpty()){
        %>
        <h2 class="mt-4">No tienes ninguna lista</h2>
        <img class="mt-3" src="images/noContent.png" alt="noContent.png"/>
        <%
            }else{
            int i=0;
            for (ListaRecetas l : listas){
            
                String imagen="";
                try{
                    imagen=l.getImagenLista();
                }catch(Exception e){}
                if(i%3==0){
        %>
        <div class="row d-flex justify-content-around">
        <%      } //Cierre if %>
          <div class="col-3">
            <div class="card" style="width: 18rem;">
              <div class="corazon-sobre-div">
                <a href="#" id="enlace<%=i%>"> <img src="./images/cruz.png" alt="cruz"/></a>
                <div class="submenu bg-transparent border-0 shadow-none position-absolute top-0 start-0 h-100 w-100" id="submenu<%=i%>">
                  <ul class="list-unstyled">
                    <li>
                      <form class="buscador" method="POST" action="EliminarListaServlet?nombreLista=<%=l.getNombre()%>">
                        <button class="bg-white border-0 rounded text-white h-100 w-100 d-flex justify-content-center align-items-center">
                          <img src="images/check.png" alt="lista favoritos">
                        </button>
                      </form>
                    </li>
                  </ul>
                </div>
              </div>
              <a href="detallesLista.jsp?nombreLista=<%= l.getNombre()%>&descripcionLista=<%=l.getDescripcion()%>">
                <%
                    //A las listas sin imagen se les asigna una imagen prdeterminada
                    if(!imagen.isEmpty()){
                %>
                <img src="<%=imagen%>" class="card-img-top" alt="imagen lista">
                <%
                    }else{
                %>
                <img src="images/DB/lista1.png" class="card-img-top" alt="lista estandar lista">
                <%
                    }
                %>
              </a>
              <div class="card-body">
                <h5 class="card-title"><%= l.getNombre()%></h5>
                <p class="card-text"><%=l.getDescripcion()%></p>
              </div>
            </div>
          </div>
        <%
                i++;
                if(i%3==0){
        %>    
        </div>
        <%
                //Cierre if
                }
            //Cierre for
            }
            if(i%3!=0){
        %>
        </div>
        <%
                //Cierre if
                }
            } //Cierre else
        %>  
   
    </form>
  </div>
</div>

<!-- ***************************************************************************************************************** -->
<!-- Pie de página                                                                                                     -->
<!-- ***************************************************************************************************************** -->

     <%@ include file="/includes/footer.html" %>
     

<!-- Importar bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

<script src="js/mostrarVentana.js" type="text/javascript"></script>
<script src="js/submenuEliminar.js" type="text/javascript"></script>
</body>
</html>
