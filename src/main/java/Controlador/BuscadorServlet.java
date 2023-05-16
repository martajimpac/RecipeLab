/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.Usuario;
import Modelo.Receta;
import java.util.ArrayList;
import java.util.Iterator;
import Datos.UsuarioDB;
import Datos.RecetaDB;
import java.io.IOException;
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
@WebServlet(name = "BuscadorServlet", urlPatterns = {"/BuscadorServlet"})
public class BuscadorServlet extends HttpServlet {

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
        String nextStep;

        //Recoger los datos que nos pasa el usuario por el formulario
        String tipo_busqueda = request.getParameter("tipo-busqueda");  
        String texto = request.getParameter("form-texto");  
        String precio = request.getParameter("form-precio");    
        String duracion = request.getParameter("form-duracion");   
        String categoria = request.getParameter("form-categoria");  
        String comensales  = request.getParameter("form-comensales");
        String dificultad = request.getParameter("form-dificultad");   
        String valoracion = request.getParameter("rating"); 
        
        //buscar personas
        if (tipo_busqueda.equals("personas")){
            ArrayList<Usuario> lista = new ArrayList<>();

            nextStep = "/resultadosPersonas.jsp";
            //recuperar los datos
            try{
                                System.out.println("SERVLET: listaperdonas");
                lista = UsuarioDB.buscaUsuarios(texto);
                                System.out.println("SERVLET: listaperdonas"+lista);
            }catch(Exception e){
                System.out.println(e);
            }

            // una vez se pulse el boton, se captura su evento y se recarga la pagina
            try {
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextStep);
                request.setAttribute("ListaUsuarios", lista);

                dispatcher.forward(request, response);
            } catch (IOException | ServletException e) {
                System.out.println(e);
            }
            
            
        } else{//buscar recetas
            nextStep = "/resultadosRecetas.jsp";
            ArrayList<Receta> lista = new ArrayList<>();
            //recuperar los datos
            try{
                lista = RecetaDB.buscaRecetasPorNombre(texto);
            }catch(Exception e){
                System.out.println(e);
            }

            Iterator<Receta> iter;
            //aplicar los filtros SOLO SI EL USUARIO A SELECIONADO ALGUN VALOR PARA EL FILTRO
            //eliminar de la lista los elementos que no cumplan la condicion
            if (!precio.equals("0")) {
                iter = lista.iterator();
                while (iter.hasNext()) {
                    Receta receta = iter.next();
                    if (receta.getPrecio() >= Integer.parseInt(precio)) {
                        iter.remove();
                    }
                }
            }
            if (!duracion.equals("0")){
                iter = lista.iterator();
                while (iter.hasNext()) {
                    Receta receta = iter.next();
                    if (receta.getDuracionEnSec() >= Integer.parseInt(duracion)) {
                        iter.remove();
                    }
                }
            }
            if (!categoria.equals("-1")){
                iter = lista.iterator();
                while (iter.hasNext()) {
                    Receta receta = iter.next();
                    if (!receta.getCategoria().name().equals(categoria)) {
                        iter.remove();
                    }
                }
            }
            if (!comensales.equals("-1")){
                iter = lista.iterator();
                while (iter.hasNext()) {
                    Receta receta = iter.next();
                    if (receta.getNumPersonas() != Integer.parseInt(comensales)) {
                        iter.remove();
                    }
                }
            }
            if (!dificultad.equals("-1")){
                iter = lista.iterator();
                while (iter.hasNext()) {
                    Receta receta = iter.next();
                    if (!receta.getDificultad().name().equals(dificultad)) {
                        iter.remove();
                    }
                }
            }
            if(valoracion != null){
                iter = lista.iterator();
                while (iter.hasNext()) {
                    Receta receta = iter.next();
                    
                    //eliminamos las recetas que tengan menor valoracion que la selecionada
                    if (receta.getValoracionMedia() < Integer.parseInt(valoracion)) {
                        iter.remove();
                    }
                }
            }

            // una vez se pulse el boton, se captura su evento y se recarga la pagina
            try {
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextStep);
                request.setAttribute("ListaRecetas", lista);

                dispatcher.forward(request, response);
            } catch (IOException | ServletException e) {
                System.out.println(e);
            }
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
