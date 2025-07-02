import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/M07/kalkulator.dart';
import 'package:flutter_app/M07/new_screen.dart';
import 'package:flutter_app/M07/siswa_widget.dart';
import 'package:flutter_app/M09/login_screen.dart';
import 'package:flutter_app/M10-A/welcome2_screen.dart';
import 'package:flutter_app/M10-A/welcome_provider.dart';
import 'package:flutter_app/M10/user_provider.dart';
import 'package:flutter_app/M10/welcome_screen.dart';
import 'package:flutter_app/M11/album_screen.dart';
import 'package:flutter_app/M12/toko_provider.dart';
import 'package:flutter_app/M12/toko_screen.dart';
import 'package:flutter_app/M12a/toko2_provider.dart';
import 'package:flutter_app/M12a/toko2_screen.dart';
import 'package:flutter_app/M13/news_detail_provider.dart';
import 'package:flutter_app/M13/news_provider.dart';
import 'package:flutter_app/M13/news_screen.dart';
import 'package:flutter_app/M14a/home_app_screen.dart';
import 'package:flutter_app/M14a/signin_app_screen.dart';
import 'package:flutter_app/M14b/rumah_screen.dart';
import 'package:flutter_app/firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/M15/book_provider.dart';
import 'package:flutter_app/M15/book_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => WelcomeProvider()),

        // tambahkan provider lain
        ChangeNotifierProvider(create: (context) => TokoProvider()),
        ChangeNotifierProvider(create: (context) => Toko2Provider()),

        // provider M13
        ChangeNotifierProvider(create: (context) => NewsProvider()),
        ChangeNotifierProvider(create: (context) => NewsDetailProvider()),
        ChangeNotifierProvider(create: (context) => BookProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isUserNameValid = false;

  @override
  void initState() {
    cekUserValid();
    super.initState();
  }

  cekUserValid() async {
    final prefs = await SharedPreferences.getInstance();
    var username = prefs.getString('username');

    if (username != null) {
      setState(() {
        isUserNameValid = true;
      });
    } else {
      setState(() {
        isUserNameValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BookScreen(),
    );
  }
}
