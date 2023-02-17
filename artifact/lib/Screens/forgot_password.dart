import 'package:artifact/Screens/open_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import "package:artifact/main.dart";
import "package:artifact/Screens/login_page.dart";

import "package:artifact/home_page.dart";
import "package:artifact/main.dart";

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Material(
      child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height * 1.0 / 18.0),
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      iconSize: width * 1.0 / 18.0,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: ((context) {
                          return LoginPage();
                        })));
                      },
                      icon: const Icon(Icons.arrow_back)
                    )
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      "assets/dsdf1.png",
                      height: height * 1.0 / 6.75,
                      width: height * 1.0  / 6.75,
                      alignment: Alignment.center
                    )
                  )
                ]
              ),
              SizedBox(height: height * 1.0 / 5.0),
              Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
              child: const TextField(
                //controller: passwordController,
                textInputAction: TextInputAction.done,
                // obscureText: true,
                // obscuringCharacter: '*',
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email Address',
                  hintText: 'Enter your email address',
                ),
              ),
            ),
            ]
          )
        )
    );
  }
}