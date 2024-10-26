import 'package:drugcalm/Screens/Spalsh.dart';
import 'package:drugcalm/utils/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(darkTheme),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Drug Calm',
      theme: themeProvider.themeData,
      home:  Splash() // Ensure Splash is the correct widget name
    );
  }
}

