import 'clasevjuego.dart';
import 'diccionariovjuego.dart';

void guardarDatos(String nombre, String genero, double precio) {
  int nextId = 1;
  if (datosvjuego.isNotEmpty) {
    nextId = datosvjuego.keys.reduce((curr, next) => curr > next ? curr : next) + 1;
  }
  
  datosvjuego[nextId] = VJuego(
    id: nextId,
    nombre: nombre,
    genero: genero,
    precio: precio,
  );
}
