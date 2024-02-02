import 'package:flutter/material.dart';
import 'package:uap_app/core/drawer/controller/custom_drawer_controller.dart';

Widget buildCustomDrawer(CustomDrawerController controller) {
  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Drawer Header'),
        ),
        ListTile(
          title: const Text('Configurações'),
          leading: const Icon(Icons.settings),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Sair'),
          leading: Icon(Icons.logout),
          onTap: () {
            controller.signOut();
            // Update the state of the app.
            // ...
          },
        ),
      ],
    ),
  );
}
