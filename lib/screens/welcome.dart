import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginSystem/config/config.dart';
import 'package:flutter_loginSystem/screens/home.dart';
import 'package:flutter_loginSystem/widgets/custom_scaffold.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return CustomScaffold(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              // Container(
              //   alignment: Alignment.centerLeft,
              //   padding: EdgeInsets.only(left: 20),
              //   width: size.width,
              //   height: size.height * 0.07,
              //   child: IconButton(
              //     onPressed: () {
              //       Navigator.pop(context);
              //     },
              //     icon: Icon(
              //       Icons.arrow_back_ios,
              //       size: 30,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              SizedBox(
                height: size.height * 0.15,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                padding: EdgeInsets.all(20),
                width: size.width,
                height: size.height * 0.3,
                decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(50)),
                child: Column(
                  children: [
                    Container(),
                    Image.asset(
                      welcomeImg,
                      height: size.height * 0.2,
                      color: Colors.white,
                    ),
                    Expanded(
                      child: Text(
                        auth.currentUser!.email!,
                        style: kTextSecondStyle.copyWith(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  width: size.width,
                  height: size.height * 0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: kPrimaryColor,
                  ),
                  child: Text(
                    "Log Out",
                    style: kTextSecondStyle,
                  ),
                ),
                onTap: () {
                  auth.signOut().then((value) {
                    if (context.mounted) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, "/", (route) => false);
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
