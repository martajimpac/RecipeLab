/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Datos;

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


/**
 *
 * @author marta
 */
public class SeguidorDeDB {
    
    public static int obtieneNumeroSeguidores(String emailUsuario) {
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement preparedStatement;
        ResultSet resultSet;
        int num = 0;

        String query = "SELECT COUNT(*) FROM seguidorde WHERE email = ?";
        
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, emailUsuario);
            resultSet = preparedStatement.executeQuery();
            
            if(resultSet.next()) { 
                num = resultSet.getInt(1);
            }
            
            resultSet.close();
            preparedStatement.close();
            pool.freeConnection(connection);
            
        } catch (SQLException ex) {
            System.err.println(ex.toString());
        }
        return num;
    }
    
    public static int obtieneNumeroSeguidos(String emailUsuario) {
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement preparedStatement;
        ResultSet resultSet;
        int num = 0;

        String query = "SELECT COUNT(*) FROM seguidorde WHERE emailusuario = ?";
        
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, emailUsuario);
            resultSet = preparedStatement.executeQuery();
            
            if(resultSet.next()) {
                num = resultSet.getInt(1);
            }
            
            resultSet.close();
            preparedStatement.close();
            pool.freeConnection(connection);
            
        } catch (SQLException ex) {
            System.err.println(ex.toString());
        }
        return num;
    }
    
    public static ArrayList<String> obtieneSeguidos(String emailUsuario) {
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement preparedStatement;
        ResultSet resultSet;
        ArrayList<String> emailSeguidos = new ArrayList<>();

        String query = "SELECT email FROM seguidorde WHERE emailusuario = ?";
        
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, emailUsuario);
            resultSet = preparedStatement.executeQuery();
            
            while(resultSet.next()) { 
                String emailSeguido = resultSet.getString("email");
                emailSeguidos.add(emailSeguido);
            }
            
            resultSet.close();
            preparedStatement.close();
            pool.freeConnection(connection);
            
        } catch (SQLException ex) {
            System.err.println(ex.toString());
        }
        return emailSeguidos;
    }
    
    public static boolean verSiLeSigo(String miEmail, String emailUsuario) {
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement preparedStatement;
        ResultSet resultSet;

        String query = "SELECT * FROM seguidorde WHERE emailusuario = ? AND email = ?";
        
        boolean seguido = false;
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, miEmail);
            preparedStatement.setString(2, emailUsuario);
            resultSet = preparedStatement.executeQuery();
            
            if(resultSet.next()) { //todo aqui deberia encontrar dos seguidores para el usuario 1
                seguido = true;
            }
            
            resultSet.close();
            preparedStatement.close();
            pool.freeConnection(connection);
            
        } catch (SQLException ex) {
            System.err.println(ex.toString());
        }
        return seguido;
    }
    
    public static boolean seguir(String miEmail, String emailUsuario) {
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement preparedStatement;

        String query = "INSERT INTO seguidorde(email, emailusuario) VALUES (?, ?)";
        
        boolean seguido = false;
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, emailUsuario);
            preparedStatement.setString(2, miEmail);
            preparedStatement.executeUpdate();
            
            preparedStatement.close();
            pool.freeConnection(connection); 
        } catch (SQLException ex) {
            System.err.println(ex.toString());
        }
        return seguido;
    }
    
    public static boolean dejarDeSeguir(String miEmail, String emailUsuario) {
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement preparedStatement;

        String query = "DELETE FROM seguidorde WHERE emailusuario = ? AND email = ?";
        
        boolean seguido = false;
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, miEmail);
            preparedStatement.setString(2, emailUsuario);
            preparedStatement.executeUpdate();
            preparedStatement.close();
            pool.freeConnection(connection); 
        } catch (SQLException ex) {
            System.err.println(ex.toString());
        }
        return seguido;
    }
    
}