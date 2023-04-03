import "package:flutter/material.dart";
import "package:artifact/main.dart";

class OpenPage extends StatefulWidget {
  const OpenPage({super.key});

  @override
  _OpenPageState createState() => _OpenPageState();
}

class _OpenPageState extends State<OpenPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/dsdf1.png",
                    alignment: topcenter,
                    width: width * 3.0 / 4.0,
                    height: width * 3.0 / 4.0),
                Column(
                  children: [
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            minimumSize:
                                Size(width * 1.0 / 2.0, height * 1.0 / 9.0),
                            foregroundColor: Colors.black,
                            backgroundColor: const Color.fromARGB(255, 200, 200, 200),
                            textStyle: const TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            return MainPage(isLogin: isLogin);
                          })));
                        },
                        child: const Text("Login",
                            style: TextStyle(color: Colors.black))),
                    SizedBox(height: height * 1.0 / 18.0),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            minimumSize:
                                Size(width * 1.0 / 2.0, height * 1.0 / 9.0),
                            foregroundColor: Colors.black,
                            backgroundColor: const Color.fromARGB(255, 200, 200, 200),
                            textStyle: const TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold)),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: ((context) {
                            return MainPage(isLogin: !isLogin);
                          })));
                        },
                        child: const Text("Signup",
                            style: TextStyle(color: Colors.black))),
                  ],
                )
              ],
            )));
  }
}