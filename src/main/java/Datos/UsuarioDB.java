/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Datos;

import Modelo.Usuario;
import Modelo.RolUsuario;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 * @author marta
 */
public class UsuarioDB {

    public static ArrayList<Usuario> buscaUsuarios() {
        
        //Obtener conexion a la base de datos
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        
        //String query = "SELECT * FROM usuario WHERE nombreUsuario = ?";
        String query = "SELECT * FROM USUARIO";
        
        try {
            ArrayList<Usuario> lista = new ArrayList<>();
            
            /*
            //crear la consulta dinamica
            PreparedStatement statement = connection.prepareStatement(query);
         
            //añadir las variables a la query
            statement.setString(1, "usuario1");
            
            //ejecutar la query
            ResultSet result = statement.executeQuery(query);
            */
            Statement statement = connection.createStatement();
            ResultSet result = statement.executeQuery(query);
            System.out.println("todo fue bien!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
           
            
            while(result.next()){
                System.out.println("Tenemos un resultado");
                Usuario user = new Usuario();
                user.setNombreUsuario(result.getString("NOMBREUSUARIO"));
                user.setContraseña(result.getString("CONTRASEÑA"));
                user.setEmail(result.getString("EMAIL"));
                RolUsuario rol = RolUsuario.valueOf(result.getString("ROLUSUARIO"));
                user.setRolUsuario(rol);
                //user.setNombreUsuario(result.getString("NOMBREUSUARIO")); todo imagen
                user.setEsPrivado(result.getBoolean("ESPRIVADO"));
                user.setValoracion(result.getDouble("VALORACION"));
    
                
                lista.add(0,user);
            }
            
            return lista;
        } catch (SQLException e) {
            return null;
        }
    }
    
    public static Usuario obtieneUsuario(String email) {
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement preparedStatement;
        ResultSet resultSet;
        
        Usuario usuario = null;
        String query = "SELECT * FROM usuario WHERE email = ?";
        
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, email);
            resultSet = preparedStatement.executeQuery();
            
            if(resultSet.next()) {
                usuario = new Usuario();
                usuario.setNombreUsuario(resultSet.getString("nombreUsuario"));
                usuario.setContraseña(resultSet.getString("contraseña"));
                usuario.setEmail(resultSet.getString("email"));
                usuario.asignarRol(resultSet.getString("rolUsuario"));
                usuario.setAvatar(resultSet.getBytes("avatar"));
                usuario.setEsPrivado(resultSet.getBoolean("esPrivado"));
                usuario.setValoracion(resultSet.getDouble("valoracion"));
            }
            
            resultSet.close();
            preparedStatement.close();
            pool.freeConnection(connection);
            
        } catch (SQLException ex) {
            System.err.println(ex.toString());
        }
        return usuario;
    }

    public static boolean validaContrasena(Usuario usuario, String contrasena){
        return usuario.getContraseña().equals(contrasena);
    }
}
