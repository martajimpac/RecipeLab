/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;


import Modelo.Usuario;
//import com.google.gson.Gson;
import java.io.IOException;
import Datos.ComentarioDB;
import Modelo.Comentario;
import Modelo.Usuario;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author juani
 */
@WebServlet(name = "InsertaComentarioServlet", urlPatterns = {"/InsertaComentarioServlet"})
public class InsertaComentarioServlet extends HttpServlet {

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
        
        

        Gson gson = new Gson( );
        List<String> data = new ArrayList<>( );
        
        HttpSession sesion = request.getSession(true);
        Usuario user = (Usuario) sesion.getAttribute("usuario");
        
        String idReceta = request.getParameter("id");
        String texto = request.getParameter("com");
        String email = request.getParameter("email");
        String respuesta;
        Date date = new Date();
        if(!email.equals("")){
            respuesta = request.getParameter("resp");
            String fecha = request.getParameter("fecha");
            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            try {
                date = formatter.parse(fecha);
            }catch(ParseException e){
                System.out.println("hola");
            }
            data.add(respuesta);
        } else {
            respuesta = "";
            email = user.getEmail();
            data.add(texto);
        }
        
        
        data.add(user.getNombreUsuario());
        data.add(user.getAvatarUrl());
        
        
        //insertar comentario en id, falta id receta y id hilo?
        
        Comentario coment = new Comentario(email,Integer.valueOf(idReceta),0,texto,false,date,respuesta);
        ComentarioDB.insertaComentario(coment);

        response.setContentType( "application/json");
        response.getWriter( ).println( gson.toJson( data));
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
