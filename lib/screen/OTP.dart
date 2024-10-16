// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lakshapathi/provider/auth_provider.dart';
import 'package:lakshapathi/screen/newUser.dart';
import 'package:lakshapathi/utils/config.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../utils/themes/theme.dart';

class OTP extends StatefulWidget {
  final String verificationId;
  const OTP({super.key, required this.verificationId});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  String? otpCode;
  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<CustomAuthProvider>(context, listen: true).isLoading;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 60.0, right: 16, left: 16),
      child: isLoading == true
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Image.asset('assets/logo.jpg')),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Verification',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                        color: AppTheme.colors.primary,
                      ),
                    ),
                    Text(
                      'Enter the OTP number you received',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w100,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Pinput(
                      onCompleted: (value) {
                        setState(() {
                          otpCode = value;
                        });
                      },
                      length: 6,
                      showCursor: true,
                      defaultPinTheme: PinTheme(
                        width: 60,
                        height: 60,
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppTheme.colors.primary),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          if (otpCode != null) {
                            verifyOtp(context, otpCode!);
                          }
                        },
                        child: Text("Verify"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Didn't receive any code?",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                    ),
                    Text(
                      "Resend Code",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.colors.primary,
                      ),
                    ),
                    SizedBox(
                      height: 15,
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
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
    ));
  }

  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<CustomAuthProvider>(context, listen: false);
    ap.verifyOtp(
        context: context,
        verificationId: widget.verificationId,
        userOtp: userOtp,
        onSuccess: () {
          ap.checkExistingUser().then((value) async {
            if (value == true) {
              //user exists
              Navigator.pushNamedAndRemoveUntil(
                  context, '/home', (route) => false);
            } else {
              // new user
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => NewUser()),
                  (route) => false);
            }
          });
        });
  }
}
