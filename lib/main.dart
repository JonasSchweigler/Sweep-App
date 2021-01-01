import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shareweb/utilities/constants.dart';
import 'StartScreens/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ThemeProvider(
      initTheme: kDarkTheme,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Sweep',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primaryColor: Colors.teal,
              primarySwatch: Colors.teal,
              textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
                bodyText1:
                    GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: WelcomePage(),
          );
        },
      ),
    );
  }
}