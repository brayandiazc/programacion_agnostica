class Avion {
  String codigoVuelo;
  String tipoAvion;
  String aerolinea;

  Avion(this.codigoVuelo, this.tipoAvion, this.aerolinea);

  String detalles() {
    return 'Vuelo: $codigoVuelo, Tipo: $tipoAvion, Aerolínea: $aerolinea';
  }
}

class PlanVuelo {
  Avion avion;
  String destino;
  String estado = "En espera";

  PlanVuelo(this.avion, this.destino);

  void autorizarDespegue() {
    estado = "Autorizado para despegar";
  }

  void autorizarAterrizaje() {
    estado = "Autorizado para aterrizar";
  }

  String detallesPlan() {
    return 'Plan de vuelo para ${avion.codigoVuelo} - Destino: $destino - Estado: $estado';
  }
}

class ControladorAereo {
  String nombre;
  String torreControl;

  ControladorAereo(this.nombre, this.torreControl);

  String detallesControlador() {
    return 'Controlador: $nombre, Torre de Control: $torreControl';
  }
}

class Informe {
  ControladorAereo controlador;
  PlanVuelo planVuelo;
  String estadoFinal;

  Informe(this.controlador, this.planVuelo) {
    estadoFinal = planVuelo.estado;
  }

  String detallesInforme() {
    return 'Informe del Controlador ${controlador.nombre} para el vuelo ${planVuelo.avion.codigoVuelo}. Estado final: $estadoFinal';
  }
}

class TorreControl {
  String nombre;
  String ubicacion;
  List<Avion> avionesEnEspera = [];

  TorreControl(this.nombre, this.ubicacion);

  void agregarAvion(Avion avion) {
    avionesEnEspera.add(avion);
  }

  String mostrarAvionesEnEspera() {
    return "Aviones en espera:\n" + avionesEnEspera.map((v) => v.detalles()).join("\n");
  }
}

void main() {
  TorreControl torre = TorreControl("Torre de Control Principal", "Madrid");
  Avion avion1 = Avion("IB123", "A320", "Iberia");
  Avion avion2 = Avion("AF456", "B737", "Air France");

  torre.agregarAvion(avion1);
  torre.agregarAvion(avion2);

  ControladorAereo controlador = ControladorAereo("Carlos López", "Torre de Control Principal");
  PlanVuelo plan = PlanVuelo(avion1, "París");
  plan.autorizarDespegue();

  Informe informe = Informe(controlador, plan);

  print(torre.mostrarAvionesEnEspera());
  print(controlador.detallesControlador());
  print(plan.detallesPlan());
  print(informe.detallesInforme());
}

/*
  EJERCICIO:
  - Crea una nueva clase llamada "AvionCarga" que herede de la clase "Avion".
  - Añade una propiedad adicional en "AvionCarga" llamada "capacidadCarga" y asegúrate de inicializarla en el constructor.
  - Crea una instancia de "AvionCarga" en el método main() y agrega esta instancia a la torre de control usando el método `agregarAvion`.
  - Usa los métodos existentes en las otras clases para crear un plan de vuelo con este nuevo avión.
*/
