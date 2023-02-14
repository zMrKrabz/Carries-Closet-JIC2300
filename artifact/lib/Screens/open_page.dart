import "package:flutter/material.dart";
import "package:artifact/main.dart";
import "package:artifact/Screens/login_page.dart";
import 'package:artifact/Screens/signup_page.dart';

class OpenPage extends StatefulWidget {
  @override
  _OpenPageState createState() => _OpenPageState();
}

class _OpenPageState extends State<OpenPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => 
    Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 100,
                ),
                Image.asset("assets/dsdf1.png",
                    height: 350, width: 350, alignment: topcenter),
                SizedBox(
                  height: 100,
                ),
                Column(children: [
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          minimumSize: Size(280, 80),
                          textStyle: TextStyle(fontSize: 28)),
                          onPressed: () {
                            Navigator.push(context,
                            MaterialPageRoute(builder: ((context) => MainPage(isLogin: isLogin)
                          )));
                        },
                      child:
                          Text("Login", style: TextStyle(color: Colors.black))),
                  SizedBox(height: 50),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          minimumSize: Size(280, 80),
                          textStyle: TextStyle(fontSize: 28)),
                          onPressed: () => {
                            Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                              return MainPage(isLogin: !isLogin);
                            })))
                          },
                      child: const Text(
                        "Signup",
                        style: TextStyle(color: Colors.black),
                  )),
                ])
              ],
            )));
  }
