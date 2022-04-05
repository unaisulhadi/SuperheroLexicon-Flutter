import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superhero_flutter/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
    ));
    return MaterialApp(
        title: 'Superhero Lexicon',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // primarySwatch: Color(0xFF000000),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color(0xFFfacc17),
            onSecondary: const Color(0xFF021019),
            primary: const Color(0xFF012339),
            onPrimary: const Color(0xFFfacc17),
            background: const Color(0xFF021725),
          ),
          primaryColor: const Color(0xFF012339),
          backgroundColor: const Color(0xFF021725),
          textTheme: GoogleFonts.spaceGroteskTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: const HomeScreen());
  }
}
