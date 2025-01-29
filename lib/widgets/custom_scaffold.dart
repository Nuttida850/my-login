import 'package:flutter/material.dart';
import 'package:flutter_loginSystem/config/config.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key,this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kPrimaryColor,
                  kSecondColor,
                ],
              ),
            ),
          ),
          SafeArea(child: child!)
        ],
      ),
    );
  }
}