/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Datos;

import Modelo.PasosReceta;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author juani
 */
public class PasoRecetaDB {

    static void insertaPasos(List<PasosReceta> pasos) {
       
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
    
}
