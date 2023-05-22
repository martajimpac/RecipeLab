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
import java.util.ArrayList;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
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
        
        String query = "INSERT INTO usuario(nombreUsuario, contraseña, email) VALUES (?, ?, ?)";
        
        try {
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, usuario.getNombreUsuario());
            preparedStatement.setString(2, usuario.getContraseña());
            preparedStatement.setString(3, usuario.getEmail());
            //preparedStatement.setBlob(10,new SerialBlob(usuario.getAvatar()));
            preparedStatement.executeUpdate();
            
            preparedStatement.close();
            pool.freeConnection(connection);
        } catch (SQLException ex) {
            System.err.println(ex.toString());
        }                
    }
    
    
    public static void modificaUsuario(String nombreUsuario, String contraseña, String emailUsuario,RolUsuario rol, Blob imagen) { 
        try {
            Conexion pool = Conexion.getInstance();
            Connection connection = pool.getConnection();
            PreparedStatement statement = null; 
            statement = connection.prepareStatement( 
                    "SELECT imagen FROM usuarioimg WHERE emailAddress=? ");
            statement.setString(1, email); 
            ResultSet result = statement.executeQuery(); 
            if (result.next()) { 
                Blob blob = result.getBlob("imagen"); 
                if (!result.wasNull() && blob.length() > 1) { 
                    InputStream imagen = blob.getBinaryStream(); 
                    byte[] buffer = new byte[1000]; 
                    int len = imagen.read(buffer); 
                    while (len != -1) {
                        respuesta.write(buffer, 0, len); 
                        len = imagen.read(buffer);
                    } 
                    imagen.close(); 
                } 
            } 
            pool.freeConnection(connection);
        } catch (Exception e) { 
            e.printStackTrace();
        } 
    } 
}
