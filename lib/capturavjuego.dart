import 'package:flutter/material.dart';
import 'guardardatosdiccionario.dart';

class CapturaVJuego extends StatefulWidget {
  const CapturaVJuego({super.key});

  @override
  State<CapturaVJuego> createState() => _CapturaVJuegoState();
}

class _CapturaVJuegoState extends State<CapturaVJuego> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreCtrl = TextEditingController();
  final TextEditingController _generoCtrl = TextEditingController();
  final TextEditingController _precioCtrl = TextEditingController();

  void _guardar() {
    if (_formKey.currentState!.validate()) {
      guardarDatos(
        _nombreCtrl.text,
        _generoCtrl.text,
        double.parse(_precioCtrl.text),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Videojuego guardado correctamente', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          backgroundColor: Color(0xFF00FFFF),
        ),
      );
      _nombreCtrl.clear();
      _generoCtrl.clear();
      _precioCtrl.clear();
    }
  }

  @override
  void dispose() {
    _nombreCtrl.dispose();
    _generoCtrl.dispose();
    _precioCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Capturar Videojuego', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Color(0xFF00FFFF)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Icon(Icons.videogame_asset, size: 80, color: Colors.black),
              const Text('NUEVO REGISTRO', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
              const SizedBox(height: 30),
              _buildTextField(
                controller: _nombreCtrl,
                label: 'Nombre del Videojuego',
                icon: Icons.title,
                validator: (value) => value!.isEmpty ? 'El nombre es requerido' : null,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _generoCtrl,
                label: 'Género',
                icon: Icons.category,
                validator: (value) => value!.isEmpty ? 'El género es requerido' : null,
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _precioCtrl,
                label: 'Precio',
                icon: Icons.attach_money,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                textColor: const Color(0xFF00FFFF),
                validator: (value) {
                  if (value!.isEmpty) return 'El precio es requerido';
                  if (double.tryParse(value) == null) return 'Ingrese un precio válido';
                  return null;
                },
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: _guardar,
                icon: const Icon(Icons.save, color: Color(0xFF00FFFF)),
                label: const Text('GUARDAR DATOS', style: TextStyle(color: Color(0xFF00FFFF), fontSize: 18, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Color(0xFF00FFFF), width: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    Color textColor = Colors.black,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      style: TextStyle(color: textColor, fontWeight: FontWeight.bold, fontSize: 18),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black54, fontWeight: FontWeight.w600),
        prefixIcon: Icon(icon, color: Colors.black),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF00FFFF), width: 3),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }
}
