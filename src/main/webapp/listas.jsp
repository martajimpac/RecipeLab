<%-- 
    Document   : listas
    Created on : 17 abr 2023, 2:02:25
    Author     : marta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="Modelo.ListaRecetas" %>
<%@page import="Datos.ListaDB" %>
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
<!-- Mostrar todas las listas                                                                                           -->
<!-- ***************************************************************************************************************** -->

<%
    boolean busqueda = false;
    List<ListaRecetas> resultado = null;
    List<ListaRecetas> listas;
    try{
        busqueda = (boolean)request.getAttribute("Busqueda");
        resultado = (List<ListaRecetas>) request.getAttribute("Listas");
    }catch(Exception e){};
    
    if(resultado==null || resultado.isEmpty())
        /*
        * Para cuando este la identificacion implementada
        * Se pasaria como argumento a ListasDB.getAll()
        * String email = session.getAttribute("UserEmail");
        */
        listas = ListaDB.getAll();
    else
        listas = resultado;
%>

<!-- ***************************************************************************************************************** -->
<!-- Cuerpo de la pagina                                                                                               -->
<!-- ***************************************************************************************************************** -->
<div class="container-sm contenido">
  <p class="display-6">Mis listas</p>
  <!-- ***************************************************************************************************************** -->
  <!-- Buscador                                                                                                          -->
  <!-- ***************************************************************************************************************** -->

    <form class="buscador" method="POST" action="BuscarListasServlet"> <!--Llamar aqui al servlet -->
      <input type="text" name="busqueda" placeholder="Buscar...">
      <button id="buscar" class="btn btn-secondary"  type="submit" >Buscar</button>
      <button id="editar_lista" class="btn btn-secondary"  type="submit" >Editar lista</button>
    </form>

  <!-- ***************************************************************************************************************** -->
  <!-- Mis listas                                                                                                          -->
  <!-- ***************************************************************************************************************** -->

  <form class="buscador" method="POST" action=""> <!--Llamar aqui al servlet -->
    <div class="container text-center">

        <%
            if(busqueda && resultado.isEmpty()){
        %>
        <!-- Hay que poner esto mas bonito -->
        <h4 class="text-danger">No se han encontrado listas bajo esos criterios</h4>
        <%  
            //Cierre if
            }
            int i=0;
            for (ListaRecetas l : listas){
                if(i%3 == 0){
        %>
        <div class="row">
        <%
                //Cierre if
                }
        %>
            <div class="col">
                <div class="card" style="width: 18rem;">
                  <a href="detallesLista.html">
                    <img src="./images/corazon2.png" class="card-img-top" alt="lista favoritos">
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
        %>  
    
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