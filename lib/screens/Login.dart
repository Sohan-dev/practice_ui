import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.all(10.0),
              color: Colors.white,
              alignment: Alignment.center,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
                    child: Text(
                      'Welcome $email',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 200.0,
                    width: double.infinity,
                    child: const Image(
                      image: AssetImage('assets/images/login_img.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter email',
                        label: Text('Email'),
                      ),
                      onChanged: (value) {
                        email = value;
                        setState(() {});
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email is required';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Enter password',
                        label: Text('Password'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is required';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Material(
                    color: Colors.deepPurple,
                    borderRadius: !changeButton
                        ? BorderRadius.circular(8.0)
                        : BorderRadius.circular(25.0),
                    child: InkWell(
                      onTap: () => login(context),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        height: 50.0,
                        width: !changeButton ? 150.0 : 50,
                        alignment: Alignment.center,
                        child: changeButton
                            ? const Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : const Text(
                                'Login',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    color: Colors.white),
                              ),
                      ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.blue,
                    onTap: () {
                      {
                        Navigator.pushNamed(context, MyRoutes.signupRoute);
                      }
                    },
                    enableFeedback: true,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        child: const Text(
                          'No account yet? Signup',
                          style: TextStyle(fontSize: 15.0, color: Colors.blue),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
