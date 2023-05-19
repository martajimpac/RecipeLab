/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Datos.ComentarioDB;
import Datos.RecetaDB;
import Datos.DetallesRecetaDB;
import Datos.PasoRecetaDB;
import Datos.UsuarioDB;
import Modelo.Comentario;
import Modelo.Receta;
import Modelo.DetallesReceta;
import Modelo.PasosReceta;
import Modelo.Usuario;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "VerRecetaServlet", urlPatterns = {"/VerRecetaServlet"})
public class VerRecetaServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String nextStep;
        
        int id = Integer.parseInt(request.getParameter("id")); 
        
        Receta receta = RecetaDB.buscaRecetaPorId(id);
        HttpSession sesion = request.getSession(true);
        Usuario usuarioSesion = (Usuario) sesion.getAttribute("usuario");
        Usuario usuarioReceta;
        
        //si no se ha iniciado sesion: 
        if(usuarioSesion==null){
            usuarioReceta = UsuarioDB.obtieneUsuario(receta.getEmailUsuario());
            nextStep = "/receta.jsp";   
            
        }else{ //si hemos iniciado sesion
            if( usuarioSesion.getEmail().equals(receta.getEmailUsuario()) ) {
            usuarioReceta = usuarioSesion;
            nextStep = "/miReceta.jsp";
            }
            else {
                usuarioReceta = UsuarioDB.obtieneUsuario(receta.getEmailUsuario());
                nextStep = "/receta.jsp";
            }
        }

        
        ArrayList<DetallesReceta> ingredientes = DetallesRecetaDB.obtieneIngredientes(id);
        ArrayList<PasosReceta> pasos = PasoRecetaDB.getPasosReceta(id);
        List<Comentario> comentarios = ComentarioDB.getComentariosByIdReceta(id);
        List<Usuario> usuariosComentarios = new ArrayList<>();
        for(Comentario i: comentarios){
            Usuario usuarioCom = UsuarioDB.obtieneUsuario(i.getEmailUsuario());
            usuariosComentarios.add(usuarioCom);
        }
       
        try {
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextStep);
                request.setAttribute("receta", receta);
                request.setAttribute("usuarioReceta", usuarioReceta);
                request.setAttribute("ingredientes", ingredientes);
                request.setAttribute("pasos", pasos);

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
