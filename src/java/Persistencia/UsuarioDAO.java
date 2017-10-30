package Persistencia;

import Modelo.Usuario;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
	    String query = "insert into usuario values(?,?,?)";
	    Connection conn = retornaConn();
	    PreparedStatement ps = conn.prepareStatement(query);
	    ps.setString(1, user.getLogin());
	    ps.setString(2, user.getSenha());
            ps.setString(3, user.getNomeExibicao());
	    ps.execute();
	} catch (SQLException e) {
	    System.out.println("Erro ao inserir um usuário no banco.");
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
    
        public static Usuario carregaUsuarioLogin(String login){
	Usuario ret = new Usuario();
	try {
	    String query = "select * from Usuario where login = ?";
	    Connection conn = retornaConn();
	    PreparedStatement ps = conn.prepareStatement(query);
	    ps.setString(1, login);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		ret.setNomeExibicao(rs.getString("nomeExibicao"));
		ret.setLogin(login);
		ret.setSenha(rs.getString("senha"));
	    }
	} catch (SQLException e) {
	    System.out.println("Erro ao verificar se existe o usuário no banco.");
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


//Criptografa senha no banco    
    public static String rehash(String str){
        try{
            MessageDigest m=MessageDigest.getInstance("MD5");
            m.update(str.getBytes(),0,str.length());
            return new BigInteger(1,m.digest()).toString(16);
        }catch(NoSuchAlgorithmException e){
	    e.printStackTrace();
        }
        return null;
    }

    //Nickname
    public static String nomeExibicaoNome(String str){
	String ret = "";
	try {
	    String query = "select nomeExibicao from usuario where login = ?";
	    DriverManager.registerDriver(new com.mysql.jdbc.Driver());
	    Connection conn = retornaConn();
	    PreparedStatement ps = conn.prepareStatement(query);
	    ps.setString(1, str);
	    ResultSet rs = ps.executeQuery();
	    while (rs.next()) {
		ret = rs.getString("nomeExibicao");
	    }
	} catch (SQLException e) {
	    System.out.println("Erro ao buscar nome no banco.");
	    e.printStackTrace();
	}
	return ret;
    }
}
