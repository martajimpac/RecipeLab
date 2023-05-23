/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Datos;

import Modelo.RolUsuario;
import Modelo.Usuario;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.rowset.serial.SerialBlob;

/**
 * @author marta
 */
public class UsuarioDB {

    public static ArrayList<Usuario> buscaUsuarios(String nombreUsuario) {
        
        //Obtener conexion a la base de datos
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();

        
        //vamos a buscar los usuarios cuyo nombre contenga la cadena introducida
        String query = "SELECT * FROM usuario u WHERE u.nombreUsuario LIKE ?";
        
        try {
            ArrayList<Usuario> lista = new ArrayList<>();
     
            //crear la consulta dinamica
            PreparedStatement statement = connection.prepareStatement(query);
         
            //añadir las variables a la query
            statement.setString(1,"%"+nombreUsuario+"%");
            
            //ejecutar la query
            ResultSet result = statement.executeQuery();
            while(result.next()){
                Usuario user = new Usuario();
                user.setNombreUsuario(result.getString("NOMBREUSUARIO"));
                user.setContraseña(result.getString("CONTRASEÑA"));
                user.setEmail(result.getString("EMAIL"));
                RolUsuario rol = RolUsuario.valueOf(result.getString("ROLUSUARIO"));
                user.setRolUsuario(rol);
                boolean esPrivado = result.getBoolean("ESPRIVADO");
                user.setEsPrivado(esPrivado);
                user.setAvatar(result.getBytes("AVATAR"));
                user.setValoracion(result.getDouble("VALORACION")); 
                lista.add(0,user);       
            }
            return lista;
        } catch (Exception e) {
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
                RolUsuario rol = RolUsuario.valueOf(resultSet.getString("ROLUSUARIO"));
                usuario.setRolUsuario(rol);
                usuario.setEsPrivado(resultSet.getBoolean("esPrivado"));
                usuario.setValoracion(resultSet.getDouble("valoracion"));
                usuario.setAvatar(resultSet.getBytes("AVATAR"));
                usuario.setCodigoRecuperacion(resultSet.getString("codigoRecuperacion"));
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

    public static void insertaUsuario(Usuario usuario) {
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement preparedStatement;
        
        String query = "INSERT INTO usuario(nombreUsuario, contraseña, email, rolUsuario) VALUES (?, ?, ?, ?)";
        
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, usuario.getNombreUsuario());
            preparedStatement.setString(2, usuario.getContraseña());
            preparedStatement.setString(3, usuario.getEmail());
            preparedStatement.setString(4, usuario.getRolUsuario().name());
            //preparedStatement.setBlob(10,new SerialBlob(usuario.getAvatar()));
            preparedStatement.executeUpdate();
            
            preparedStatement.close();
            pool.freeConnection(connection);
        } catch (SQLException ex) {
            System.err.println(ex.toString());
        }                
    }
    
    public static void modificaUsuario(Usuario usuario) { 
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement preparedStatement;
        String update = "UPDATE usuario SET nombreusuario = ?, avatar = ? WHERE email = ?";
        
        try {
            preparedStatement = connection.prepareStatement(update);
            preparedStatement.setString(1,usuario.getNombreUsuario());
            preparedStatement.setBlob(2,new SerialBlob(usuario.getAvatar()));
            preparedStatement.setString(3,usuario.getEmail());
            
            preparedStatement.executeUpdate(); 
        } catch (SQLException ex) {
            Logger.getLogger(RecetaDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 
    
    public static void modificaContraseña(Usuario usuario) { 
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement preparedStatement;
        String update = "UPDATE usuario SET contraseña = ? WHERE email = ?";
        
        try {
            preparedStatement = connection.prepareStatement(update);
            preparedStatement.setString(1,usuario.getContraseña());
            preparedStatement.setString(2,usuario.getEmail());
            
            preparedStatement.executeUpdate(); 
            
            preparedStatement.close();
        } catch (SQLException ex) {
            Logger.getLogger(RecetaDB.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        pool.freeConnection(connection);
    } 
    
    public static String generaCodigoRecuperacionConstrasena(String email) {
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement preparedStatement;
        String update = "UPDATE usuario SET codigoRecuperacion = ? WHERE email = ?";
        String codigoRecuperacion = String.valueOf((int) (Math.random() * 1000000));
        
        try {
            preparedStatement = connection.prepareStatement(update);
            preparedStatement.setString(1, codigoRecuperacion);
            preparedStatement.setString(2,email);
            
            preparedStatement.executeUpdate();     
            
            preparedStatement.close();
        } catch (SQLException ex) {
            System.err.println(ex.toString());
        }
        
        pool.freeConnection(connection);
        
        return codigoRecuperacion;
    }
    
    public static boolean validaCodigo(String email, String codigo) {
        Conexion pool = Conexion.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement preparedStatement;
        String update = "UPDATE usuario SET codigoRecuperacion = null WHERE email = ?";
        
        Usuario usuario = UsuarioDB.obtieneUsuario(email);
        String codigoRecuperacion = "";
        
        if (usuario != null) {
            codigoRecuperacion = usuario.getCodigoRecuperacion();
            try {
                preparedStatement = connection.prepareStatement(update);
                preparedStatement.setString(1, email);
                preparedStatement.executeUpdate();
                
                preparedStatement.close();
            } catch (SQLException ex) {
                System.err.println(ex.toString());
            }
        }
        
        pool.freeConnection(connection);
        
        return  codigoRecuperacion != null && codigo != null
                && !codigoRecuperacion.isEmpty() && !codigoRecuperacion.isBlank()
                && codigoRecuperacion.equals(codigo); 
    }
}
