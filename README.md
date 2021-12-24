# pruebaTecnicaHiberus

Prueba técnica de Hiberus para la parte de desarrollo móvil.

<!-- ABOUT THE PROJECT -->
## About The Project

El objetivo de éste proyecto es la creación de una App capaz de consumir datos de una API y trabajar con ellos. En ese proceso hay que tener en cuenta las diferentes resoluciones de pantalla, el control de errores de conexión (con su correspondiente manejo para el usuario) y la estética (no soy muy bueno, pero lo he intentado).

### Built With

Para la realización de esta prueba se ha empleado el framework de flutter, junto con una serie de librerías que me han ayudado mucho durante su realización:
* [http](https://pub.dev/packages/http)
* [provider](https://pub.dev/packages/provider)
* [flutter_card_swipper](https://pub.dev/packages/flutter_card_swipper)
* [carousel_slider](https://pub.dev/packages/carousel_slider)
* [smooth_page_indicator](https://pub.dev/packages/smooth_page_indicator)
* [connectivity_plus](https://pub.dev/packages/connectivity_plus)
* [google_fonts](https://pub.dev/packages/google_fonts)

<!-- GETTING STARTED -->
## Getting Started

Para poder levantar el proyecto es necesario contar con el SDK de flutter instalado, el SDK de Android Studio (visual studio code, etc), una máquina virtual o un dispositivo físico (solo he podido probarlo en dispositivos Android) y una conectividad a internet para disfrutar de la experiencia.

### Installation

Paso a paso de la instalación:

1. Ir a la página de flutter para descargar el SDK https://docs.flutter.dev/get-started/install
2. Descomprimir el paquete en C:\src\flutter.
3. Añadir las variables de entorno.
   ```
   Ir a Inicio>Editar variables de entorno del sistema>Variables de entorno>Path>Editar y añadir la ruta "C:\src\flutter\bin".
   ```
4. Descargar Android Studio (o Visual Studio) e instalarle el plugin de Flutter (pluggins install flutter).
5. Aceptar las licencias de Android para las diferentes SDK platforms (la más importante es Android SDK Command-line Tools)
6. Abrir una terminal y ejecutar el siguiente comando:
   ```
   flutter doctor –android-licenses
   ```
Ante cualquier duda podéis acceder a este [enlace](https://carloszr.com/como-instalar-flutter-en-windows/).

<!-- DEMO -->
## DEMO

Ahora un video que muestre una pequeña demo del producto para que no sea necesario levantar toda la estructura:

<<Demo>>