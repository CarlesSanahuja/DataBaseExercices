from flask import Flask, request, jsonify, render_template
import json

app = Flask(__name__)
class Habitante:
    def __init__(self, nombre):
        self.nombre = nombre

class Terrario:
    def __init__(self, nombre, ancho, largo):
        self.nombre = nombre
        self.ancho = ancho
        self.largo = largo
        self.habitantes = []

    def agregar_habitante(self, serpiente):
        self.habitantes.append(serpiente)

    def area(self):
        return self.ancho * self.largo

class Serpiente(Habitante):
    def __init__(self, nombre, longitud, especie):
        self.nombre = nombre
        self.longitud = longitud
        self.especie = especie

    def deslizarse(self):
        print(f"{self.nombre} se está deslizando")

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/guardar', methods=['POST'])
def guardar():
    try:
        data = request.json
        nombreTerrario = data['nombreTerrario']
        anchoTerrario = float(data['anchoTerrario'])
        largoTerrario = float(data['largoTerrario'])
        serpientes = data['serpientes']

        terrario = Terrario(nombreTerrario, anchoTerrario, largoTerrario)

        for serpiente in serpientes:
            nueva_serpiente = Serpiente(serpiente['nombre'], float(serpiente['longitud']), serpiente['especie'])
            terrario.agregar_habitante(nueva_serpiente)

        terrario_data = {
            'nombre': terrario.nombre,
            'ancho': terrario.ancho,
            'largo': terrario.largo,
            'area': terrario.area(),
            'habitantes': [{'nombre': s.nombre, 'longitud': s.longitud, 'especie': s.especie} for s in terrario.habitantes]
        }

        with open('terrario.json', 'w') as f:
            json.dump(terrario_data, f)

        return jsonify({'message': 'Terrario guardado con éxito'})
    except Exception as e:
        print(f"Error: {e}")
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
