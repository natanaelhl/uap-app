import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uap_app/core/injector/injector.dart';
import 'package:uap_app/features/home/view/home_view.dart';
import 'package:uap_app/features/create_map/view/create_map_view.dart';
import 'package:uap_app/features/login/view/login_view.dart';
import 'package:uap_app/features/person_map/presentation/ui/person_map_view.dart';
import 'package:uap_app/features/register/view/register_view.dart';
import 'package:uap_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Injector.build();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      routes: {
        '/registerView': (_) => const RegisterView(),
        '/loginView': (_) => const LoginView(),
        '/personListView': (_) => const CreateMapView(),
        '/personMapView': (_) => const PersonMapView(),
        '/homeView': (_) => const HomeView(),
      },
      home: const RegisterView(),
    );
  }
}
