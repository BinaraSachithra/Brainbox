import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:lakshapathi/utils/config.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import '../utils/themes/theme.dart';

final RegExp _emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hidePassword = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  // String countryCode = '+94';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 8, 2, 73),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 16, left: 16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Image.asset('assets/logo.jpg')),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900,
                      color: AppTheme.colors.white,
                    ),
                  ),
                  Text(
                    'Plese sign in to continue',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!_emailRegExp.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    style: TextStyle(
                      color: AppTheme.colors.primary,
                    ),
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIconColor: AppTheme.colors.primary,
                        floatingLabelStyle: TextStyle(
                          color: AppTheme.colors.primary,
                        ),
                        prefixIcon: Icon(Icons.email),
                        labelStyle: TextStyle(
                          color: AppTheme.colors.primary,
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: AppTheme.colors.primary,
                        )),
                        errorStyle: TextStyle(
                          color: AppTheme.colors.primary,
                        ),
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppTheme.colors.primary)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(137, 73, 73, 73)),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppTheme.colors.primary,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppTheme.colors.primary,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),

                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width,
                  //   child: ElevatedButton(
                  //     onPressed: () {},
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         Container(
                  //             height: 20, child: Icon(Icons.email_outlined)),
                  //         SizedBox(
                  //           width: 10,
                  //         ),
                  //         Text("Login with Email"),
                  //       ],
                  //     ),
                  //   ),
                  // ),

                  // IntlPhoneField(
                  //   controller: mobileController,
                  //   onCountryChanged: (Country) {
                  //     countryCode = Country.code;
                  //   },
                  //   disableLengthCheck: true,
                  //   decoration: InputDecoration(
                  //     labelText: 'Phone Number',
                  //     border: OutlineInputBorder(
                  //       borderSide: BorderSide(),
                  //     ),
                  //   ),
                  //   initialCountryCode: 'LK',
                  //   onChanged: (phone) {
                  //     print(phone.completeNumber);
                  //   },
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () {
                        // sendPhoneNumber();
                      },
                      child: Text("Continue"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      "OR",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.transparent),
                      onPressed: () {
                        signInWithGoogle();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 20,
                              child: Image.asset('assets/Google.png')),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Login with Google"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 0),
                        child: Text(
                          "Powered by",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      )),
                  Text(
                    'Next Newest',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  // void sendPhoneNumber() {
  //   final ap = Provider.of<CustomAuthProvider>(context, listen: false);
  //   String phoneNumber = mobileController.text.trim();
  //   ap.signInWithPhone(context, countryCode + phoneNumber);
  // }

  void signInWithGoogle() {
    final ap = Provider.of<CustomAuthProvider>(context, listen: false);
    ap.signInWithGoogle(context);
  }
}
