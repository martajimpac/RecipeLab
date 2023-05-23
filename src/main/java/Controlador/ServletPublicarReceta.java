/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Datos.RecetaDB;
import Datos.SeguidorDeDB;
import Datos.UsuarioDB;
import Modelo.Categoria;
import Modelo.Receta;
import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author juani
 */
@WebServlet(name = "ServletPublicarReceta", urlPatterns = {"/publicacion"})
@MultipartConfig
public class ServletPublicarReceta extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletPublicarReceta</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletPublicarReceta at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
        Part imagen = request.getPart("imagen");
        String nombre = request.getParameter("nombre");
        
        ArrayList<String> nombresIngr = new ArrayList<>();
        ArrayList<String> cantidadesIngr = new ArrayList<>();
        
        for(int i = 1; ; i++){
            String nombreIngr = request.getParameter("nombre"+i);
            String cantidadIngr = request.getParameter("cantidad"+i);
            if(nombreIngr != null){
                nombresIngr.add(nombreIngr);
                cantidadesIngr.add(cantidadIngr);
            } else break;
        }
        
        String duracion = request.getParameter("duracion");
        String unidadTiempo = request.getParameter("tiempo");
        
        int duracionEnSec,multiplicador = 1;
        
        switch(unidadTiempo){
            case "segundos":
                multiplicador = 1;
                break;
            case "minutos":
                multiplicador = 60;
                break;
            case "horas":
                multiplicador = 3600;
                break;
        }
        
        duracionEnSec = Integer.valueOf(duracion) * multiplicador;
        
        String numPersonas = request.getParameter("numPersonas");
        String dificultad = request.getParameter("dificultad");
        String categoria = request.getParameter("categoria");
        
        ArrayList<String> pasos = new ArrayList<>();
        for(int i = 1; ; i++){
            String paso = request.getParameter(""+i);
            if(paso != null){
                pasos.add(paso);
            } else break;
        }
        
        HttpSession sesion = request.getSession(true);
        Usuario user = (Usuario) sesion.getAttribute("usuario");
        String email = user.getEmail();
        
        //TODO  jsp obtener si comentarios,precio,categoria
        Receta receta = new Receta(RecetaDB.creaId(),email, nombre,Integer.valueOf(numPersonas),dificultad,duracionEnSec,0, true, 0, imagen.getInputStream().readAllBytes(), categoria);
        receta.setPasos(pasos);
        //receta.setIngredientes(nombresIngr,cantidadesIngr);
        RecetaDB.insertaReceta(receta);
       
        Usuario usuario = UsuarioDB.obtieneUsuario(email);
        int seguidores = SeguidorDeDB.obtieneNumeroSeguidores(email);
        int seguidos = SeguidorDeDB.obtieneNumeroSeguidos(email);
        ArrayList<Receta> lista = RecetaDB.buscaRecetasPorUsuario(email);

        
        // forward request and response objects to JSP page
        String url = "/miPerfil.jsp";
        RequestDispatcher dispatcher =
        getServletContext().getRequestDispatcher(url);
        request.setAttribute("usuario",user);
        request.setAttribute("seguidores",seguidores);
        request.setAttribute("seguidos",seguidos);
        request.setAttribute("lista", lista);
        dispatcher.forward(request, response); 
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