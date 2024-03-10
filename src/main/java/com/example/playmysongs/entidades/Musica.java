package com.example.playmysongs.entidades;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

public class Musica {
    private String nomeMusica;
    private String estiloMusica;
    private String nomeCantor;

    public Musica(String nomeMusica, String estiloMusica, String nomeCantor) throws ServletException, IOException {
        this.nomeMusica = nomeMusica;
        this.estiloMusica = estiloMusica;
        this.nomeCantor = nomeCantor;
    }

    public String nomeArquivo() {
        return nomeMusica.replace(" ", "-") + "_" + estiloMusica.replace(" ", "-") + "_" + nomeCantor.replace(" ", "-") + ".mp3";
    }

    public String nomeDiretorio() {
        return "musicas/" + nomeMusica.replace(" ", "-") + "_" + estiloMusica.replace(" ", "-") + "_" + nomeCantor.replace(" ", "-") + ".mp3";
    }

    public String getNomeMusica() {
        return nomeMusica;
    }

    public void setNomeMusica(String nomeMusica) {
        this.nomeMusica = nomeMusica;
    }

    public String getEstiloMusica() {
        return estiloMusica;
    }

    public void setEstiloMusica(String estiloMusica) {
        this.estiloMusica = estiloMusica;
    }

    public String getNomeCantor() {
        return nomeCantor;
    }

    public void setNomeCantor(String nomeCantor) {
        this.nomeCantor = nomeCantor;
    }
}
