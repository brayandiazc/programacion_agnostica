class Tiquete {
  constructor(partido, ubicacion, precio) {
    this.partido = partido;
    this.ubicacion = ubicacion;
    this.precio = precio;
  }

  detalles() {
    return `Partido: ${this.partido}, Ubicación: ${this.ubicacion}, Precio: $${this.precio}`;
  }

  aplicarDescuento(porcentaje) {
    this.precio -= this.precio * (porcentaje / 100);
  }
}

class OrdenTiquete {
  constructor(tiquete, cantidad) {
    this.tiquete = tiquete;
    this.cantidad = cantidad;
    this.estado = "En proceso";
  }

  completarOrden() {
    this.estado = "Completado";
  }

  detallesOrden() {
    return `Orden de ${this.cantidad} tiquetes para el partido ${this.tiquete.partido} - Estado: ${this.estado}`;
  }
}

class Cliente {
  constructor(nombre, direccion, telefono) {
    this.nombre = nombre;
    this.direccion = direccion;
    this.telefono = telefono;
  }

  detallesCliente() {
    return `Cliente: ${this.nombre}, Dirección: ${this.direccion}, Teléfono: ${this.telefono}`;
  }
}

class Factura {
  constructor(cliente, orden) {
    this.cliente = cliente;
    this.orden = orden;
    this.total = orden.tiquete.precio * orden.cantidad;
  }

  detallesFactura() {
    return `Factura para ${this.cliente.nombre} por ${this.orden.cantidad} tiquetes para el partido ${this.orden.tiquete.partido}. Total: $${this.total}`;
  }
}

class Empresa {
  constructor(nombre, ubicacion) {
    this.nombre = nombre;
    this.ubicacion = ubicacion;
    this.inventario = [];
  }

  agregarInventario(tiquete) {
    this.inventario.push(tiquete);
  }

  mostrarInventario() {
    return (
      "Inventario:\n" + this.inventario.map((v) => v.detalles()).join("\n")
    );
  }
}

// Creación de instancias y ejecución de métodos

const empresa = new Empresa("Tiquetes Futbol S.A.", "Madrid");
const tiquete1 = new Tiquete(
  "Real Madrid vs Barcelona",
  "Tribuna Norte",
  150.0
);
const tiquete2 = new Tiquete(
  "Atlético Madrid vs Sevilla",
  "Tribuna Sur",
  120.0
);

empresa.agregarInventario(tiquete1);
empresa.agregarInventario(tiquete2);

const cliente = new Cliente(
  "Laura Gómez",
  "Avenida Siempre Viva 742",
  "555-6789"
);
const orden = new OrdenTiquete(tiquete1, 3);
orden.completarOrden();

const factura = new Factura(cliente, orden);

console.log(empresa.mostrarInventario());
console.log(cliente.detallesCliente());
console.log(orden.detallesOrden());
console.log(factura.detallesFactura());

/*
  EJERCICIO:
  - Crea una nueva clase llamada "TiqueteVIP" que herede de la clase "Tiquete".
  - Añade una propiedad adicional en "TiqueteVIP" llamada "beneficiosExtra" y asegúrate de inicializarla en el constructor.
  - Crea una instancia de "TiqueteVIP" en el código principal y agrega este nuevo tiquete al inventario de la empresa.
  - Usa los métodos existentes para mostrar el inventario actualizado que incluya este tiquete VIP.
*/
