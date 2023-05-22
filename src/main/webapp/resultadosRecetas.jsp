<%-- 
    Document   : resultadosRecetas
    Created on : 17 abr 2023, 2:04:07
    Author     : marta
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.Math"%>
<%@page import="Datos.ListaDB"%>
<%@page import="Modelo.Receta"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.ListaRecetas"%>
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
        <div class="resultados-busqueda">
        
 <% ArrayList<Receta> lista = (ArrayList<Receta>)request.getAttribute("ListaRecetas");
if(lista!=null){

        for(int i=0; i<lista.size();i++){
            Receta receta = lista.get(i); 
            int id = receta.getId();
     %>
          
          <div class="card" style="width: 18rem;">

            <%  if(usuario!=null)
                {
                    //Se obtienen las listas del usuario
                    List<ListaRecetas> listas = ListaDB.getAll(usuario.getEmail());
                    
            %>
            <div class="corazon-sobre-div">
                <a href="#" id="enlace<%=i%>"> <img src="./images/corazon.png" alt="cruz"/></a>
            </div>
            <!---- Menu en el que aparecen las listas de haber alguna ----->
            <div class="submenu top-0 start-0 w-100" id="submenu<%=i%>">
                  <%
                      if(listas.isEmpty()){
                  %>
                  <ul class="list-unstyled mt-2 mb-2">
                    <li class="fw-bold">No tienes ninguna lista a la que añadir la receta</li>
                  </ul>
                  <%
                      }else{
                  %>
                  <ul class="list-unstyled mt-2 mb-2">
                    <%
                        for(ListaRecetas l : listas){
                            List<Receta> r = ListaDB.getRecetasBusqueda(l.getNombre(), receta.getNombre());
                            
                            if(r.isEmpty()){
                    %>
                    <li class="fw-bold">
                        <a id="anadir<%=i%>" href="AnadirRecetasAListaServlet?nombreLista=<%=l.getNombre()%>&idReceta=<%=receta.getId()%>" class="text-decoration-none"><%=l.getNombre()%></a>
                    </li>
                    <%
                            }else{
                    %>
                    <li class="fw-bold">
                        <a id="eliminar<%=i%>" href="EliminarRecetaDeListaServlet?nombreLista=<%=l.getNombre()%>&idReceta=<%=receta.getId()%>" class="text-decoration-none text-warning">(Añadida) <%=l.getNombre()%></a>
                    </li>
                    <%
                            }
                        } //Cierre for
                    %>
                  </ul>
                  <%
                      } //Cierre else
                  %>
            </div>
            <%  }%>
            <a href="VerRecetaServlet?id=<%= id %>">
              <img src="<%=receta.getUrlImagen()%>" class="card-img-top" alt="receta">
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
            
    <%} //del for
}//del if%>

     </div>
</div>
</div> <!--del contenido-->

<!-- ***************************************************************************************************************** -->
<!-- Pie de página                                                                                                     -->
<!-- ***************************************************************************************************************** -->

<%@ include file="/includes/footer.html" %>

<!-- Importar bootstrap -->
<!-- Importar javascript -->
<script src="js/jquery-3.6.4.js" type="text/javascript"></script>
<script src="js/header.js" type="text/javascript"></script>
<script src="js/submenuAnadirRecetaLista.js" type="text/javascript"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>
