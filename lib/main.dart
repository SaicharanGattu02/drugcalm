import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:drugcalm/providers/AddressProvider.dart';
import 'package:drugcalm/providers/BlockedProvider.dart';
import 'package:drugcalm/providers/CartProvider.dart';
import 'package:drugcalm/providers/CategoriesProvider.dart';
import 'package:drugcalm/providers/ConnectivityProviders.dart';
import 'package:drugcalm/providers/LanguageProvider.dart';
import 'package:drugcalm/providers/ProductDetailsProvider.dart';
import 'package:drugcalm/providers/ShippingDetailsProvider.dart';
import 'package:drugcalm/providers/UserDetailsProvider.dart';
import 'package:drugcalm/providers/ProductListProvider.dart';
import 'package:drugcalm/providers/WishlistProvider.dart';
import 'package:drugcalm/utils/Preferances.dart';
import 'package:drugcalm/utils/ThemeProvider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'Screens/Spalsh.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
            apiKey: "AIzaSyDShmgh6N_1u5M7gKpi6Vz7KdltNN2Tsy4",
            appId: "1:90500457023:android:07d5f4d9c3d045d60dce8a",
            messagingSenderId: "90500457023",
            projectId: "drugcalm-b58c5",
          ),
        )
      : await Firebase.initializeApp();

  FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);

  const fatalError = true;
  // Non-async exceptions
  FlutterError.onError = (errorDetails) {
    if (fatalError) {
      // If you want to record a "fatal" exception
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      // ignore: dead_code
    } else {
      // If you want to record a "non-fatal" exception
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    }
  };
  // Async exceptions
  PlatformDispatcher.instance.onError = (error, stack) {
    if (fatalError) {
      // If you want to record a "fatal" exception
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      // ignore: dead_code
    } else {
      // If you want to record a "non-fatal" exception
      FirebaseCrashlytics.instance.recordError(error, stack);
    }
    return true;
  };

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  if (Platform.isAndroid) {
    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
      print("Androidfbstoken:{$token} ");
      PreferenceService().saveString("fbstoken", token!);
      // toast(BuildContext , token);
    });
  } else {
    FirebaseMessaging.instance.getToken().then((value) {
      String? token = value;
      print("IOSfbstoken:{$token}");
      PreferenceService().saveString("fbstoken", token!);
      // toast(BuildContext , token);
    });
  }

  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: false,
  );

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: false,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  const InitializationSettings initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/drugclam'),
      iOS: DarwinInitializationSettings());

  flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse:
        (NotificationResponse notificationResponse) async {},
  );

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      print('A new message received title: ${notification.title}');
      print('A new message received body: ${notification.body}');
      print('RemoteMessage data: ${message.data.toString()}');

      // Show a local notification (optional)
      showNotification(notification, android, message.data);
    }
  });

  // Also handle any interaction when the app is in the background via a
  // Stream listener
  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    // _handleMessage(message);
    // print("onMessageOpenedApp:${message.data['type']}");
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // debugInvertOversizedImages = true;
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  FlutterError.onError = (FlutterErrorDetails details) {
    // Log the error details to a logging service or print them
    print("Errrrrrrrrrr:${details.exceptionAsString()}");
    // Optionally report the error to a remote server
  };

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
          create: (context) => UserDetailsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddressListProvider(
              // shippingDetailsProvider: Provider.of<ShippingDetailsProvider>(context, listen: false),
              ),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductListProvider(),
        ),
        ChangeNotifierProxyProvider<ProductListProvider, WishlistProvider>(
          create: (context) =>
              WishlistProvider(context.read<ProductListProvider>()),
          update: (context, productListProvider, wishlistProvider) =>
              wishlistProvider!..updateProductListProvider(productListProvider),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ShippingDetailsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductDetailsProvider(),
        ),
        ChangeNotifierProxyProvider<ProductDetailsProvider, BlockListProvider>(
          create: (context) => BlockListProvider(context.read<ProductDetailsProvider>()),
          update: (context, productDetailsprovider, blockListProvider) =>
          blockListProvider!..updateProductDetailsProvider(productDetailsprovider),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  if (notification != null && android != null) {
    print('A new message received title: ${notification.title}');
    print('A new message received body: ${notification.body}');
    print('RemoteMessage data: ${message.data.toString()}');
  }
}

// Function to display local notifications
void showNotification(RemoteNotification notification,
    AndroidNotification android, Map<String, dynamic> data) async {
  AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'skil_channel_id',
    'skil_channel_name',
    importance: Importance.max,
    priority: Priority.high,
    playSound: false,
    icon: '@mipmap/drugclam',
  );
  NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    notification.hashCode,
    notification.title,
    notification.body,
    platformChannelSpecifics,
    payload: jsonEncode(data), // Convert payload data to String
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ChangeNotifierProvider(
      create: (_) => LanguageProvider(),
      child: Consumer<LanguageProvider>(builder: (context, languageProvider, _) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Drug Calm',
            theme: themeProvider.themeData,
            locale: context.watch<LanguageProvider>().locale,  // Use the locale from the LanguageProvider
            supportedLocales: [
              Locale('en'),
              Locale('hi'),
              Locale('te')
            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: Splash());
      }),
    );
  }
}
