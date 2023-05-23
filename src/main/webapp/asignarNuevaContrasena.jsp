<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Asignar Nueva contraseña</title>
        <link rel="icon" type="image/png" href="images/logoPestanna.png" />

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <LINK rel="stylesheet" type="text/css" href="css/app.css" />
    </head>
    
    <body>
        <%@ include file="/includes/header.html" %>
        
        <% String email = request.getParameter("email"); %>
        <% String error = (String)request.getAttribute("error"); %>
        
        <div class="container-sm contenido">
            <div class="inicioSesion">
                <p>Asignar Nueva contraseña</p>
                <form method="POST" action="AsignarNuevaContrasena">
                    <input type="hidden" id="email" name="email" value="<%=email%>">
                    <input type="password" id="contrasena" name="contrasena" placeholder="Constraseña" required>
                    <input type="password" id="repetirContrasena" name="repetirContrasena" placeholder="Repite la contraseña" required>
                    <input type="submit" value="Guardar cambios">
                </form>
                
                <a href="olvidoContrasena.jsp">Volver a enviar el correo</a>
                
                <p>
                    <%if (error != null) {%>
                        <i><%=error%></i>
                    <%}%>
                </p>
            </div>
        </div>
            
        <%@include file="/includes/footer.html" %>
        <script src="js/app.js" type="text/javascript"></script>
    </body>
</html>
