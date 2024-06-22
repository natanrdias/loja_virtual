import 'package:flutter/material.dart';

import 'drawer_tile.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromARGB(255, 203, 236, 241), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)));
    return Drawer(
        child: Stack(
      children: [
        _buildDrawerBack(),
        ListView(
          padding: const EdgeInsets.only(left: 32, top: 16),
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.fromLTRB(0, 16, 16, 8),
              height: 170,
              child: const Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 0,
                    child: Text(
                      "Flutter's Clothing",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Olá,",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Entre ou cadastre-se >",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 4, 125, 141)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(),
            const DrawerTile(icon: Icons.home, text: "Início"),
            const DrawerTile(icon: Icons.list, text: "Produtos"),
            const DrawerTile(icon: Icons.location_on, text: "Lojas"),
            const DrawerTile(icon: Icons.playlist_add_check, text: "Meus Pedidos"),
          ],
        )
      ],
    ));
  }
}
