/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controlador;

import Datos.RecetaDB;
import Datos.SeguidorDeDB;
import Datos.UsuarioDB;
import Modelo.Receta;
import Modelo.RolUsuario;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author marta
 */
@WebServlet(name="CambiarContrasenaServlet", urlPatterns={"/CambiarContrasenaServlet"})
public class CambiarContrasenaServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
        String contrasena1 = request.getParameter("contrasena");
        String contrasena2 = request.getParameter("repetirContrasena");
        
        HttpSession sesion = request.getSession(true);
        Usuario usuarioSesion = (Usuario) sesion.getAttribute("usuario");
        
        RequestDispatcher dispatcher;
        try {
            if (!contrasena1.equals(contrasena2)) {
                response.addHeader("error", "Las contraseñas no coinciden");
                dispatcher = getServletContext().getRequestDispatcher("/cambiarContraseña.jsp"); 
                dispatcher.forward(request,response);  
            } else {
                usuarioSesion.setContraseña(contrasena1);
                UsuarioDB.modificaContraseña(usuarioSesion);
                
                //cargar novedades
                //Ver a quien sigo
                ArrayList<String> emailSeguidos = SeguidorDeDB.obtieneSeguidos(usuarioSesion.getEmail());

                ArrayList<Receta> recetas = new ArrayList<>();
                //Ver las publicaciones de los usuarios que sigo
                for (String emailSeguido : emailSeguidos) {
                    ArrayList<Receta> recetasSeguido = RecetaDB.buscaRecetasPorUsuario(emailSeguido);
                    recetas.addAll(recetasSeguido);
                }

                //Ver cuales son las 5 más recientes
                Collections.sort(recetas, new RecetaComparator());
                List<Receta> novedades = recetas.subList(0, Math.min(5, recetas.size())); 
                
                request.setAttribute("novedades", novedades);
                dispatcher = getServletContext().getRequestDispatcher("/sesionIniciada.jsp"); 
                dispatcher.forward(request,response);
            }    
        } catch (IOException | ServletException e) {
            System.out.println(e);
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
