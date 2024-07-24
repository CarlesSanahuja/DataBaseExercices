class Habitante:
    def __init__(self, nombre):
        self.nombre = nombre

class Serpiente(Habitante):
    def __init__(self, nombre, longitud, especie):
        self.nombre = nombre
        self.longitud = longitud
        self.especie = especie

    def __str__(self):
        return f"{self.nombre} longitud: {self.longitud} especie:{self.especie}"
    def deslizarse(self):
        print(f"La serpiente {self.nombre} de la especie {self.especie} se está deslizando.")


class Terrarrio:
    def __init__(self, nombre,ancho,largo):
        self.nombre = nombre
        self.ancho = ancho
        self.largo = largo
        self.habitantes = []

    def agregar_habitante(self, serpiente):
        self.habitantes.append(serpiente)

    def area(self):
        return self.ancho * self.largo
    def mostrar_serpientes(self):
        for habitante in self.habitantes:
            if isinstance(habitante, Serpiente):
                print(f"Nombre: {habitante.nombre}, Longitud: {habitante.longitud} metros, Especie: {habitante.especie}")
    
# Creación de objetos

serpiente1 = Serpiente("Serpiente 1", 10, "Espinoso")
serpiente2 = Serpiente("Serpiente 2", 8, "Espinoso")
serpiente3 = Serpiente("Serpiente 3", 12, "Espinoso")

terrario = Terrarrio("Terrario 1", 50, 30)

# Agregar serpientes al terrario
terrario.agregar_habitante(serpiente1)

terrario.agregar_habitante(serpiente2)

terrario.agregar_habitante(serpiente3)

# Mostrar información del terrario
print(f"area: {terrario.area()}")

# Deslizar serpiente1

serpiente1.deslizarse()

# Mostrar información de las serpientes que contine el terrario

terrario.mostrar_serpientes()