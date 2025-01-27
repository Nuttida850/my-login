import 'package:flutter/material.dart';
import 'package:flutter_register_login/screens/home.dart';
import 'package:flutter_register_login/screens/login.dart';
import 'package:flutter_register_login/screens/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (conext) => const HomeScreen(),
        "/register": (context) => const RegisterScreen(),
        "/login": (context) => const LoginScreen(),
      },
    );
  }
}

