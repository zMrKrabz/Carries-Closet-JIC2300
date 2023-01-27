import "package:flutter/material.dart";
import "package:artifact/main.dart";
import "package:artifact/Screens/login_page.dart";

class OpenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            MaterialPageRoute(builder: ((context) {
                          return LoginPage();
                        })));
                      },
                      child:
                          Text("Login", style: TextStyle(color: Colors.black))),
                  SizedBox(height: 50),
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          minimumSize: Size(280, 80),
                          textStyle: TextStyle(fontSize: 28)),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return MyApp();
                        })));
                      },
                      child: Text(
                        "Signup",
                        style: TextStyle(color: Colors.black),
                      )),
                ])
              ],
            )));
  }
}
