
package Persistencia;

import Modelo.Jogador;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class JogadorDAO {
        public ArrayList<Jogador> CarregaJogador() throws SQLException {
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Principal", "root", "alunoifc");
        String query = "select nick, pontuacao, tempo from ranking";
        PreparedStatement ps = conn.prepareStatement(query);
        ResultSet rs = ps.executeQuery();
        ArrayList<Jogador> jogadores = new ArrayList();
        Jogador jogador;
        while (rs.next()) {
            jogador = new Jogador();
            jogador.setNick(rs.getString(1));
            jogador.setPontuacao(rs.getString(2));
            jogador.setTempo(rs.getString(3));
            jogadores.add(jogador);
        }
        return jogadores;
    }
        
        public void CadastraJogador(String nick, String pontuacao, String tempo) throws SQLException {
        DriverManager.registerDriver(new com.mysql.jdbc.Driver());
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Principal", "root", "alunoifc");
        String query = "insert into ranking(nick, pontuacao, tempo) values(?,?,?);";
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, nick);
        ps.setString(2, pontuacao);
        ps.setString(3, tempo);
        ps.execute(); 
    }
        
        
}
