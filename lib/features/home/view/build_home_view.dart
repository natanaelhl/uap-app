import 'package:flutter/material.dart';
import 'package:uap_app/features/home/controller/home_controller.dart';
import 'package:uap_app/features/home/view/complements/complement_card_explore_maps.dart';

Widget buildHomeView(BuildContext context, HomeController controller) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildCustomCardWidget(context, controller),
          ],
        )
      ],
    ),
  );
}

Widget buildCustomCardWidget(BuildContext context, HomeController controller) {
  return ComplementCardExploreMaps(
    backgroundColor: 0xFFFEEF2EA,
    controller: controller,
  );
}
