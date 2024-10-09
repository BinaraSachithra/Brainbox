import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lakshapathi/screen/Home.dart';
import 'package:lakshapathi/firebase_options.dart';
import 'package:lakshapathi/global/globalValues.dart';
import 'package:lakshapathi/provider/auth_provider.dart';
import 'package:lakshapathi/screen/Login.dart';
import 'package:lakshapathi/screen/register.dart';
import 'package:lakshapathi/screen/welcome.dart';
import 'package:lakshapathi/utils/themes/theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => Global(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CustomAuthProvider(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'BrainBox',
          themeMode: ThemeMode.system,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.lightTheme,
          initialRoute: '/welcome',
          routes: {
            '/welcome': (context) => const Welcome(),
            // '/onbord': (context) => const Onbord(),
            '/register': (context) => const Register(),
            '/login': (context) => const Login(),
            '/home': (context) => Home(),
            // '/chat': (context) => const ChatPage(),
            // '/add': (context) => const Home(),
            // '/promo': (context) => const Promo(),
            // '/notification': (context) => const Notifications(),
            // '/account': (context) => const Account(),
          },
        ));
  }
}
