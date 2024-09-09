import java.util.ArrayList;
import java.util.List;

class Plato {
    private String nombre;
    private String tipo;
    private double precio;

    public Plato(String nombre, String tipo, double precio) {
        this.nombre = nombre;
        this.tipo = tipo;
        this.precio = precio;
    }

    public String detalles() {
        return "Plato: " + nombre + ", Tipo: " + tipo + ", Precio: $" + precio;
    }

    public void aplicarDescuento(double porcentaje) {
        this.precio -= this.precio * (porcentaje / 100);
    }
}

class OrdenCocina {
    private Plato plato;
    private int cantidad;
    private String estado;

    public OrdenCocina(Plato plato, int cantidad) {
        this.plato = plato;
        this.cantidad = cantidad;
        this.estado = "En preparación";
    }

    public void completarOrden() {
        this.estado = "Completado";
    }

    public String detallesOrden() {
        return "Orden de " + cantidad + " " + plato.detalles() + " - Estado: " + estado;
    }
}

class Cliente {
    private String nombre;
    private String direccion;
    private String telefono;

    public Cliente(String nombre, String direccion, String telefono) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.telefono = telefono;
    }

    public String detallesCliente() {
        return "Cliente: " + nombre + ", Dirección: " + direccion + ", Teléfono: " + telefono;
    }
}

class Factura {
    private Cliente cliente;
    private OrdenCocina orden;
    private double total;

    public Factura(Cliente cliente, OrdenCocina orden) {
        this.cliente = cliente;
        this.orden = orden;
        this.total = orden.plato.precio * orden.cantidad;
    }

    public String detallesFactura() {
        return "Factura para " + cliente.detallesCliente() + " por " + orden.detallesOrden() + ". Total: $" + total;
    }
}

class Restaurante {
    private String nombre;
    private String ubicacion;
    private List<Plato> menu;

    public Restaurante(String nombre, String ubicacion) {
        this.nombre = nombre;
        this.ubicacion = ubicacion;
        this.menu = new ArrayList<>();
    }

    public void agregarPlato(Plato plato) {
        menu.add(plato);
    }

    public String mostrarMenu() {
        StringBuilder sb = new StringBuilder("Menú:\n");
        for (Plato p : menu) {
            sb.append(p.detalles()).append("\n");
        }
        return sb.toString();
    }
}

public class Main {
    public static void main(String[] args) {
        Restaurante restaurante = new Restaurante("Restaurante Delicioso", "Barcelona");
        Plato plato1 = new Plato("Paella", "Principal", 20.00);
        Plato plato2 = new Plato("Gazpacho", "Entrante", 10.00);

        restaurante.agregarPlato(plato1);
        restaurante.agregarPlato(plato2);

        Cliente cliente = new Cliente("Laura Martínez", "Calle Real 45", "555-6789");
        OrdenCocina orden = new OrdenCocina(plato1, 3);
        orden.completarOrden();

        Factura factura = new Factura(cliente, orden);

        System.out.println(restaurante.mostrarMenu());
        System.out.println(cliente.detallesCliente());
        System.out.println(orden.detallesOrden());
        System.out.println(factura.detallesFactura());
    }
}

/*
  EJERCICIO:
  - Crea una nueva clase llamada "PlatoEspecial" que herede de la clase "Plato".
  - Añade una propiedad adicional en "PlatoEspecial" llamada "ingredienteSecreto" y asegúrate de inicializarla en el constructor.
  - Crea una instancia de "PlatoEspecial" en el método main() y agrega este nuevo plato al menú del restaurante.
  - Usa los métodos existentes para mostrar el menú actualizado que incluya este plato especial.
*/
