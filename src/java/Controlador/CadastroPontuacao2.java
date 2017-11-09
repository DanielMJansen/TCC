/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Jogador;
import Persistencia.JogadorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author informatica
 */
@WebServlet(name = "CadastroPontuacao", urlPatterns = {"/CadastroPontuacao"})
public class CadastroPontuacao2 extends HttpServlet {

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Jogador jogador = new Jogador();
        jogador.setNick((String) request.getParameter("nick"));
        jogador.setPontuacao((String) request.getParameter("pontuacao"));
        jogador.setTempo((String) request.getParameter("tempo"));
        
        JogadorDAO DAO = new JogadorDAO();
      try {
            DAO.CadastraRanking(jogador.getNick(), jogador.getPontuacao(), jogador.getTempo());
        } catch (SQLException ex) {
            ex.printStackTrace();
            
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("Ranking.jsp");
	rd.forward(request, response);
    }

    
}
