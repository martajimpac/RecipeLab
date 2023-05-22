<%-- 
    Document   : resultadosPersonas
    Created on : 17 abr 2023, 2:03:58
    Author     : marta
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.Math"%>
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
<%Usuario usuarioSesion = (Usuario) session.getAttribute("usuario");
 if(usuarioSesion!=null){%>
    <%@ include file="/includes/headerSesionIniciada.jsp" %>
 <%}else{%>
    <%@ include file="/includes/header.html" %>
 <%}%>


<!-- ***************************************************************************************************************** -->
<!-- Cuerpo de la pagina                                                                                               -->
<!-- ***************************************************************************************************************** -->
<div class="container-sm contenido">

  <div class="d-flex align-items-center">
      
    <%if(usuarioSesion==null){%>
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
            
<%      ArrayList<Usuario> lista = (ArrayList<Usuario>)request.getAttribute("ListaUsuarios");
            if(lista!=null){
                for(int i=0; i<lista.size();i++){
                    Usuario user = lista.get(i); 
                    
                    //si uno de los resultados somos nosotros (el usuario identificado) no mostrar
                    if( (usuarioSesion==null) || (usuarioSesion!=null && (!user.getEmail().equals(usuarioSesion.getEmail())) )){
                 %> 
                      <div class="card" style="width: 18rem;">
                        <a href="VerUsuarioServlet?email=<%= user.getEmail() %>">
                          <img src="<%= user.getAvatarUrl() %>" class="card-img-top" alt="foto de perfil">
                        </a>
                        <div class="card-body">
                          <h5 class="card-title"><%= user.getNombreUsuario() %> </h5>
                        </div>
                      </div>     
            <%      }//del if
                } //del for
            }//del if%> 


        </div>
    </div>
</div> <!--del contenido-->
<!-- ***************************************************************************************************************** -->
<!-- Pie de página                                                                                                     -->
<!-- ***************************************************************************************************************** -->
     <%@ include file="/includes/footer.html" %>

<!-- Importar bootstrap y javascript-->
<!-- Importar javascript -->

<script src="js/guardarReceta.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
</body>
</html>
