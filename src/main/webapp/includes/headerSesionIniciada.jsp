<%-- 
    Document   : headerSesionIniciada
    Created on : 17 abr 2023, 2:24:30
    Author     : marta
--%>
<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<nav>
    
<%Usuario usuarioSesionHeader = (Usuario) session.getAttribute("usuario"); 
String emailHeader = usuarioSesionHeader.getEmail();%>
    <script src="js/jquery-3.6.4.js" type="text/javascript"></script>
    <script src="js/header.js" type="text/javascript"></script>
    <div>
        <a href="CargarNovedadesServlet?email=<%= emailHeader %>">
            <img src="images/logo.png" alt="logo" class="imagen-logo"/>
        </a>
    </div>
    <div>
       
            <a href="nuevaReceta.jsp"><img src="images/anadir.png" alt="añadir receta" class="imagen-nav"/></a>
            <a href="#"><img id="comentario-image" src="images/mensaje.png" alt="ver mensajes" class="imagen-nav"/></a>
            <a href="listas.jsp"><img src="images/corazon.png" alt="ver mis listas" class="imagen-nav"/></a>
            <a href="#"><img id="login-image" src="images/login.png" alt="ver mi perfil" class="imagen-nav imagen-nav-click"/>
            <li>
                <ul class="submenu">
                    <li><a href="VerUsuarioServlet?email=<%= emailHeader %>">Ver mi perfil</a></li>
                    <li><a href="cambiarContraseña.jsp">Cambiar contraseña</a></li>
                    <li><a href="index.jsp" id="cerrar-sesion">Cerrar sesión</a></li>
                </ul>
            </li> 
            <li>
                <ul class="submenu-comentarios">
                </ul>
            </li> 
    </div>
</nav>