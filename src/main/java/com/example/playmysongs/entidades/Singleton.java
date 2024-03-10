package com.example.playmysongs.entidades;

import java.util.ArrayList;
import java.util.List;

public class Singleton {
    public static List<Musica> musicas = new ArrayList<>();
    public static void adicionarMusica(Musica musica) {
        musicas.add(musica);
    }
}
