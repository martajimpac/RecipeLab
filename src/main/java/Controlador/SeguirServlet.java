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
import javax.servlet.http.HttpSession;

/**
 *
 * @author marta
 */
@WebServlet(name = "SeguirServlet", urlPatterns = {"/SeguirServlet"})
public class SeguirServlet extends HttpServlet {

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
        
        String nextStep= "/perfil.jsp";

        String seguir = request.getParameter("Seguir");
        String dejarseguir = request.getParameter("DejarSeguir");
        String emailUsuario = request.getParameter("email");
        
        HttpSession sesion = request.getSession();
        Usuario usuarioSesion = (Usuario) sesion.getAttribute("usuario");
        String miEmail = usuarioSesion.getEmail();
        
        boolean seguido = false; 
        
        if(seguir!=null){
            SeguidorDeDB.seguir(miEmail, emailUsuario);
        }        
        if(dejarseguir!=null){
            SeguidorDeDB.dejarDeSeguir(miEmail, emailUsuario);
        }
       
        seguido = SeguidorDeDB.verSiLeSigo(miEmail,emailUsuario);
        
        //volvemos a cargar los datos del usuario
        Usuario usuario = UsuarioDB.obtieneUsuario(emailUsuario);
        int seguidores = SeguidorDeDB.obtieneNumeroSeguidores(emailUsuario);
        int seguidos = SeguidorDeDB.obtieneNumeroSeguidos(emailUsuario);
        ArrayList<Receta> lista = RecetaDB.buscaRecetasPorUsuario(emailUsuario);
        
        try {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextStep);
            request.setAttribute("usuario", usuario);
            request.setAttribute("seguidores", seguidores);
            request.setAttribute("seguidos", seguidos);
            request.setAttribute("seguido", seguido);
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
