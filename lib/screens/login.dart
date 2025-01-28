import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_register_login/config/config.dart';
import 'package:flutter_register_login/models/profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  String _email = '';
  // ignore: unused_field
  String _password = '';
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                kPrimaryColor,
                kSecondColor,
              ]),
        ),
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [
                  kPrimaryColor,
                  kSecondColor,
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Text("Login", style: kHeadTextStyle),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 60),
                    width: size.width,
                    height: size.height,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 60,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              width: size.width,
                              height: size.height * 0.08,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: kSecondColor,
                                      offset: Offset(-5, -5),
                                    ),
                                  ]),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.email,
                                    size: 30,
                                    color: kPrimaryColor,
                                  ),
                                  label: Text(
                                    "Email",
                                    style: kTextFirstStyle.copyWith(
                                      color: Colors.grey[800],
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                validator: MultiValidator(
                                  [
                                    RequiredValidator(
                                      errorText: "กรุณาป้อนอีเมลด้วยค่ะ",
                                    ),
                                    EmailValidator(
                                      errorText: "รูปแบบอีเมลไม่ถูกต้อง",
                                    ),
                                  ],
                                ).call,
                                onSaved: (value) {
                                  _email = value!;
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 30),
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              width: size.width,
                              height: size.height * 0.08,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: kSecondColor,
                                      offset: Offset(-5, -5),
                                    ),
                                  ]),
                              child: TextFormField(
                                obscureText: _obscureText,
                                style: kTextSecondStyle.copyWith(
                                  fontSize: 25,
                                  color: kSecondColor,
                                ),
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.password,
                                      size: 30,
                                      color: kPrimaryColor,
                                    ),
                                    label: Text(
                                      "Password",
                                      style: kTextFirstStyle.copyWith(
                                        color: Colors.grey[800],
                                        fontSize: 20,
                                      ),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _obscureText = !_obscureText;
                                        });
                                      },
                                      icon: _obscureText
                                          ? Icon(
                                              Icons.visibility_off,
                                              color: kPrimaryColor,
                                              size: 30,
                                            )
                                          : Icon(
                                              Icons.visibility,
                                              color: kPrimaryColor,
                                              size: 30,
                                            ),
                                    )),
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: "กรุณาป้อนรหัสผ่านด้วยค่ะ"),
                                  MinLengthValidator(6,
                                      errorText:
                                          "กรุณาป้อนตัวอักษรอย่างน้อย 6 ตัว่ค่ะ")
                                ]).call,
                                onSaved: (value) {
                                  _password = value!;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 70,
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
                                          color: kSecondColor.withValues(
                                              alpha: 0.5),
                                          blurRadius: 15)
                                    ]),
                                child: Text(
                                  "Login",
                                  style: kTextSecondStyle.copyWith(),
                                ),
                              ),
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  var profile = Profile(
                                    email: _email,
                                    password: _password,
                                  );
                                  try {
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                      email: profile.email,
                                      password: profile.password,
                                    );
                                  _formKey.currentState!.reset();
                                  } on FirebaseAuthException catch (e) {
                                    Fluttertoast.showToast(
                                      msg: e.message!,
                                      gravity: ToastGravity.TOP,
                                    );
                                  }
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
