import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_loginSystem/config/config.dart';
import 'package:flutter_loginSystem/models/profile.dart';
import 'package:flutter_loginSystem/widgets/custom_scaffold.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obscureText = true;
  final formKey = GlobalKey<FormState>();
  // ignore: unused_field
  String email = '';
  // ignore: unused_field
  String password = '';
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return CustomScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text("Register", style: kHeadTextStyle),
            ),
            Container(
              margin: EdgeInsets.only(top: 60),
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.18),
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
                  key: formKey,
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
                                color: kPrimaryColor,
                                offset: Offset(-5, -5),
                              ),
                            ]),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Enter email",
                            hintStyle: kTextSecondStyle.copyWith(
                              fontSize: 20,
                              color: Colors.grey[400],
                            ),
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
                                errorText: "Please enter email.",
                              ),
                              EmailValidator(
                                errorText: "Invalid email format",
                              ),
                            ],
                          ).call,
                          onSaved: (value) {
                            email = value!;
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
                                color: kPrimaryColor,
                                offset: Offset(-5, -5),
                              ),
                            ]),
                        child: TextFormField(
                          obscureText: obscureText,
                          decoration: InputDecoration(
                              hintText: "Enter password",
                              hintStyle: kTextSecondStyle.copyWith(
                                fontSize: 20,
                                color: Colors.grey[400],
                              ),
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
                                    obscureText = !obscureText;
                                  });
                                },
                                icon: obscureText
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: kPrimaryColor,
                                        size: 25,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: kPrimaryColor,
                                        size: 25,
                                      ),
                              )),
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: "Please enter password."),
                            MinLengthValidator(6,
                                errorText:
                                    "Please enter must be at least 6 Character.")
                          ]).call,
                          onSaved: (value) {
                            password = value!;
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
                            color: kPrimaryColor,
                          ),
                          child: Text(
                            "Register",
                            style: kTextSecondStyle,
                          ),
                        ),
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            var profile = Profile(
                              email: email,
                              password: password,
                            );
                            try {
                              await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                email: profile.email,
                                password: profile.password,
                              )
                                  .then((onValue) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(
                                      'The user account was successfully created',
                                      style: kTextSecondStyle.copyWith(
                                          fontSize: 18),
                                    ),
                                    backgroundColor: kPrimaryColor,
                                  ));
                                  Navigator.pushNamedAndRemoveUntil(
                                      context, "/", (route) => false);
                                }
                                formKey.currentState!.reset();
                              });
                            } on FirebaseAuthException catch (e) {
                              String message;
                              if (e.code == "email-already-in-use") {
                                message =
                                    "This email already in use. Please use another account instead.";
                              } else {
                                message = e.message!;
                              }
                              Fluttertoast.showToast(
                                msg: message,
                                gravity: ToastGravity.SNACKBAR,
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
    );
  }
}
