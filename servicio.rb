# Clase Servicio
class Servicio
  attr_accessor :descripcion, :duracion_estimada, :costo

  def initialize(descripcion, duracion_estimada, costo)
    @descripcion = descripcion
    @duracion_estimada = duracion_estimada # en horas
    @costo = costo
  end

  def detalles
    "Servicio: #{@descripcion}, Duración Estimada: #{@duracion_estimada} horas, Costo: $#{@costo}"
  end

  def aplicar_descuento(porcentaje)
    @costo -= @costo * (porcentaje / 100.0)
  end
end

# Clase OrdenServicio
class OrdenServicio
  attr_accessor :servicio, :fecha_programada, :estado

  def initialize(servicio, fecha_programada)
    @servicio = servicio
    @fecha_programada = fecha_programada
    @estado = "Pendiente"
  end

  def completar_orden
    @estado = "Completado"
  end

  def detalles_orden
    "Orden de Servicio: #{servicio.descripcion} - Fecha: #{fecha_programada} - Estado: #{estado}"
  end
end

# Clase Cliente
class Cliente
  attr_accessor :nombre, :direccion, :telefono, :correo_electronico

  def initialize(nombre, direccion, telefono, correo_electronico)
    @nombre = nombre
    @direccion = direccion
    @telefono = telefono
    @correo_electronico = correo_electronico
  end

  def detalles_cliente
    "Cliente: #{@nombre}, Dirección: #{@direccion}, Teléfono: #{@telefono}, Email: #{@correo_electronico}"
  end
end

# Clase Factura
class Factura
  attr_accessor :cliente, :orden_servicio, :total, :fecha_emision

  def initialize(cliente, orden_servicio)
    @cliente = cliente
    @orden_servicio = orden_servicio
    @total = orden_servicio.servicio.costo
    @fecha_emision = Time.now.strftime("%d/%m/%Y")
  end

  def detalles_factura
    "Factura para #{@cliente.nombre} por el servicio de '#{orden_servicio.servicio.descripcion}'. Total: $#{@total}. Fecha de Emisión: #{@fecha_emision}"
  end
end

# Clase Empresa
class Empresa
  attr_accessor :nombre, :ubicacion, :catalogo_servicios

  def initialize(nombre, ubicacion)
    @nombre = nombre
    @ubicacion = ubicacion
    @catalogo_servicios = []
  end

  def agregar_servicio(servicio)
    @catalogo_servicios << servicio
  end

  def mostrar_catalogo
    "Catálogo de Servicios:\n" + @catalogo_servicios.map(&:detalles).join("\n")
  end
end

# Creación de instancias y ejecución de métodos

# Crear una empresa
empresa = Empresa.new("ClimaPerfecto S.A.", "Madrid")

# Crear servicios
servicio1 = Servicio.new("Mantenimiento Preventivo de Aire Acondicionado", 2, 150.00)
servicio2 = Servicio.new("Instalación de Aire Acondicionado", 4, 300.00)
servicio3 = Servicio.new("Reparación de Fugas", 3, 200.00)

# Agregar servicios al catálogo
empresa.agregar_servicio(servicio1)
empresa.agregar_servicio(servicio2)
empresa.agregar_servicio(servicio3)

# Crear un cliente
cliente = Cliente.new("Laura Gómez", "Avenida Siempre Viva 742", "555-6789", "laura.gomez@example.com")

# Crear una orden de servicio
orden_servicio = OrdenServicio.new(servicio1, "15/09/2023")

# Completar la orden
orden_servicio.completar_orden

# Crear una factura
factura = Factura.new(cliente, orden_servicio)

# Mostrar detalles
puts empresa.mostrar_catalogo
puts cliente.detalles_cliente
puts orden_servicio.detalles_orden
puts factura.detalles_factura


=begin
  EJERCICIO:
  - Crea una nueva clase llamada "ServicioUrgente" que herede de la clase "Servicio".
  - Añade una propiedad adicional en "ServicioUrgente" llamada "prioridad" y asegúrate de inicializarla en el constructor.
  - Crea una instancia de "ServicioUrgente" en el código principal y agrega este nuevo servicio al catálogo de la empresa.
  - Usa los métodos existentes para mostrar el catálogo actualizado que incluya este servicio urgente.
=end
