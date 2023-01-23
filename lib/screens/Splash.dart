import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:practice_ui/screens/Home.dart';
import 'package:practice_ui/screens/Login.dart';
import 'package:practice_ui/utils/routes.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Login())));

    // Timer(const Duration(seconds:2),(() => Navigator.pushReplacement(context, MyRoutes.homeRoute)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/travelling.png'),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Welcome',
              textScaleFactor: 1.3,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
          )
        ],
      ),
    );
  }
}
