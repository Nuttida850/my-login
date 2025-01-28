import 'package:flutter/material.dart';
import 'package:flutter_register_login/config/config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

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
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 80,
            ),
            child: Column(
              children: [
                Container(
                  width: size.width,
                  padding: EdgeInsets.symmetric(vertical: 30),
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
                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    width: size.width,
                    height: size.height * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: kSecondColor,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 218, 49, 49),
                          blurRadius: 20,
                          offset: Offset(15, 15),
                        ),
                        BoxShadow(
                          color: Color.fromARGB(255, 255, 119, 119),
                          blurRadius: 20,
                          offset: Offset(-15, -15),
                        ),
                      ],
                    ),
                    child: Text(
                      "Register",
                      style: kTextSecondStyle,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/register");
                  },
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                GestureDetector(
                  child: Container(
                    alignment: Alignment.center,
                    width: size.width,
                    height: size.height * 0.08,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: kSecondColor,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 218, 49, 49),
                          blurRadius: 20,
                          offset: Offset(15, 15),
                        ),
                        BoxShadow(
                          color: Color.fromARGB(255, 255, 119, 119),
                          blurRadius: 20,
                          offset: Offset(-15, -15),
                        ),
                      ],
                    ),
                    child: Text(
                      "Login",
                      style: kTextSecondStyle,
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/login");
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      // SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(
      //       horizontal: 20,
      //       vertical: 50,
      //     ),
      //     child: Column(
      //       children: [
      //         Container(
      //           width: size.width,
      //           padding: EdgeInsets.symmetric(vertical: 30),
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(20),
      //             color: Colors.white.withValues(alpha: 0.08),
      //           ),
      //           child: Column(
      //             children: [
      //               Text(
      //                 "Welcome",
      //                 style: kHeadTextStyle,
      //               ),
      //               Text(
      //                 "Please Register or Login",
      //                 style: kTextFirstStyle,
      //               ),
      //             ],
      //           ),
      //         ),
      //         SizedBox(
      //           height: 20,
      //         ),
      //         Image.asset(
      //           logo,
      //           width: size.height / 4,
      //         ),
      //         SizedBox(
      //           height: 30,
      //         ),
      //         GestureDetector(
      //           child: Container(
      //             alignment: Alignment.center,
      //             width: size.width,
      //             height: size.height * 0.08,
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(100),
      //               border: Border.all(color: kPrimaryColor, width: 2),
      //               color: kPrimaryColor,
      //               boxShadow: [
      //                 BoxShadow(
      //                   color: kPrimaryColor,
      //                   blurRadius: 15,
      //                 ),
      //               ],
      //             ),
      //             child: Text(
      //               "Register",
      //               style: kTextSecondStyle,
      //             ),
      //           ),
      //           onTap: () {
      //             Navigator.pushNamed(context, "/register");
      //           },
      //         ),
      //         SizedBox(
      //           height: 20,
      //         ),
      //         GestureDetector(
      //           child: Container(
      //             alignment: Alignment.center,
      //             width: size.width,
      //             height: size.height * 0.08,
      //             decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(100),
      //                 border: Border.all(color: kPrimaryColor, width: 2),
      //                 color: kPrimaryColor,
      //                 boxShadow: [
      //                   BoxShadow(
      //                     color: kPrimaryColor,
      //                     blurRadius: 15,
      //                   )
      //                 ]),
      //             child: Text(
      //               "Login",
      //               style: kTextSecondStyle,
      //             ),
      //           ),
      //           onTap: () {
      //             Navigator.pushNamed(context, "/login");
      //           },
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      // ),
    );
  }
}
