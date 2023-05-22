/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Datos;

import java.util.List;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.PreparedStatement;
import Modelo.ListaRecetas;
import Modelo.Receta;
import Modelo.DificultadReceta;

/**
 *
 * @author Víctor
 */
public class ListaDB {
    //Obtener todas la listas de un usuario
    public static List<ListaRecetas> getAll(String email){
        
        //Obtener conexion a la base de datos
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        
        String query = "SELECT * FROM listarecetas WHERE emailUsuario = ?";
        try {
            List<ListaRecetas> lista = new ArrayList<>();
            
            /*crear la consulta dinamica
             *añadir las variables a la query
             *ejecutar la query*/
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, email);
            ResultSet result = statement.executeQuery();
            
            //Obtener resultados
            while(result.next()){
                ListaRecetas l = new ListaRecetas();
                l.setNombre(result.getString("NOMBRE"));
                l.setDescripcion(result.getString("DESCRIPCION"));
                l.setFechaCreacion(result.getDate("FECHACREACION"));
                l.setFechaModificacion(result.getDate("FECHAMODIFICACION"));
                l.setImagenLista(result.getBytes("IMAGENLISTA"));
                
                lista.add(0,l);
            }
            connection.close();
            return lista;
        } catch (Exception e) {
            return null;
        }
    }
    
    //Obtener listas de un usuario en base a una busqueda
    public static List<ListaRecetas> getListasPorBusqueda(String nombre, String email){
        
        //Obtener conexion a la base de datos
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        
        String query = "SELECT * FROM listarecetas WHERE nombre LIKE ? AND emailUsuario = ?";
        try {
            List<ListaRecetas> lista = new ArrayList<>();
     
            /*preparar la consulta dinamica
             *añadir las variables a la query
             *ejecutar la query*/
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, "%"+nombre+"%");
            statement.setString(2, email);
            ResultSet result = statement.executeQuery();
            
            //Obtener resultados
            while(result.next()){
                ListaRecetas l = new ListaRecetas();
                l.setNombre(result.getString("NOMBRE"));
                l.setDescripcion(result.getString("DESCRIPCION"));
                l.setFechaCreacion(result.getDate("FECHACREACION"));
                l.setFechaModificacion(result.getDate("FECHAMODIFICACION"));
                l.setImagenLista(result.getBytes("IMAGENLISTA"));
                
                lista.add(0,l);
            }
            connection.close();
            return lista;
        } catch (Exception e) {
            return null;
        }
    }
    
    //Eliminar lista (se eliminan los detalles de la lista para poder borrarla)
    public static void removeList(String nombreLista, String email){
        
        //Obtener conexion a la base de datos
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        
        //----------- Borrar detalles de la lista -----------------
        String query1 = "DELETE FROM detalleslista d WHERE nombreLista = ?";
        try {
            /*crear la consulta dinamica
             *añadir las variables a la query
             *ejecutar la query*/
            PreparedStatement statement = connection.prepareStatement(query1);
            statement.setString(1, nombreLista);
            statement.executeUpdate();
        } catch (Exception e) {
        }
        
        //---------------- Borrar la lista --------------------
        String query2 = "DELETE FROM listarecetas WHERE emailUsuario = ? AND nombre = ?";

        try {
            /*crear la consulta dinamica
             *añadir las variables a la query
             *ejecutar la query*/
            PreparedStatement statement = connection.prepareStatement(query2);
            statement.setString(1, email);
            statement.setString(2, nombreLista);
            statement.executeUpdate();
            
            connection.close();
        } catch (Exception e) {
        }
    }
    
    //Obtener todas las recetas de la lista
    public static List<Receta> getRecetas(String nombreLista){
        
        //Obtener conexion a la base de datos
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        
        String query = "SELECT r.* FROM detalleslista d , receta r WHERE d.nombreLista = ? AND d.idReceta = r.id;";
        try {
            List<Receta> lista = new ArrayList<>();
     
            /*preparar la consulta dinamica
             *añadir las variables a la query
             *ejecutar la query*/
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, nombreLista);
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                Receta r = new Receta();
                r.setId(result.getInt("ID"));
                r.setNombre(result.getString("NOMBRE"));
                r.setNumPersonas(result.getInt("NUMPERSONAS"));
                r.setDuracionEnSec(result.getInt("DURACIONENSEC"));
                r.setPrecio(result.getDouble("PRECIO"));
                r.setDificultad(DificultadReceta.valueOf(result.getString("DIFICULTADRECETA")));
                r.setValoracionMedia(result.getDouble("VALORACIONMEDIA"));
                r.setImagenReceta(result.getBytes("IMAGENRECETA"));
               
                lista.add(0,r);
            }
            connection.close();
            return lista;
        } catch (Exception e) {
            return null;
        }
    }
    
    //Obtener recetas de una lista en base a una busqueda
    public static List<Receta> getRecetasBusqueda(String nombreLista, String busqueda){
        
        //Obtener conexion a la base de datos
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        
        String query = "SELECT r.* FROM detalleslista d , receta r WHERE d.nombreLista = ? AND d.idReceta = r.id AND r.nombre LIKE ?;";
        try {
            List<Receta> lista = new ArrayList<>();
     
            /*preparar la consulta dinamica
             *añadir las variables a la query
             *ejecutar la query*/
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, nombreLista);
            statement.setString(2, "%"+busqueda+"%");
            ResultSet result = statement.executeQuery();
            
            while(result.next()){
                Receta r = new Receta();
                r.setId(result.getInt("ID"));
                r.setNombre(result.getString("NOMBRE"));
                r.setNumPersonas(result.getInt("NUMPERSONAS"));
                r.setDuracionEnSec(result.getInt("DURACIONENSEC"));
                r.setPrecio(result.getDouble("PRECIO"));
                r.setDificultad(DificultadReceta.valueOf(result.getString("DIFICULTADRECETA")));
                r.setValoracionMedia(result.getDouble("VALORACIONMEDIA"));
                r.setImagenReceta(result.getBytes("IMAGENRECETA"));
                                   
                lista.add(0,r);
            }
            connection.close();
            return lista;
        } catch (Exception e) {
            return null;
        }
    }
    
    //Eliminar receta de la lista
    public static void removeRecetaList(String nombreLista, String idReceta){
        
        //Obtener conexion a la base de datos
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();

        String query = "DELETE FROM detalleslista WHERE nombreLista = ? AND idReceta = ?";
        try {
            /*crear la consulta dinamica
             *añadir las variables a la query
             *ejecutar la query*/
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, nombreLista);
            statement.setString(2, idReceta);
            statement.executeUpdate();
            
            connection.close();
        } catch (Exception e) {
        }
    }
    
    //Añade una receta a la lista
    public static void addRecetaList(String nombreLista, String idReceta){
        
        //Obtener conexion a la base de datos
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();

        String query = "INSERT INTO detalleslista (nombreLista, idReceta) VALUES(?, ?)";
        try {
            /*crear la consulta dinamica
             *añadir las variables a la query
             *ejecutar la query*/
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, nombreLista);
            statement.setString(2, idReceta);
            statement.executeUpdate();
            
            connection.close();
        } catch (Exception e) {
        }
    }
}
