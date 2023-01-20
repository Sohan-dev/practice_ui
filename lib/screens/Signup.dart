import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:practice_ui/utils/routes.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  signup(BuildContext context) async {
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
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 50.0, bottom: 50.0),
                    child: Text(
                      'Here we need some details about you',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter Name',
                        label: Text('Name'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Name is required';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        // email = value;
                        // setState(() {});
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter email',
                        label: Text('Email'),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email is required';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        // email = value;
                        // setState(() {});
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Enter confirm password',
                        label: Text('Confirm Password'),
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
                      onTap: () => signup(context),
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
                                'Signup',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    color: Colors.white),
                              ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    enableFeedback: true,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        child: const Text(
                          'Already have account? Login',
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
