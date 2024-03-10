document.addEventListener('DOMContentLoaded', function () {
    var inputMusica = document.getElementById('idMusica');
    inputMusica.addEventListener('input', function () {
        var filtro = inputMusica.value.toUpperCase();
        var linhasTabela = document.getElementsByTagName('tr');
        for (var i = 1; i < linhasTabela.length; i++) {
            var celulas = linhasTabela[i].getElementsByTagName('td');
            var corresponde = false;
            for (var j = 0; j < celulas.length; j++) {
                var celula = celulas[j];
                if (celula) {
                    var textoCelula = celula.textContent || celula.innerText;
                    if (textoCelula.toUpperCase().indexOf(filtro) > -1) {
                        corresponde = true;
                        break;
                    }
                }
            }
            if (corresponde) {
                linhasTabela[i].style.display = "";
            } else {
                linhasTabela[i].style.display = "none";
            }
        }
    });
});