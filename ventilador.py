class Ventilador:
    def __init__(self, modelo, tipo, precio):
        self.modelo = modelo
        self.tipo = tipo
        self.precio = precio

    def detalles(self):
        return f"Modelo: {self.modelo}, Tipo: {self.tipo}, Precio: ${self.precio}"

    def aplicar_descuento(self, porcentaje):
        self.precio -= self.precio * (porcentaje / 100)


class OrdenProduccion:
    def __init__(self, ventilador, cantidad):
        self.ventilador = ventilador
        self.cantidad = cantidad
        self.estado = "En proceso"

    def completar_orden(self):
        self.estado = "Completado"

    def detalles_orden(self):
        return f"Orden de {self.cantidad} {self.ventilador.modelo} - Estado: {self.estado}"


class Cliente:
    def __init__(self, nombre, direccion, telefono):
        self.nombre = nombre
        self.direccion = direccion
        self.telefono = telefono

    def detalles_cliente(self):
        return f"Cliente: {self.nombre}, Dirección: {self.direccion}, Teléfono: {self.telefono}"


class Factura:
    def __init__(self, cliente, orden):
        self.cliente = cliente
        self.orden = orden
        self.total = orden.ventilador.precio * orden.cantidad

    def detalles_factura(self):
        return f"Factura para {self.cliente.nombre} por {self.orden.cantidad} ventiladores {self.orden.ventilador.modelo}. Total: ${self.total}"


class Empresa:
    def __init__(self, nombre, ubicacion):
        self.nombre = nombre
        self.ubicacion = ubicacion
        self.inventario = []

    def agregar_inventario(self, ventilador):
        self.inventario.append(ventilador)

    def mostrar_inventario(self):
        return "Inventario:\n" + "\n".join([v.detalles() for v in self.inventario])


# Creación de instancias y ejecución de métodos

empresa = Empresa("Ventiladores XYZ", "Madrid")
ventilador1 = Ventilador("VX100", "Pared", 75.00)
ventilador2 = Ventilador("VX200", "Techo", 120.00)

empresa.agregar_inventario(ventilador1)
empresa.agregar_inventario(ventilador2)

cliente = Cliente("Juan Pérez", "Calle Falsa 123", "555-1234")
orden = OrdenProduccion(ventilador1, 10)
orden.completar_orden()

factura = Factura(cliente, orden)

print(empresa.mostrar_inventario())
print(cliente.detalles_cliente())
print(orden.detalles_orden())
print(factura.detalles_factura())


"""
EJERCICIO:

  - Crea una nueva clase llamada "VentiladorInteligente" que herede de la clase "Ventilador".
  - Añade una propiedad adicional en "VentiladorInteligente" llamada "conectividadWifi" y asegúrate de inicializarla en el constructor.
  - Crea una instancia de "VentiladorInteligente" en el código principal y agrega este nuevo ventilador al inventario de la empresa.
  - Usa los métodos existentes para mostrar el inventario actualizado que incluya este ventilador inteligente.
"""
