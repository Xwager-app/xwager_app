import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xwager/screens/carousel.dart';
import 'package:xwager/screens/welcome/first.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromRGBO(2, 43, 105, 1),
  ),
  textTheme: GoogleFonts.nunitoSansTextTheme().copyWith(
    titleLarge: const TextStyle(
        decoration: TextDecoration.none, fontWeight: FontWeight.bold),
    bodyMedium: const TextStyle(decoration: TextDecoration.none),
  ),
  scaffoldBackgroundColor: const Color.fromRGBO(249, 249, 249, 1),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((fn) {});

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xwager',
      theme: theme,
      home: const First(),
    );
  }
}
