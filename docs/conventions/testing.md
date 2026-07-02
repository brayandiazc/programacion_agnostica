# Convenciones de verificación de ejemplos

> Cómo verificamos que los ejemplos de Programación Agnóstica funcionan.
> **Última actualización**: 2026-07-02

## Enfoque

Este repositorio no tiene una suite de tests tradicional: cada archivo es un
**ejemplo ejecutable** que ilustra un concepto en un lenguaje. La "verificación"
consiste en ejecutar el ejemplo y comprobar que corre sin errores y produce la
salida esperada.

## Cómo ejecutar cada ejemplo

| Lenguaje   | Archivo        | Comando                        |
| ---------- | -------------- | ------------------------------ |
| Python     | `ventilador.py`| `python3 ventilador.py`        |
| JavaScript | `tiquete.js`   | `node tiquete.js`              |
| Ruby       | `servicio.rb`  | `ruby servicio.rb`             |
| Java       | `plato.java`   | `java plato.java`              |
| Dart       | `avion.dart`   | `dart run avion.dart`          |
| Swift      | `carro.swift`  | `swift carro.swift`            |

## Reglas

- Cada ejemplo debe **ejecutarse sin errores** con la versión mínima del lenguaje
  indicada en el [README](../../README.md).
- Un ejemplo ilustra **un** concepto de forma clara y autocontenida.
- La salida debe ser determinista (sin dependencia de red, reloj o entrada externa).
- Si un ejemplo imprime resultados, incluye en los comentarios qué se espera ver.

## Al aportar un nuevo ejemplo

1. Ejecútalo localmente con el comando de la tabla.
2. Verifica que la salida coincide con el concepto que documentas.
3. Formatea el archivo (ver [`quality-tooling.md`](quality-tooling.md)).

## Referencias

- Documentación oficial del intérprete/compilador de cada lenguaje.
