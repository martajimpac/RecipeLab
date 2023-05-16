/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Datos;

import Modelo.DetallesReceta;
import java.util.ArrayList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author marta
 */
public class DetallesRecetaDB {
    public static ArrayList<DetallesReceta> obtieneIngredientes(int id){
        
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement preparedStatement;
        ResultSet result;
        
        ArrayList<DetallesReceta> ingredientes = new ArrayList<>();
        String query = "SELECT * FROM detallesreceta WHERE idreceta = ?";
        
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            result = preparedStatement.executeQuery();
           
            while(result.next()){
                DetallesReceta i = new DetallesReceta();
                i.setIdReceta(result.getString("idreceta"));
                i.setNombreIngrediente(result.getString("nombreingrediente"));
                i.setCantidad(result.getString("cantidad"));
                i.setOpcionalidad(result.getBoolean("opcionalidad"));
                ingredientes.add(i);
            }
            connection.close();
        } catch (SQLException e) {
            return null;
        }
        return ingredientes; 
    }
}
