import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice_ui/screens/Home.dart';
import 'package:practice_ui/screens/Login.dart';
import 'package:practice_ui/screens/Signup.dart';
import 'package:practice_ui/utils/routes.dart';
import 'package:practice_ui/widget/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightThemeData(context),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(brightness: Brightness.light),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        '/': (context) => Home(),
        MyRoutes.loginRoute: (context) => Login(),
        MyRoutes.homeRoute: (context) => Home(),
        MyRoutes.signupRoute: (context) => Signup(),
      },
    );
  }
}
