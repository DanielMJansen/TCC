<%@page import="Modelo.Usuario"%>
<%@page import="Persistencia.UsuarioDAO"%>
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
        <span class="mdl-layout-title">Lab Game</span>
        <nav class="mdl-navigation">
            <nav class="mdl-navigation">
                <%
                    if (session.getAttribute("loginUsuario") == null) { %>
                <a class="mdl-navigation__link" href="Inicio.jsp">Inicio</a>
                <a class="mdl-navigation__link" href="CadastroUser.jsp">Cadastrar</a>
                <a class="mdl-navigation__link" href="Login.jsp">Logar</a>
                <a class="mdl-navigation__link" href="Ranking.jsp">Ranking</a>
                <a class="mdl-navigation__link" href="faq.html">FAQ</a>
                <%} else {%>
                <a class="mdl-navigation__link" href="Inicio.jsp">Inicio</a>
                <a class="mdl-navigation__link" href="Ranking.jsp">Ranking</a>
                <a class="mdl-navigation__link" href="labirinto.html">Fase 1</a>
                <a class="mdl-navigation__link" href="labirinto2.html">Fase 2</a>
                <a class="mdl-navigation__link" href="faq.html">FAQ</a>
                <a class="mdl-navigation__link" href="Deslogar.jsp">Deslogar</a>
                <%}%>
            </nav>
    </div>
    <h5 class="demo-crumbs mdl-color-text--grey-500" style="text-align: center;">
        Seja bem-vindo <% 
            Usuario u = new Usuario();
            out.println(UsuarioDAO.Nick(u.getNick()));%>!
    </h5>
    <h3 style="text-align: center;">Labirinto</h3>
    <h4 style="text-align: center;">
        Um jogo composto por 3 fases uma mais divertida do que a outra!
    </h4>
    <h4 style="text-align: center; ">
        N�o � cadastrado? <a href="CadastroUser.jsp">Fa�a seu cadastro!</a>
    </h4>
    <h4 style="text-align: center;">
        J� � cadastrado? <a href="Login.jsp">Fa�a login!</a>
        <main class="mdl-layout__content">
            <div class="page-content">

            </div>
        </main>
