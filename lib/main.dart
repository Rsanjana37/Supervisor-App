import 'package:supervisor/auth/login_screen.dart';
import 'package:supervisor/constants/app_text_themes.dart';
//import 'package:crowdsource/firebaseMessaging/firebase_api.dart';
//import 'package:crowdsource/firebase_request_permission.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//
//// ✅ TOP-LEVEL handler
//@pragma('vm:entry-point')
//Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//  await Firebase.initializeApp();
//  debugPrint('Background message ID: ${message.messageId}');
//  debugPrint('Title: ${message.notification?.title}');
//  debugPrint('Body: ${message.notification?.body}');
//}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   name: "crowdsource",
  //   options: const FirebaseOptions(
  //     apiKey: "AIzaSyD4UWMsla3jJc9cx8o1F3YxSH5adrPK1So",
  //     appId: "1:198611414016:android:cdfecc8b771098a43c7ce5",
  //     messagingSenderId: "198611414016",
  //     projectId: "crowdsource-d9375",
  //   ),
  // );

  // ✅ Register the background handler BEFORE runApp
  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  // ✅ Ask user for notification permission (Android 13+ / iOS)
  //await requestNotificationPermission();

  // ✅ Initialize other Firebase Messaging config (foreground listeners, token, etc.)

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supervisor App',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: AppTextThemes.lightTextTheme,
      ),

      localizationsDelegates: [
        //AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // locale: Locale('hi'),
      // supportedLocales: [Locale('en'), Locale('hi')],
      home: LoginScreen(),
    );
  }
}
