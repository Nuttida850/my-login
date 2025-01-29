import 'package:flutter/material.dart';
import 'package:flutter_loginSystem/config/config.dart';

class Button extends StatelessWidget {
  const Button({super.key, this.text, this.textColor, this.onTap, this.color});
  final String? text;
  final Color? textColor;
  final String? onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.sizeOf(context);

    return  GestureDetector(
              child: Container(
                alignment: Alignment.center,
                width: size.width,
                height: size.height * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: color,
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
                  text!,
                  style: kTextSecondStyle.copyWith(
                    color: textColor,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, onTap!);
              },
            );
  }
}