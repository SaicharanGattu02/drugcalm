
import 'package:drugcalm/Authentication/SignIn.dart';
import 'package:drugcalm/Screens/Home.dart';
import 'package:drugcalm/Screens/Spalsh.dart';
import 'package:drugcalm/Screens/dashboard.dart';
import 'package:drugcalm/utils/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(AppTheme.device),
        ),
        ChangeNotifierProvider(
          create: (context) => LanguageProvider(), // Add LanguageProvider here
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
      home:Dashbord()
    );
  }
}
