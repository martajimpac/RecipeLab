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
import java.util.List;

/**
 *
 * @author juani
 */
public class DetallesListaDB {
    
    public static List<Receta> getRecetasPorLista(String nombreLista) {

        //Obtener conexion a la base de datos
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        
        //vamos a buscar los usuarios cuyo nombre contenga la cadena introducida
        String query = "SELECT idReceta FROM detalleslista r WHERE r.nombreLista = ?";
        
        PreparedStatement preparedStatement;
        ResultSet result;
        ArrayList<Integer> idsRecetas = new ArrayList<>();
        
        try {
            
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, nombreLista);
            result = preparedStatement.executeQuery();
            while(result.next()){
                idsRecetas.add(result.getInt("idReceta"));
            } 
  
        } catch (SQLException e) {
            //TODO: tratamiento excepciones
        }
        
        ArrayList<Receta> recetas = new ArrayList<>();
        
        for (Integer i : idsRecetas) {
            recetas.add(RecetaDB.buscaRecetaPorId(i));
        }
        
        return recetas;
    }
    
}
