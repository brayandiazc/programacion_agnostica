import Foundation

class Carro {
    var modelo: String
    var tipo: String
    var precio: Double

    init(modelo: String, tipo: String, precio: Double) {
        self.modelo = modelo
        self.tipo = tipo
        self.precio = precio
    }

    func detalles() -> String {
        return "Modelo: \(modelo), Tipo: \(tipo), Precio: $\(precio)"
    }

    func aplicarDescuento(porcentaje: Double) {
        precio -= precio * (porcentaje / 100)
    }
}

class OrdenProduccion {
    var carro: Carro
    var cantidad: Int
    var estado: String

    init(carro: Carro, cantidad: Int) {
        self.carro = carro
        self.cantidad = cantidad
        self.estado = "En proceso"
    }

    func completarOrden() {
        estado = "Completado"
    }

    func detallesOrden() -> String {
        return "Orden de \(cantidad) \(carro.modelo) - Estado: \(estado)"
    }
}

class Cliente {
    var nombre: String
    var direccion: String
    var telefono: String

    init(nombre: String, direccion: String, telefono: String) {
        self.nombre = nombre
        self.direccion = direccion
        self.telefono = telefono
    }

    func detallesCliente() -> String {
        return "Cliente: \(nombre), Dirección: \(direccion), Teléfono: \(telefono)"
    }
}

class Factura {
    var cliente: Cliente
    var orden: OrdenProduccion
    var total: Double

    init(cliente: Cliente, orden: OrdenProduccion) {
        self.cliente = cliente
        self.orden = orden
        self.total = orden.carro.precio * Double(orden.cantidad)
    }

    func detallesFactura() -> String {
        return "Factura para \(cliente.nombre) por \(orden.cantidad) autos \(orden.carro.modelo). Total: $\(total)"
    }
}

class Empresa {
    var nombre: String
    var ubicacion: String
    var inventario: [Carro]

    init(nombre: String, ubicacion: String) {
        self.nombre = nombre
        self.ubicacion = ubicacion
        self.inventario = []
    }

    func agregarInventario(_ carro: Carro) {
        inventario.append(carro)
    }

    func mostrarInventario() -> String {
        return "Inventario:\n" + inventario.map { $0.detalles() }.joined(separator: "\n")
    }
}

// Creación de instancias y ejecución de métodos

let empresa = Empresa(nombre: "Autos XYZ", ubicacion: "Madrid")
let carro1 = Carro(modelo: "AX100", tipo: "Sedán", precio: 20000.00)
let carro2 = Carro(modelo: "AX200", tipo: "SUV", precio: 30000.00)

empresa.agregarInventario(carro1)
empresa.agregarInventario(carro2)

let cliente = Cliente(nombre: "Juan Pérez", direccion: "Calle Falsa 123", telefono: "555-1234")
let orden = OrdenProduccion(carro: carro1, cantidad: 10)
orden.completarOrden()

let factura = Factura(cliente: cliente, orden: orden)

print(empresa.mostrarInventario())
print(cliente.detallesCliente())
print(orden.detallesOrden())
print(factura.detallesFactura())

/*
EJERCICIO:
- Crea una nueva clase llamada "CarroLujo" que herede de la clase "Carro".
- Añade una propiedad adicional en "CarroLujo" llamada "extrasDeLujo" y asegúrate de inicializarla en el constructor.
- Crea una instancia de "CarroLujo" en el código principal y agrega este nuevo carro al inventario de la empresa.
- Usa los métodos existentes para mostrar el inventario actualizado que incluya este carro de lujo.
*/
