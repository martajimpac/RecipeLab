/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import java.io.IOException;
import Modelo.Receta;
import Datos.RecetaDB;
import java.util.ArrayList;
import java.util.Iterator;
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
@WebServlet(name = "CargaRecomendacionesServlet", urlPatterns = {"/CargaRecomendacionesServlet"})
public class CargaRecomendacionesServlet extends HttpServlet {

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
        String nextStep = "buscador.jsp";

        //Queremos que nos muestre dos recetas aleatorias de más de 4 estrellas
        
        ArrayList<Receta> lista = new ArrayList<>();
        //recuperar los datos
        try{
            lista = RecetaDB.buscaRecetasPorNombre("");
        }catch(Exception e){
            System.out.println(e);
        }
        
        Iterator<Receta> iter;

        //eliminar de la lista los elementos que no cumplan la condicion

        /*
        iter = lista.iterator();
        while (iter.hasNext()) {
            Receta receta = iter.next();

            //eliminamos las recetas que tengan menor valoracion que la selecionada
            if (receta.getValoracionMedia() < 4) {
                iter.remove();
            }
        }*/
        
        //elegir solo dos recetas aleatoriamente
       
        System.out.println("AAAAAAAAAAAAAArecom servlet "+lista.get(0));
        // una vez se pulse el boton, se captura su evento y se recarga la pagina
        try {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextStep);
            request.setAttribute("recomendaciones", lista);

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
