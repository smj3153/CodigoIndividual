import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(ElegirPlatilloApp());

class ElegirPlatilloApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elegir Platillo',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: ElegirPlatilloPage(),
    );
  }
}

class ElegirPlatilloPage extends StatefulWidget {
  @override
  _ElegirPlatilloPageState createState() => _ElegirPlatilloPageState();
}

class _ElegirPlatilloPageState extends State<ElegirPlatilloPage> {
  final List<String> desayunoPlatillos = ['Hotcakes', 'Avena', 'Huevos', 'Smoothie', 'Chilaquiles', 'Omelette'];
  final List<String> comidaPlatillos = ['Sandwich', 'Ensalada', 'Sopa', 'Pizza', 'Tacos', 'Torta ahogada'];
  final List<String> cenaPlatillos = ['Filete', 'Pollo', 'Pasta', 'Pescado', 'Pavo', 'Hamburguesa'];

  String platilloSeleccionado = '';

  void elegirPlatilloRandom(String platilloTipo) {
    List<String> items = [];
    switch (platilloTipo) {
      case 'Desayuno':
        items = desayunoPlatillos;
        break;
      case 'Comida':
        items = comidaPlatillos;
        break;
      case 'Cena':
        items = cenaPlatillos;
        break;
    }
    if (items.isNotEmpty) {
      final random = Random();
      setState(() {
        platilloSeleccionado = items[random.nextInt(items.length)];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Código Individual Seung Min Jeong A01634234'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Elige una hora de comida:',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => elegirPlatilloRandom('Desayuno'),
              child: Text('Desayuno'),
            ),
            ElevatedButton(
              onPressed: () => elegirPlatilloRandom('Comida'),
              child: Text('Comida'),
            ),
            ElevatedButton(
              onPressed: () => elegirPlatilloRandom('Cena'),
              child: Text('Cena'),
            ),
            SizedBox(height: 20.0),
            platilloSeleccionado.isNotEmpty
                ? Text(
                    'Disfruta tu(s) $platilloSeleccionado!',
                    style: TextStyle(fontSize: 24.0),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
