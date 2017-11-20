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
                <a class="mdl-navigation__link" href="labirinto3.jsp">Fase 3</a>
                <a class="mdl-navigation__link" href="labirinto4.jsp">Fase 4</a>
                <a class="mdl-navigation__link" href="labirinto5.jsp">Fase 5</a>
                <a class="mdl-navigation__link" href="faq.jsp">FAQ</a>
                <form action="Deslogar" method="post">
                    <a class="mdl-navigation__link" href="javascript:;" onclick="parentNode.submit();">Deslogar</a>
                </form>
                <%}%>
            </nav>
    </div>
        <head>
        <meta http-equiv="content-type" content="text/html;charset=utf-8" />
        <meta name="generator" content="Geany 1.27" />
        <meta name="viewport" content="width=device-width,initial-scale=1" />
        <title>Fase 1</title>
        <link rel="stylesheet" type="text/css" href="labirinto2.css" />
    </head>
    <header>
    <body>
        <div id="posicao" >eeee</div>
        <div id="posicaoy" >eee</div>
        <div class="flutua">Tempo:<br/><span id=tempo class=letragrande>10:00</span></div>
        <div class="flutua">Pontuacao:<br/><span id=pontuacao class=letragrande>3000</span></div>
         <script src="jquery-3.2.1.min.js"></script>
        <canvas width="150" height="150" align = center style="border: solid;">
            <script src="fase1.jsp"></script>
    </body>
</html>
