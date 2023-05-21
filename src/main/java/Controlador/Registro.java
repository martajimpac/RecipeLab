package Controlador;

import Datos.UsuarioDB;
import Modelo.RolUsuario;
import Modelo.Usuario;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author teresa
 */
@WebServlet(name = "Registro", urlPatterns = {"/Registro"})
public class Registro extends HttpServlet {
    
    protected void processRequest(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        String url = "/registro.jsp";
        
        String email = request.getParameter("email");
        String nombre = request.getParameter("nombre");
        String contrasena1 = request.getParameter("contrasena");
        String contrasena2 = request.getParameter("repetirContrasena");
        int codigoError;
        
        RequestDispatcher dispatcher;
        
        try {
            if (!contrasena1.equals(contrasena2)) {
                response.addHeader("error", "Las contraseñas no coinciden");
                dispatcher = getServletContext().getRequestDispatcher(url); 
                dispatcher.forward(request,response);  
            } else if (UsuarioDB.obtieneUsuario(email) != null) {
                response.addHeader("error", "Ya existe un usuario con el email " + email);
                dispatcher = getServletContext().getRequestDispatcher(url); 
                dispatcher.forward(request,response);  
            } else {
                Usuario usuario = new Usuario();
                usuario.setEmail(email);
                usuario.setNombreUsuario(nombre);
                RolUsuario rol = RolUsuario.valueOf("publicador");
                usuario.setRolUsuario(rol);
                usuario.setValoracion(0);
                usuario.setContraseña(contrasena1);
                usuario.setEsPrivado(false);
                
                HttpSession nuevaSesion = request.getSession(true);
                nuevaSesion.setAttribute ("usuario", usuario);

                UsuarioDB.insertaUsuario(usuario);
                url = "sesionIniciada.jsp";
                response.sendRedirect(url);
            }    
        } catch (IOException | ServletException e) {
            System.out.println(e);
        }
   
        
  
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