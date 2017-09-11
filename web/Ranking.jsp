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
            <a class="mdl-navigation__link" href="Inicio.jsp">Inicio</a>
            <a class="mdl-navigation__link" href="labirinto.html">Fase 1</a>
            <a class="mdl-navigation__link" href="labirinto2.html">Fase 2</a>
            <a class="mdl-navigation__link" href="Cadastra.jsp">Cadastra</a>
        </nav>
    </div>
    <main class="mdl-layout__content">
        <div class="page-content">
            <table class="mdl-data-table mdl-js-data-table mdl-shadow--2dp">
                <thead>
                    <tr>
                        <th class="mdl-data-table__cell--non-numeric">Nick</th>
                        <th>Pontua��o</th>
                        <th>Tempo</th>
                    </tr>
                </thead>
                <tbody>
                    <%for(Jogador jogador : new JogadorDAO().CarregaJogador()){%>
                    <tr>
                        <td class="mdl-data-table__cell--non-numeric"><%=jogador.getNick()%></td>
                        <td><%=jogador.getPontuacao()%></td>
                        <td><%=jogador.getTempo()%></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </main>
</div>