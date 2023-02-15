import 'package:artifact/Screens/open_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

import "package:artifact/home_page.dart";
import "package:artifact/main.dart";

import 'package:firebase_core/firebase_core.dart';

// To do: Figure out why this page wont render when login button is pressed in
// open_page when you press login

class LoginPage extends StatefulWidget {
  @override

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Material(
    child: Column(
          children: [
        SizedBox(height: 35),
            Row(children: [
          SizedBox(width: 10),
              IconButton(

                  onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return OpenPage();
                })));
                  },
              icon: Icon(Icons.arrow_back)),
            ]),
        SizedBox(height: 65),
            Image.asset("assets/dsdf1.png",
                height: 100, width: 100, alignment: Alignment.topCenter),
            SizedBox(height: 50),
            Text(
              "User Login",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 0, top: 0, right: 190, bottom: 0),
              child: Text(
                'Username',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
        Padding(
              padding: EdgeInsets.only(left: 80, top: 4, right: 80, bottom: 30),
              child: TextField(
            controller: emailController,
            textInputAction: TextInputAction.done,
            cursorColor: Colors.white,
            decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your username',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 0, top: 0, right: 200, bottom: 0),
              child: Text(
                'Password',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
        Padding(
              padding: EdgeInsets.only(left: 80, top: 4, right: 80, bottom: 30),
              child: TextField(
            controller: passwordController,
            textInputAction: TextInputAction.done,
                obscureText: true,
                obscuringCharacter: '*',
            decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your password',
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Color.fromARGB(255, 200, 200, 200),
                textStyle: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                signIn;
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                    return HomePage();
                })));
              },
              child: const Text('Login'),
            ),
          ],
        ),
  );
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }
}

// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Column(
//           children: [
//             const SizedBox(height: 35),
//             Row(children: [
//               const SizedBox(width: 10),
//               IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: const Icon(Icons.arrow_back)),
//             ]),
//             const SizedBox(height: 65),
//             Image.asset("assets/dsdf1.png",
//                 height: 100, width: 100, alignment: Alignment.topCenter),
//             SizedBox(height: 50),
//             Text(
//               "User Login",
//               style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(
//               height: 50,
//             ),
//             const Padding(
//               padding: EdgeInsets.only(left: 0, top: 0, right: 190, bottom: 0),
//               child: Text(
//                 'Username',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(left: 80, top: 4, right: 80, bottom: 30),
//               child: TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Enter your username',
//                 ),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(left: 0, top: 0, right: 200, bottom: 0),
//               child: Text(
//                 'Password',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(left: 80, top: 4, right: 80, bottom: 30),
//               child: TextField(
//                 obscureText: true,
//                 obscuringCharacter: '*',
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Enter your password',
//                 ),
//               ),
//             ),
//             TextButton(
//               style: TextButton.styleFrom(
//                 foregroundColor: Colors.black,
//                 backgroundColor: Color.fromARGB(255, 200, 200, 200),
//                 textStyle: TextStyle(fontSize: 16),
//               ),
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: ((context) {
//                   return HomePage();
//                 })));
//               },
//               child: const Text('Login'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
