document.addEventListener("DOMContentLoaded", function() {
    const form = document.querySelector('form');

    form.addEventListener('submit', function(event) {
        const nomeMusicaInput = document.getElementById('nomeMusica');
        const nomeCantorInput = document.getElementById('nomeCantor');
        const fileInput = document.getElementById('file');

        if (!validarCaracteres(nomeMusicaInput.value) || !validarCaracteres(nomeCantorInput.value)) {
            alert('Os campos de texto só podem conter letras, números, espaços, underscores (_) e hífens (-).');
            event.preventDefault();
        }

        if (fileInput.files.length === 0) {
            alert('Por favor, selecione um arquivo antes de enviar.');
            event.preventDefault();
        }
    });

    function validarCaracteres(texto) {
        const regex = /^[a-zA-Z0-9\s_-]+$/;
        return regex.test(texto);
    }
});
