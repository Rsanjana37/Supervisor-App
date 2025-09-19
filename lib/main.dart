import 'package:supervisor/auth/login_with_email.dart';
import 'package:supervisor/constants/app_text_themes.dart';
//import 'package:crowdsource/firebaseMessaging/firebase_api.dart';
//import 'package:crowdsource/firebase_request_permission.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: "supervisor",
    options: const FirebaseOptions(
      apiKey: "AIzaSyBlg82az5zld6jAFI6vsU97PPzSIF74cEE",
      appId: "1:130574865111:android:a3d27d4ce2cee820e45692",
      messagingSenderId: "130574865111",
      projectId: "supervisor-40772",
    ),
  );

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
      home: LoginWithEmail(),
    );
  }
}
