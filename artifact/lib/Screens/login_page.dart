import 'package:artifact/Screens/open_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import "package:artifact/Screens/forgot_password.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SingleChildScrollView(
            child: Column(children: [
          SizedBox(height: height * 1.0 / 18.0),
          Stack(alignment: Alignment.topLeft, children: [
            Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    iconSize: width * 1.0 / 18.0,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return const OpenPage();
                      })));
                    },
                    icon: const Icon(Icons.arrow_back))),
            Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset("assets/dsdf1.png",
                    height: height * 1.0 / 4.0,
                    width: height * 1.0 / 4.0,
                    alignment: Alignment.center))
          ]),
          SizedBox(height: height * 1.0 / 9.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
            child: TextField(
              controller: emailController,
              textInputAction: TextInputAction.done,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF1F1F1),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xFFF1F1F1)),
                    borderRadius: BorderRadius.circular(10)),
                labelText: 'Email',
                hintText: 'Enter your email',
              ),
            ),
          ),
          SizedBox(height: height * 1.0 / 18.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
            child: TextField(
              controller: passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF1F1F1),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 1, color: Color(0xFFF1F1F1)),
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
              child: TextButton(
                  child: const Text('Forgot Password?'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) {
                      return const ForgotPassword();
                    })));
                  })),
          SizedBox(height: height * 2.0 / 27.0),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
              child: TextButton(
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size(width / 2, height * 1.0 / 16),
                    backgroundColor: const Color(0xFF7EA5F4),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                onPressed: signIn,
                child: const Text(
                  'Login',
                  style: TextStyle(color: Color(0xFFF9F9F9)),
                ),
              )),
        ])));
  }

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

