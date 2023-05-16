/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Datos.RecetaDB;
import Modelo.Usuario;
import Datos.UsuarioDB;
import Datos.SeguidorDeDB;
import Modelo.Receta;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author marta
 */
@WebServlet(name = "VerUsuarioServlet", urlPatterns = {"/VerUsuarioServlet"})
public class VerUsuarioServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String nextStep = "/perfil.jsp";
        
        String email = request.getParameter("email"); 
        
        Usuario usuario = UsuarioDB.obtieneUsuario(email);
        int seguidores = SeguidorDeDB.obtieneSeguidores(email);
        int seguidos = SeguidorDeDB.obtieneSeguidos(email);
        ArrayList<Receta> lista = RecetaDB.buscaRecetasPorUsuario(email);
        
        
        try {
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextStep);
                request.setAttribute("usuario", usuario);
                request.setAttribute("seguidores", seguidores);
                request.setAttribute("seguidos", seguidos);
                request.setAttribute("lista", lista);

                dispatcher.forward(request, response);
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
