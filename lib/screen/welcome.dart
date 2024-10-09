import 'package:flutter/material.dart';
import 'package:flutter/src/material/text_theme.dart';
import 'package:lakshapathi/utils/config.dart';
import 'package:provider/provider.dart';

// import '../components/custom_clipper.dart';
import '../provider/auth_provider.dart';
import '../utils/themes/theme.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<CustomAuthProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 5, 0, 61),
      body: Stack(
        children: [
          //
          Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Image.asset('assets/logo.jpg')),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                    Color.fromARGB(255, 255, 255, 255))),
                            onPressed: () async {
                              ap.isSignedIn == true
                                  ? await ap.getDataFromSP().whenComplete(() =>
                                      Navigator.pushReplacementNamed(
                                          context, '/home'))
                                  : Navigator.pushReplacementNamed(
                                      context, '/login');
                            },
                            child: Text(
                              "GET STARTED",
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.w900,
                                color: AppTheme.colors.black,
                              ),
                            ))),
                    SizedBox(height: 40),
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
                        fontWeight: FontWeight.bold,
                        color: AppTheme.colors.white,
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
