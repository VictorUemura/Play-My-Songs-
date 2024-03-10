package com.example.playmysongs.entidades;

import java.util.ArrayList;
import java.util.List;

public class Singleton {
    static List<Musica> musicas = new ArrayList<>();
    public static void adicionarMusica(Musica musica) {
        musicas.add(musica);
    }
}
