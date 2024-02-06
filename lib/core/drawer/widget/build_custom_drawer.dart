import 'package:flutter/material.dart';
import 'package:uap_app/core/colors/app_colors.dart';
import 'package:uap_app/core/drawer/controller/custom_drawer_controller.dart';

Widget buildCustomDrawer(CustomDrawerController controller) {
  return Drawer(
    backgroundColor: AppColors.color4.color,
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          accountName: const Text("Natanael"),
          accountEmail: const Text("email@exemplo.com"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: AppColors.color4.color,
            child: Text(
              'N',
              style: TextStyle(color: AppColors.color5.color),
            ),
          ),
          decoration: BoxDecoration(color: AppColors.color5.color),
        ),
        ListTile(
          title: const Text('Home'),
          leading: const Icon(Icons.home),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: const Text('Planos & Preços'),
          leading: const Icon(Icons.attach_money),
          onTap: () {
            // Update the state of the app.
            // ...
          },
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
          leading: const Icon(Icons.logout),
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
