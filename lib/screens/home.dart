import 'package:flutter/material.dart';
import 'package:flutter_loginSystem/config/config.dart';
import 'package:flutter_loginSystem/widgets/button.dart';
import 'package:flutter_loginSystem/widgets/custom_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return CustomScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 70,
        ),
        child: Column(
          children: [
            Container(
              width: size.width,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withValues(alpha: 0.08),
              ),
              child: Column(
                children: [
                  Text(
                    "Welcome",
                    style: kHeadTextStyle,
                  ),
                  Text(
                    "Please Register or Login",
                    style: kTextFirstStyle,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              logo,
              width: size.height / 4,
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            Button(
              text: "Register",
              textColor: Colors.white,
              color: kSecondColor,
              onTap: "/register",
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            // GestureDetector(
            //   child: Container(
            //     alignment: Alignment.center,
            //     width: size.width,
            //     height: size.height * 0.08,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(100),
            //       color: kSecondColor,
            //       boxShadow: [
            //         BoxShadow(
            //           color: Color.fromARGB(255, 218, 49, 49),
            //           blurRadius: 20,
            //           offset: Offset(15, 15),
            //         ),
            //         BoxShadow(
            //           color: Color.fromARGB(255, 255, 119, 119),
            //           blurRadius: 20,
            //           offset: Offset(-15, -15),
            //         ),
            //       ],
            //     ),
            //     child: Text(
            //       "Login",
            //       style: kTextSecondStyle,
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.pushNamed(context, "/login");
            //   },
            // ),
            Button(
              text: "Login",
              textColor: Colors.white,
              color: kSecondColor,
              onTap: "/login",
            ),
          ],
        ),
      ),
    );
  }
}
