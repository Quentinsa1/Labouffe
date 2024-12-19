import 'package:flutter/material.dart';
import 'package:labouffe/screen/homepage.dart';
import 'package:labouffe/screen/panier.dart';
import '';

void main() {
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner : false,
          home: const CartPage()
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner : false,
      //theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      theme: ThemeData.light(),  // Le thème clair
      darkTheme: ThemeData.dark(), // Le thème sombre
      themeMode: ThemeMode.system,
      home: HomePage(
        isDarkMode: isDarkMode,
        onThemeToggle: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
      ),
    );
  }
}
