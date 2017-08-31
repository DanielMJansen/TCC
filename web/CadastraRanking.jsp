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
            <a class="mdl-navigation__link" href="Inicio.jsp">Inicio</a>
            <a class="mdl-navigation__link" href="labirinto.html">Fase 1</a>
            <a class="mdl-navigation__link" href="labirinto2.html">Fase 2</a>
            <a class="mdl-navigation__link" href="Cadastra.jsp">Cadastra</a>
        </nav>
    </div>
    <main class="mdl-layout__content">
        <div class="page-content">
                <form name="form_registro" action="CadastroPontuacao" method="post" class="col s12" style="
                      width: 500px;
                      ">
                    <div class="mdl-textfield mdl-js-textfield">
                        <input class="mdl-textfield__input" type="text" id="nick_user" name="nick">
                        <label class="mdl-textfield__label" for="sample1">nick</label>
                    </div>
                    <div class="mdl-textfield mdl-js-textfield">
                        <input class="mdl-textfield__input" type="text" id="pontuacao_user" name="pontuacao">
                        <label class="mdl-textfield__label" for="sample1">pontuacao</label>
                    </div>
                    <div class="mdl-textfield mdl-js-textfield">
                        <input class="mdl-textfield__input" type="text" id="tempo_user" name="tempo">
                        <label class="mdl-textfield__label" for="sample1">tempo</label>
                    </div>
                    <button type="submit" class="mdl-button mdl-js-button mdl-button--raised" style="
                            margin-top: 50px;
                            margin-left: 200px;"
                            >
                        Cadastrar
                    </button>
                </form>
        </div>
    </main>