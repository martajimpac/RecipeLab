/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Datos;

import Modelo.PasosReceta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author juani
 */
public class PasoRecetaDB {

    public static void insertaPasos(List<PasosReceta> pasos) {
       
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement preparedStatement;
        
        String insert = "INSERT INTO pasosReceta VALUES (?, ?, ?)";
        int id = pasos.get(0).getIdReceta();
                
         try {
            preparedStatement = connection.prepareStatement(insert);
            preparedStatement.setInt(1,id);
            for(int i = 0; i < pasos.size(); i++){
                PasosReceta paso = pasos.get(i);
                preparedStatement.setInt(2,paso.getNumeroPaso());
                preparedStatement.setString(3,paso.getDescripcion());
                preparedStatement.executeUpdate();
            }
            
            
            

        } catch (SQLException ex) {
            Logger.getLogger(PasoRecetaDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static List<PasosReceta> getPasosByIdReceta(int idReceta){
        
        List<PasosReceta> pasos = new ArrayList<>();
        
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement preparedStatement;
        ResultSet result;
        
        String query = "SELECT * FROM pasosreceta WHERE idReceta = ?";
        
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, idReceta);
            result = preparedStatement.executeQuery();
            while(result.next()){
  
                String descripcion = result.getString("descripcion");
                int numeroPaso = result.getInt("numeroPaso");
                
                PasosReceta paso = new PasosReceta(idReceta,numeroPaso,descripcion);
                pasos.add(paso);
            }
        } catch (SQLException e) {
            //TODO: tratamiento excepciones
        }
        return pasos;
    }
    
}
