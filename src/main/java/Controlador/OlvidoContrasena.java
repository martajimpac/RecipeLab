package Controlador;

import Datos.UsuarioDB;
import Modelo.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;*/
import javax.servlet.RequestDispatcher;

/**
 * @author teresa
 */
@WebServlet(name = "OlvidoContrasena", urlPatterns = {"/OlvidoContrasena"})
public class OlvidoContrasena extends HttpServlet {
    
    /*
     * Toda la parte relativa al envio de correos esta comentada debido a que
     * google ya no permite habilitar receptores no seguros.
     * Ver la consola de "Apache Tomcat or TomEE" o revisar el campo 
     * "codigoRecuperacion" de la tabla "usuario" en la base de datos
     * para obtener el codigo generado
    */
    
    // Se debe poner uno que exista 
    //private final String emailFrom = "example@example.com";
    
    protected void processRequest(
        HttpServletRequest request, 
        HttpServletResponse response
    ) throws ServletException, IOException {
        response.setContentType("text/html");
        
        String url = "/recuperarContrasena.jsp";
        String email = request.getParameter("email");
        
        Usuario usuario = UsuarioDB.obtieneUsuario(email);
        if (usuario != null) {
            String codigoRecuperacion = UsuarioDB.generaCodigoRecuperacionConstrasena(email);
            System.out.println("Código de recuperación: " + codigoRecuperacion);
            
            /*try {
                // 1 - get a mail session
                Properties props = new Properties();
                props.put("mail.smtp.host", "localhost");
                Session session = Session.getDefaultInstance(props);
                
                // 2 - create a message
                Message message = new MimeMessage(session);
                message.setSubject("Código de Recuperación de contraseña");
                message.setText(codigoRecuperacion);
                
                // 3 - address the message
                Address fromAddress = new InternetAddress(emailFrom);
                Address toAddress = new InternetAddress(email);
                message.setFrom(fromAddress);
                message.setRecipient(Message.RecipientType.TO, toAddress);
                
                // 4 - send the message
                Transport.send(message);
                
                
            } catch (MessagingException e) {
                System.err.println(e.toString());
            }*/
        }
        
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
    }
    
        // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
