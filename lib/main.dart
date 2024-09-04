import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = SeleccionarPizza();
        break;
      case 1:
        page = Factura();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: false,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.local_pizza),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorites'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page, // ← Here.
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SeleccionarPizza extends StatefulWidget {
  const SeleccionarPizza({super.key});

  @override
  State<SeleccionarPizza> createState() => _SeleccionarPizzaState();
}

class _SeleccionarPizzaState extends State<SeleccionarPizza> {
  int tipo_pizza_seleccion = 0;
  int page = 0;

  void SeccionPizza(String tipo_pizza) {
    if (tipo_pizza == 'Vegetariana') {
      setState(() {
        tipo_pizza_seleccion = 0;
        page = 1;
      });
    } else {
      setState(() {
        tipo_pizza_seleccion = 1;
        page = 1;
      });
    }
    //tipo_pizza_seleccion = tipo_pizza;
  }

  List<Map<String, dynamic>> pizza = [
    {
      'tipo_pizza': 'Vegeriana',
      'sabores': ['Tofu', 'Champiñones'],
    },
    {
      'tipo_pizza': 'No Vegeriana',
      'sabores': ['Peperoni', 'Salchichas italiana'],
    },
  ];

  Widget sabores_pizza_widget() {
    List<Widget> botones = [];
    for (var pizza_seleccionada in pizza[tipo_pizza_seleccion]['sabores']) {
      botones.add(
        ElevatedButton(
          onPressed: () {
            print('seccion pizza $pizza_seleccionada');
          },
          child: Text(pizza_seleccionada),
        ),
      );
      botones.add(const SizedBox(height: 10));
    }
    return Column(
      children: botones,
    );
  }

  Widget tipo_pizza_widget() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            SeccionPizza('Vegetariana');
          },
          child: Text('Vegetariana'),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            SeccionPizza('No Vegetariana');
          },
          child: Text('No vegetariana'),
        ),
      ],
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    switch (page) {
      case 0:
        return Center(
          child: Column(children: [
            const Text('bienvenido a Bella Napoli'),
            Text('Seleccione su pizza'),
            tipo_pizza_widget(),
            //sabores_pizza_widget(),
          ]),
        );
      case 1:
        return Center(
          child: Column(children: [
            const Text('bienvenido a Bella Napoli'),
            Text('Seleccione ingrediente'),
            sabores_pizza_widget(),
          ]),
        );
      default:
        return const Placeholder();
    }
  }
}

/*

*/

class Factura extends StatelessWidget {
  const Factura({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
