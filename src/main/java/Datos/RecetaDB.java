/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Datos;

import Modelo.Receta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.rowset.serial.SerialBlob;


/**
 *
 * @author juani
 */
public class RecetaDB {
    
    public static ArrayList<Receta> buscaRecetasPorNombre(String nombreReceta) {
        
        //Obtener conexion a la base de datos
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        
        //vamos a buscar los usuarios cuyo nombre contenga la cadena introducida
        String query = "SELECT * FROM receta r WHERE r.nombre LIKE ?";
        
        try {
            ArrayList<Receta> lista = new ArrayList<>();
            //crear la consulta dinamica
            PreparedStatement statement = connection.prepareStatement(query);
         
            //añadir las variables a la query
            statement.setString(1,"%"+nombreReceta+"%");
            
            //ejecutar la query
            ResultSet result = statement.executeQuery();
            
         
            while(result.next()){
                int id = result.getInt("id");
                String emailUsuario = result.getString("emailUsuario");
                String nombre = result.getString("nombre");
                int numPersonas = result.getInt("numPersonas");
                String dificultad = result.getString("dificultadReceta");
                int duracion = result.getInt("duracionEnSec");
                int valoracion = result.getInt("valoracionMedia");
                boolean comentarios = result.getBoolean("comentariosActivados");
                double precio = result.getDouble("precio");
                byte [] imagen = result.getBytes("imagenReceta");
                String categoria = result.getString("categoria");
                
                Receta receta = new Receta(id,emailUsuario,nombre,numPersonas,dificultad,duracion,valoracion,comentarios,precio,imagen,categoria);
                lista.add(receta);     
            }
            return lista;
        } catch (Exception e) {
            return null;
        }
    }
    
    public static ArrayList<Receta> buscaRecetasPorUsuario(String email){
        
        ArrayList<Receta> recetas = new ArrayList();
        
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement preparedStatement;
        ResultSet result;
        
        String query = "SELECT * FROM receta WHERE emailusuario = ?";
        
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            result = preparedStatement.executeQuery();
            while(result.next()){
                int id = result.getInt("id");
                String nombre = result.getString("nombre");
                int numPersonas = result.getInt("numPersonas");
                String dificultad = result.getString("dificultadReceta");
                int duracion = result.getInt("duracionEnSec");
                int valoracion = result.getInt("valoracionMedia");
                boolean comentarios = result.getBoolean("comentariosActivados");
                double precio = result.getDouble("precio");
                byte [] imagen = result.getBytes("imagenReceta");
                String categoria = result.getString("categoria");
                Date fechaPublicacion = result.getDate("fechaPublicacion");
                
                Receta receta = new Receta(id,email,nombre,numPersonas,dificultad,duracion,valoracion,comentarios,precio,imagen,categoria);
                receta.setFechaPublicacion(fechaPublicacion);
                recetas.add(receta);
            }
        } catch (SQLException e) {
            //TODO: tratamiento excepciones
        }
        return recetas; 
    }
    
    public static Receta buscaRecetaPorId(int id){
        
        Receta receta = null;
        
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement preparedStatement;
        ResultSet result;
        
        String query = "SELECT * FROM receta WHERE id = ?";
        
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            result = preparedStatement.executeQuery();
            while(result.next()){
  
                String nombre = result.getString("nombre");
                String email = result.getString("emailUsuario");
                int numPersonas = result.getInt("numPersonas");
                String dificultad = result.getString("dificultadReceta");
                int duracion = result.getInt("duracionEnSec");
                int valoracion = result.getInt("valoracionMedia");
                boolean comentarios = result.getBoolean("comentariosActivados");
                double precio = result.getDouble("precio");
                byte [] imagen = result.getBytes("imagenReceta");
                String categoria = result.getString("categoria");
                
                receta = new Receta(id,email,nombre,numPersonas,dificultad,duracion,valoracion,comentarios,precio,imagen,categoria);
            }
        } catch (SQLException e) {
            //TODO: tratamiento excepciones
        }
        return receta; 
    }
    
    
    
    public static void insertaReceta(Receta receta){
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement preparedStatement;
        //('1', 'usuario1@example.com', 'Tarta de manzana', 8, 'media', 3600, 4, true, 12.50, LOAD_FILE('C:\Users\juani\Desktop\UNI\3ano\SSW\RecipeLab\src\main\webapp\images\ejemplo-receta-1'), 'postre')
        String insert = "INSERT INTO receta VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
        
        try {
            preparedStatement = connection.prepareStatement(insert);
            preparedStatement.setInt(1,receta.getId());
            preparedStatement.setString(2,receta.getEmailUsuario());
            preparedStatement.setString(3,receta.getNombre());
            preparedStatement.setInt(4,receta.getNumPersonas());
            preparedStatement.setString(5,receta.getDificultad().toString());
            preparedStatement.setInt(6,receta.getDuracionEnSec());
            preparedStatement.setDouble(7,receta.getValoracionMedia());
            preparedStatement.setBoolean(8,receta.isComentariosActivados());
            preparedStatement.setDouble(9,receta.getPrecio());
            preparedStatement.setBlob(10,new SerialBlob(receta.getImagenReceta()));
            preparedStatement.setString(11,receta.getCategoria().toString());
            LocalDate localDate = LocalDate.now();
            Date sqlDate = Date.valueOf(localDate);
            preparedStatement.setDate(12,sqlDate);
            preparedStatement.executeUpdate(); 
        } catch (SQLException ex) {
            Logger.getLogger(RecetaDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        PasoRecetaDB.insertaPasos(receta.getPasos());
    }
    
    public static int creaId (){
        
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement preparedStatement;
        ResultSet result;
        int id = 1;
        
        String query = "SELECT MAX(id) FROM receta";
        
        try {
            preparedStatement = connection.prepareStatement(query);
            result = preparedStatement.executeQuery();
            if(result.next()) id = result.getInt("MAX(id)") + 1;          
        } catch (SQLException e) {
            //TODO: tratamiento excepciones
        }
        
        return id;
    }
    
}