import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_register_toba/screens/auth_page.dart';
import 'package:login_register_toba/screens/login_page.dart';
// import 'package:login_register_toba/screens/login_page.dart';
import 'package:login_register_toba/screens/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/regis',
      getPages: [
        GetPage(name: '/regis', page: () => const RegisterPage()),
        GetPage(
            name: '/login',
            page: () => const LoginPage(),
            transition: Transition.noTransition),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
