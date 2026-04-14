import 'package:flutter/material.dart';
import 'clasevjuego.dart';
import 'diccionariovjuego.dart';

class VerVJuego extends StatefulWidget {
  const VerVJuego({super.key});

  @override
  State<VerVJuego> createState() => _VerVJuegoState();
}

class _VerVJuegoState extends State<VerVJuego> {
  @override
  Widget build(BuildContext context) {
    List<VJuego> listaJuegos = datosvjuego.values.toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Lista de Videojuegos', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Color(0xFF00FFFF)),
      ),
      body: listaJuegos.isEmpty
          ? const Center(
              child: Text(
                'No hay videojuegos registrados',
                style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: listaJuegos.length,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                final juego = listaJuegos[index];
                return Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                    side: const BorderSide(color: Colors.black, width: 2),
                  ),
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 25,
                        child: Icon(Icons.gamepad, color: Color(0xFF00FFFF), size: 30),
                      ),
                      title: Text(
                        juego.nombre,
                        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Género: ${juego.genero}\nID: ${juego.id}',
                          style: const TextStyle(color: Colors.black87, fontSize: 15),
                        ),
                      ),
                      trailing: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: const Color(0xFF00FFFF), width: 1.5),
                        ),
                        child: Text(
                          '\$${juego.precio.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Color(0xFF00FFFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      isThreeLine: true,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
