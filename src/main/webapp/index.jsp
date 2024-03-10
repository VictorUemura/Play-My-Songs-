<%@ page import="com.example.playmysongs.entidades.Musica" %>
<%@ page import="com.example.playmysongs.security.User" %>
<%@ page import="com.example.playmysongs.entidades.Singleton" %><%--
  Created by IntelliJ IDEA.
  User: luisf
  Date: 10/03/2024
  Time: 18:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>Tela inicial</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<!-- Login -->
<nav class="navbar navbar-expand-lg navbar-light bg-light" >
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="assets/img/logo.png" alt="logo" height="70px"/>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <% User usuario = (User)session.getAttribute("usuario"); %>
            <% if(usuario == null) {%>
            <form class="d-flex ms-auto" action="<%=request.getContextPath()%>/login-servlet" method="POST">
                <input class="form-control me-2" type="text" name="login" placeholder="Login">
                <input class="form-control me-2" type="password" name="senha" placeholder="Senha">
                <button class="btn btn-outline-success" type="submit">Login</button>
            </form>
            <%} else { %>
        </div>
    </div>
</nav>
<div>
    <!-- Cadastrar musica -->
    <div class="text-center my-4">
        <h1 >Play My Songs</h1>
        <a href="uploadscreen.html">Enviar musica</a>
    </div>
    <!-- tocar musica -->
    <div class="container-fluid">
        <form class="d-flex">
            <input class="form-control me-2" type="text" placeholder="Pesquise por nome da música/artista/gênero" id="idMusica">
        </form>
    </div>
    <div class="container">
        <div class="row justify-content-center">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col" style="width: 20%;">#</th>
                    <th scope="col" style="width: 20%;">Nome Musica</th>
                    <th scope="col" style="width: 20%;">Artista</th>
                    <th scope="col" style="width: 20%;">Gênero</th>
                    <th scope="col" style="width: 20%;">Musica</th>
                </tr>
                </thead>
                <tbody>
                <%
                    int i = 1;
                    for(Musica musica: Singleton.musicas){
                %>
                <tr>
                    <th scope="row"  style="vertical-align: middle;"><%= i++%></th>
                    <td style="vertical-align: middle;"><%= musica.getNomeMusica()%></td>
                    <td style="vertical-align: middle;"><%= musica.getNomeCantor()%></td>
                    <td style="vertical-align: middle;"><%= musica.getEstiloMusica()%></td>
                    <td style="vertical-align: middle;">
                        <audio controls>
                            <source src="<%= musica.nomeDiretorio()%>" type="audio/mpeg">
                        </audio>
                    </td>
                </tr>
                <%}%>
                </tbody>
            </table>
        </div>
    </div>
    <% } %>
</div>
<script src="script/buscaMusica.js"></script>
</body>
</html>