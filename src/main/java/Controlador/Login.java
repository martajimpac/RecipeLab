package Controlador;

import Datos.SeguidorDeDB;
import Datos.UsuarioDB;
import Datos.RecetaDB;
import Modelo.Usuario;
import Modelo.Receta;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Comparator;
import java.util.Collections;
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

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {
    
    protected void processRequest(
        HttpServletRequest request, 
        HttpServletResponse response
    ) throws ServletException, IOException {
        response.setContentType("text/html");
        
        String email = request.getParameter("email");
        String contrasena = request.getParameter("contrasena");
        
        String url;
        Usuario usuario = UsuarioDB.obtieneUsuario(email);
        
        //NOVEDADES
        
        //Ver a quien sigo
        ArrayList<String> emailSeguidos = SeguidorDeDB.obtieneSeguidos(email);
        
        ArrayList<Receta> recetas = new ArrayList<>();
        //Ver las publicaciones de los usuarios que sigo
        for (String emailSeguido : emailSeguidos) {
            ArrayList<Receta> recetasSeguido = RecetaDB.buscaRecetasPorUsuario(emailSeguido);
            recetas.addAll(recetasSeguido);
        }

        //Ver cuales son las 5 más recientes
        Collections.sort(recetas, new RecetaComparator());
        List<Receta> novedades = recetas.subList(0, Math.min(5, recetas.size())); 

        if (usuario != null && UsuarioDB.validaContrasena(usuario,contrasena)) {
            
            HttpSession nuevaSesion = request.getSession(true);
            nuevaSesion.setAttribute("usuario", usuario);
            url = "/sesionIniciada.jsp";
            try {
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
                request.setAttribute("novedades", novedades);
                dispatcher.forward(request, response);
            } catch (IOException | ServletException e) {
                System.out.println(e);
            }
        } else {
            response.setHeader("error", "Las credenciales no son correctas");
            url = "/login.jsp";
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(url);
            dispatcher.forward(request, response);
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


class RecetaComparator implements Comparator<Receta> {
    @Override
    public int compare(Receta receta1, Receta receta2) {
        return receta2.getFechaPublicacion().compareTo(receta1.getFechaPublicacion());
    }
}
