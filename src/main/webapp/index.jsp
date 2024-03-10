<%@ page import="com.example.playmysongs.entidades.Musica" %>
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
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="assets/img/logo.png" alt="logo" height="70px"/>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <form class="d-flex ms-auto">
                <input class="form-control me-2" type="Login" placeholder="Login" aria-label="Login" id="login">
                <input class="form-control me-2" type="Senha" placeholder="Senha" aria-label="Senha" id="senha">
                <button class="btn btn-outline-success" type="submit">Login</button>
            </form>
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
            <input class="form-control me-2" type="text" placeholder="Informe a música" id="idMusica">
            <button class="btn btn-outline-success" type="submit">Busca</button>
        </form>
    </div>
    <div class="group">
        <table >
            <%
                for(Musica musica: Singleton.musicas){
            %>
            <audio controls>
                <source src="<%= musica.nomeDiretorio()%>" type="audio/mpeg">
            </audio>
            <p><%= musica.getNomeMusica()%></p>
            <%}%>
        </table>
    </div>

</div>
</body>
</html>