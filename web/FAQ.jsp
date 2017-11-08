<%@page import="Persistencia.JogadorDAO"%>
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
                <a class="mdl-navigation__link" href="faq.jsp">FAQ</a>
                <%} else {%>
                <a class="mdl-navigation__link" href="Inicio.jsp">Inicio</a>
                <a class="mdl-navigation__link" href="Ranking.jsp">Ranking</a>
                <a class="mdl-navigation__link" href="labirinto.jsp">Fase 1</a>
                <a class="mdl-navigation__link" href="labirinto2.jsp">Fase 2</a>
                <a class="mdl-navigation__link" href="faq.html">FAQ</a>
                <form action="Deslogar" method="post">
                    <a class="mdl-navigation__link" href="javascript:;" onclick="parentNode.submit();">Deslogar</a>
                </form>
                <%}%>
            </nav>
    </div>

    <main class="mdl-layout__content">

        <style>h1{
                font-size:30px;
            }
        </style>
        <style>p{
                font-size:20px;
            }
        </style>
        <div class="page-content">
            <h1 align="center">Sobre o Jogo</h1>
            <p align="center">E um jogo de labirinto, com um total de 5 fases, cada uma com sua propria dificuldade, contendo cadastro/login e ranking para o usuario jogante.</p>
            <h1 align="center">Como jogar?</h1>
            <p align="center">Para jogar e simples, basta mover-se usando as setas do teclado, tentando achar o fim do labirinto.</p>
            <h1 align="center">Como funciona o Ranking?</h1>
            <p align="center">O metodo de pontuacao funciona conforme o tempo usado pelo jogador para achar a sa�da do labirinto, quanto menos tempo, maior a pontuacao.</p>
        </div>
    </main>