package Persistencia;

import Modelo.Usuario;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDAO {
    
    public static Connection retornaConn(){
        Connection conn = null;
        try{
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Principal", "root", "alunoifc");
        }catch(SQLException e){
            System.out.println("SQL erro.");
            e.printStackTrace();
        }
        return conn;
    }
    
    public static void insereUsuario(Usuario user) {
	try {
	    String query = "insert into usuario values(?,?)";
	    Connection conn = retornaConn();
	    PreparedStatement ps = conn.prepareStatement(query);
	    ps.setString(1, user.getLogin());
	    ps.setString(2, user.getSenha());
	    ps.execute();
	} catch (SQLException e) {
	    e.printStackTrace();
	}
    }

    public static boolean existeUsuario(Usuario user) {
	boolean ret = false;
	try {
	    String query = "select login, senha from usuario";
	    Connection conn = retornaConn();
	    PreparedStatement ps = conn.prepareStatement(query);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		if (rs.getString("login").equals(user.getLogin()) && rs.getString("senha").equals(user.getSenha())) {
		    ret = true;
		    break;
		}
	    }
	} catch (SQLException e) {
	    e.printStackTrace();
	}
	return ret;
    }
    
    public static boolean existeLogin(String user) {
	boolean ret = false;
	try {
	    String query = "select login from usuario";
	    Connection conn = retornaConn();
	    PreparedStatement ps = conn.prepareStatement(query);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		if (rs.getString("login").equals(user)) {
		    ret = true;
		    break;
		}
	    }
	} catch (SQLException e) {
	    e.printStackTrace();
	}
	return ret;
    }
}
