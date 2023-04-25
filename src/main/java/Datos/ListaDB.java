/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Datos;

import java.util.List;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpSession;
import Modelo.ListaRecetas;

/**
 *
 * @author Víctor
 */
public class ListaDB {
    public static List<ListaRecetas> getAll(String email){
        
        //Obtener conexion a la base de datos
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        
        String query = "SELECT * FROM listarecetas WHERE emailUsuario = ?";
        
        try {
            List<ListaRecetas> lista = new ArrayList<>();
            
            /*
            //crear la consulta dinamica
            //añadir las variables a la query
            //ejecutar la query
            */
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, email);
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                ListaRecetas l = new ListaRecetas();
                l.setNombre(result.getString("NOMBRE"));
                l.setDescripcion(result.getString("DESCRIPCION"));
                l.setFechaCreacion(result.getDate("FECHACREACION"));
                l.setFechaModificacion(result.getDate("FECHAMODIFICACION"));
                /* Imagen pendiente de guardarla bien en DB*/
                
                lista.add(0,l);
            }
            connection.close();
            return lista;
        } catch (Exception e) {
            return null;
        }
    }
    
    public static List<ListaRecetas> getListasPorBusqueda(String nombre, String email){
        
        //Obtener conexion a la base de datos
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        
        String query = "SELECT * FROM listarecetas WHERE nombre LIKE ? AND emailUsuario = ?";
        
        try {
            List<ListaRecetas> lista = new ArrayList<>();
     
            /*
            //preparar la consulta dinamica
            //añadir las variables a la query
            //ejecutar la query
            */
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, "%"+nombre+"%");
            statement.setString(2, email);
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                ListaRecetas l = new ListaRecetas();
                l.setNombre(result.getString("NOMBRE"));
                l.setDescripcion(result.getString("DESCRIPCION"));
                l.setFechaCreacion(result.getDate("FECHACREACION"));
                l.setFechaModificacion(result.getDate("FECHAMODIFICACION"));
                /* Imagen pendiente de guardarla bien en DB*/
                
                lista.add(0,l);
            }
            connection.close();
            return lista;
        } catch (Exception e) {
            return null;
        }
    }
}
