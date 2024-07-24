document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('terrarioForm');
    const agregarSerpienteBtn = document.getElementById('agregarSerpiente');
    const listaSerpientes = document.getElementById('listaSerpientes');

    let serpientes = [];

    agregarSerpienteBtn.addEventListener('click', function () {
        const nombreSerpiente = document.getElementById('nombreSerpiente').value;
        const longitudSerpiente = document.getElementById('longitudSerpiente').value;
        const especieSerpiente = document.getElementById('especieSerpiente').value;

        if (nombreSerpiente && longitudSerpiente && especieSerpiente) {
            const serpiente = {
                nombre: nombreSerpiente,
                longitud: parseFloat(longitudSerpiente),
                especie: especieSerpiente
            };

            serpientes.push(serpiente);

            const li = document.createElement('li');
            li.textContent = `${nombreSerpiente} - ${longitudSerpiente} metros - ${especieSerpiente}`;
            listaSerpientes.appendChild(li);

            document.getElementById('nombreSerpiente').value = '';
            document.getElementById('longitudSerpiente').value = '';
            document.getElementById('especieSerpiente').value = '';
        } else {
            alert("Todos los campos de la serpiente son obligatorios.");
        }
    });

    form.addEventListener('submit', function (e) {
        e.preventDefault();

        const nombreTerrario = document.getElementById('nombreTerrario').value;
        const anchoTerrario = parseFloat(document.getElementById('anchoTerrario').value);
        const largoTerrario = parseFloat(document.getElementById('largoTerrario').value);

        if (nombreTerrario && !isNaN(anchoTerrario) && !isNaN(largoTerrario) && serpientes.length > 0) {
            const terrario = {
                nombreTerrario: nombreTerrario,
                anchoTerrario: anchoTerrario,
                largoTerrario: largoTerrario,
                serpientes: serpientes
            };

            fetch('/guardar', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(terrario)
            })
            .then(response => {
                if (!response.ok) {
                    return response.json().then(err => { throw err; });
                }
                return response.json();
            })
            .then(data => {
                alert(data.message);
                form.reset();
                listaSerpientes.innerHTML = '';
                serpientes = [];
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Ocurrió un error al guardar el terrario.');
            });
        } else {
            alert("Todos los campos del terrario y al menos una serpiente son obligatorios.");
        }
    });
});
