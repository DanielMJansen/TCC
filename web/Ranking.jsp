<%@page import="Persistencia.UsuarioDAO"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Controlador.Login"%>
<%@page import="Persistencia.JogadorDAO"%>
<%@page import="Modelo.Jogador"%>
<!-- Always shows a header, even in smaller screens. -->
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
    <header class="mdl-layout__header">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.green-pink.min.css">
        <script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
        <div class="mdl-layout__header-row">
            <span class="mdl-layout-title">Lab Game</span>
            <div class="mdl-layout-spacer"></div>
        </div>
    </header>
    <div class="mdl-layout__drawer">
        <span class="mdl-layout-title">Principal</span>
        <nav class="mdl-navigation">
            <nav class="mdl-navigation">
                <%
                    if (session.getAttribute("loginUsuario") == null) { %>
                <a class="mdl-navigation__link" href="Inicio.jsp">Inicio</a>
                <a class="mdl-navigation__link" href="CadastroUser.jsp">Cadastrar</a>
                <a class="mdl-navigation__link" href="Login.jsp">Logar</a>
                <a class="mdl-navigation__link" href="Ranking.jsp">Ranking</a>
          
                <a href="Ranking.jsp"></a>
                <%} else {%>
                <a class="mdl-navigation__link" href="Inicio.jsp">Inicio</a>
                <a class="mdl-navigation__link" href="Ranking.jsp">Ranking</a>
                <a class="mdl-navigation__link" href="labirinto.jsp">Fase 1</a>
                <a class="mdl-navigation__link" href="labirinto2.jsp">Fase 2</a>
                <a class="mdl-navigation__link" href="labirinto3.jsp">Fase 3</a>
                <a class="mdl-navigation__link" href="labirinto4.jsp">Fase 4</a>
                <a class="mdl-navigation__link" href="labirinto5.jsp">Fase 5</a>
                <form action="Deslogar" method="post">
                    <a class="mdl-navigation__link" href="javascript:;" onclick="parentNode.submit();">Deslogar</a>
                </form>
                <%}%>
            </nav>
    </div>
    <main class="mdl-layout__content">
        <div class="page-content">
            <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
                <thead>
                    <tr>


                        <%
                            if (session.getAttribute("adminlogado") != null) {
                        %>
                <form action="DeletaRanking" method ="ProcessRequest">
                    <input type="submit" value = "Deletar Ranking">
                </form>
                
                <%}%>

                <th class="mdl-data-table__cell--non-numeric">Nick</th>
                <th>Pontuação</th>
                <th>Tempo</th>
                <th>Fase</th>
                </tr>
                </thead>
                <tbody>
                    <%for (Jogador jogador : new JogadorDAO().CarregaJogador()) {%>
                    <tr>
                        <td class="mdl-data-table__cell--non-numeric"><%=jogador.getNick()%></td>
                        <td><%=jogador.getPontuacao()%></td>
                        <td><%=jogador.getTempo()%></td>
                        <td><%=jogador.getFase()%></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </main>
</div>