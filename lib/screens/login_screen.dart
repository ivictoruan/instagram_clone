// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Instagram',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: 32.0),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height: 16.0),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height: 16.0),
              RaisedButton(
                onPressed: () {},
                child: const Text('Login'),
              ),
            ],
          ),
          ),
        ),
      );
  }
}