# Convenciones de calidad y tooling

> Formato, estilo y herramientas por lenguaje en Programación Agnóstica.
> **Última actualización**: 2026-07-02

## Enfoque

Este es un repositorio **educativo, multilenguaje y sin build**: cada ejemplo se
ejecuta directamente con el intérprete o compilador de su lenguaje. Por eso la
calidad se apoya en un formato consistente y en las herramientas idiomáticas de
cada lenguaje, no en un pipeline único.

## Base común (todos los archivos)

- Estilo transversal definido en [`.editorconfig`](../../.editorconfig): UTF-8,
  finales de línea LF, sin trailing whitespace, salto de línea final.
- Indentación por defecto de 2 espacios (4 para Python).
- Comentarios que expliquen el **porqué** del concepto que ilustra el ejemplo.

## Herramientas por lenguaje

| Lenguaje   | Formateador / Linter sugerido | Comando de referencia          |
| ---------- | ----------------------------- | ------------------------------ |
| Python     | `black`, `ruff`               | `black archivo.py`             |
| JavaScript | `prettier`, `eslint`          | `npx prettier -w tiquete.js`   |
| Ruby       | `rubocop`                     | `rubocop servicio.rb`          |
| Java       | `google-java-format`          | `google-java-format -i Plato.java` |
| Dart       | `dart format`                 | `dart format avion.dart`       |
| Swift      | `swift-format`                | `swift-format -i carro.swift`  |

> Las herramientas son **opcionales**: sirven para mantener los ejemplos limpios
> y legibles. No hay CI que las imponga en este repositorio.

## Reglas

- Antes de subir un ejemplo, formatéalo con la herramienta idiomática del lenguaje.
- Mantén cada ejemplo autocontenido y ejecutable por sí solo.
- Respeta las convenciones de nombres propias de cada lenguaje
  (`snake_case`, `camelCase`, `PascalCase` según corresponda).

## Referencias

- [EditorConfig](https://editorconfig.org)
- Documentación oficial del formateador de cada lenguaje.
