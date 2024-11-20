
import 'package:drugcalm/Authentication/ForgotPasswordScreen.dart';
import 'package:drugcalm/Registration/BasicInformation.dart';
import 'package:drugcalm/Registration/BusinessDetails.dart';
import 'package:drugcalm/Registration/Registration.dart';
import 'package:drugcalm/providers/AddressProvider.dart';
import 'package:drugcalm/providers/CategoriesProvider.dart';
import 'package:drugcalm/providers/ConnectivityProviders.dart';
import 'package:drugcalm/utils/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Authentication/SignIn.dart';
import 'Screens/ProfileScreen.dart';
import 'Screens/Spalsh.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConnectivityProviders(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(AppTheme.light),
        ),
        ChangeNotifierProvider(
          create: (context) => LanguageProvider(), // Add LanguageProvider here
        ),
        ChangeNotifierProvider(
          create: (context) => CategoriesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddressListProvider(
            // shippingDetailsProvider: Provider.of<ShippingDetailsProvider>(context, listen: false),
          ),
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
        home:Splash()
    );
  }
}
