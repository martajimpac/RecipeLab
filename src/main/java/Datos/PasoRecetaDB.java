/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Datos;

<<<<<<< HEAD
import Modelo.DetallesReceta;
import Modelo.PasosReceta;
import Modelo.Receta;
=======
import Modelo.PasosReceta;
>>>>>>> a6178d8b24c5f550abaad2e1885a0e67db03a392
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

<<<<<<< HEAD
    static void insertaPasos(List<PasosReceta> pasos) {
=======
    public static void insertaPasos(List<PasosReceta> pasos) {
>>>>>>> a6178d8b24c5f550abaad2e1885a0e67db03a392
       
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
    
<<<<<<< HEAD
    
    public static ArrayList<PasosReceta> getPasosReceta(int id) {

        //Obtener conexion a la base de datos
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        
        //vamos a buscar los usuarios cuyo nombre contenga la cadena introducida
        String query = "SELECT * FROM pasosreceta p WHERE p.idReceta = ?";
        ArrayList<PasosReceta> pasosReceta = new ArrayList<>();
        
        
        try {
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1,id);
            ResultSet result  = statement.executeQuery();
        

            while(result.next()){
                int numeroPaso = result.getInt("numeropaso");
                String descripcion = result.getString("descripcion");
                PasosReceta paso = new PasosReceta(id,numeroPaso,descripcion);
                pasosReceta.add(paso);
            } 
  
        } catch (SQLException e) {
            //TODO: tratamiento excepciones
        }

        return pasosReceta;
=======
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
>>>>>>> a6178d8b24c5f550abaad2e1885a0e67db03a392
    }
    
}
