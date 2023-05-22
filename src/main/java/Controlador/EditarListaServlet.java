/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Datos.ListaDB;
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
 * @author Víctor
 */
@WebServlet(name = "EditarListaServlet", urlPatterns = {"/EditarListaServlet"})
public class EditarListaServlet extends HttpServlet {

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
        
        // variables que vamos a utilizar
        String nextStep = "/listas.jsp";
       
        try{
            
            //Obtener sesion de usuario identificado
            HttpSession session = request.getSession();
            Usuario user = (Usuario) session.getAttribute("usuario");
            
            String nombreLista = request.getParameter("nombreLista");
            String viejoNombre = request.getParameter("viejoNombre");
            String descripcionLista = request.getParameter("descripcionLista");

            if(!nombreLista.isEmpty() || !descripcionLista.isEmpty()){
                ListaDB.editarLista(viejoNombre,nombreLista,descripcionLista,user.getEmail());
            }
        }catch(Exception e){
            System.out.println(e);
        }
        
        // una vez se pulse el boton, se captura su evento y se recraga la misma pagina
        try {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextStep);
                
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
