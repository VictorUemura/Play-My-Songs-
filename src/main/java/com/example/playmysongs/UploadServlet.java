package com.example.playmysongs;

import java.io.*;

import com.example.playmysongs.entidades.Musica;
import com.example.playmysongs.entidades.Singleton;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@MultipartConfig(
        location = "/",
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 100,
        maxRequestSize = 1024 * 1024 * 10 * 10
)
@WebServlet(name = "uploadServlet", value = "/up-servlet")
public class UploadServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            Part filePart = request.getPart("file");
            Musica novaMusica = new Musica(request.getParameter("nomeMusica"), request.getParameter("genero"), request.getParameter("nomeCantor"));

            String fileName = filePart.getSubmittedFileName();
            File fpasta = new File(getServletContext().getRealPath("/") + "/musicas");
            fpasta.mkdir();

            try (OutputStream out = new FileOutputStream(new File(fpasta.getAbsolutePath() + "/" + novaMusica.nomeArquivo()));
                 InputStream filecontent = filePart.getInputStream();) {

                int read = 0;
                byte[] bytes = new byte[1024];
                while ((read = filecontent.read(bytes)) != -1) {
                    out.write(bytes, 0, read);
                }
                Singleton.adicionarMusica(novaMusica);
            } catch (IOException e) {
            }
            response.sendRedirect("index.jsp");
        } catch (Exception e) {

        }
    }
}