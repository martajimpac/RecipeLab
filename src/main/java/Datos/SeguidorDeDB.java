/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Datos;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author marta
 */
public class SeguidorDeDB {
    
    public static int obtieneSeguidores(String emailUsuario) {
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement preparedStatement;
        ResultSet resultSet;
        int num = 0;

        String query = "SELECT * FROM seguidorde WHERE email like ?";
        
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, emailUsuario);
            resultSet = preparedStatement.executeQuery();
            
            if(resultSet.next()) { //todo aqui deberia encontrar dos seguidores para el usuario 1
                num++;
            }
            
            resultSet.close();
            preparedStatement.close();
            pool.freeConnection(connection);
            
        } catch (SQLException ex) {
            System.err.println(ex.toString());
        }
        return num;
    }
    
    public static int obtieneSeguidos(String emailUsuario) {
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement preparedStatement;
        ResultSet resultSet;
        int num = 0;

        String query = "SELECT * FROM seguidorde WHERE emailusuario = ?";
        
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, emailUsuario);
            resultSet = preparedStatement.executeQuery();
            
            if(resultSet.next()) {
                num++;
            }
            
            resultSet.close();
            preparedStatement.close();
            pool.freeConnection(connection);
            
        } catch (SQLException ex) {
            System.err.println(ex.toString());
        }
        return num;
    }
    
}
