/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Datos;

import Modelo.Comentario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author juani
 */
public class ComentarioDB {
    
    public static void insertaComentario(Comentario comentario){
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement preparedStatement;
        //('1', 'usuario1@example.com', 'Tarta de manzana', 8, 'media', 3600, 4, true, 12.50, LOAD_FILE('C:\Users\juani\Desktop\UNI\3ano\SSW\RecipeLab\src\main\webapp\images\ejemplo-receta-1'), 'postre')
        String insert = "INSERT INTO comentario VALUES(?,?,?,?,?,?,?)";
        
        try {
            preparedStatement = connection.prepareStatement(insert);
            
            preparedStatement.setString(1,comentario.getEmailUsuario());
            preparedStatement.setInt(2,comentario.getIdReceta());
            preparedStatement.setInt(3,comentario.getValoracion());
            preparedStatement.setString(4,comentario.getTexto());
            preparedStatement.setBoolean(5,comentario.isLeido());
            preparedStatement.setDate(6,new java.sql.Date(comentario.getFechaComentario().getTime()));
            preparedStatement.setString(7,comentario.getRespuesta());
            preparedStatement.executeUpdate();
            

        } catch (SQLException ex) {
            Logger.getLogger(RecetaDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public static List<Comentario> getComentariosByIdReceta(int idReceta){
        
        List<Comentario> comentarios = new ArrayList<>();
        
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement preparedStatement;
        ResultSet result;
        
        String query = "SELECT * FROM comentario WHERE idReceta = ?";
        
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idReceta);
            result = preparedStatement.executeQuery();
            while(result.next()){
  
                String email = result.getString("emailUsuario");
                String texto = result.getString("texto");
                int valoracion = result.getInt("valoracion");
                boolean leido = result.getBoolean("leido");
                Date fecha = result.getDate("fechaComentario");
                String respuesta = result.getString("respuesta");
                
                Comentario comentario = new Comentario(email,idReceta,valoracion,texto,leido,fecha,respuesta);
                comentarios.add(comentario);
            }
        } catch (SQLException e) {
            //TODO: tratamiento excepciones
        }
        return comentarios;
    }
}
