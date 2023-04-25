package Datos;

/**
 *
 * @author Marta
 */

import java.sql.*;
import javax.sql.DataSource;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class Conexion {
    private static Conexion pool = null;
    private static DataSource dataSource = null;
    
    private Conexion() {
        try {
            InitialContext ic = new InitialContext();
            dataSource = (DataSource) ic.lookup("java:/comp/env/jdbc/recipelab");  
        } catch(NamingException e) {
            System.err.println(e.toString());
        }
    }
    
    public static Conexion getInstance() {
        if (pool == null) {
            pool = new Conexion();
        }
            return pool;
    }
    
    public Connection getConnection() {
        try {
            return dataSource.getConnection();
        }catch (SQLException sqle) {
           System.err.println(sqle.toString());
            return null;
        }
    }
    
    public void freeConnection(Connection c) {
        try {
            c.close();
        }catch (SQLException sqle) {
            System.err.println(sqle.toString());
        }
    }
}

