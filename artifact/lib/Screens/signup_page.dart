// import 'package:firebase_auth/firebase_auth.dart';
// import "package:flutter/material.dart";
// import "package:artifact/main.dart";

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) => Material(
//         child: Column(
//           children: [
//             SizedBox(height: 35),
//             Row(children: [
//               SizedBox(width: 10),
//               IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(Icons.arrow_back)),
//             ]),
//             SizedBox(height: 65),
//             Image.asset("assets/dsdf1.png",
//                 height: 100, width: 100, alignment: Alignment.topCenter),
//             SizedBox(height: 50),
//             Text(
//               "User Sign Up",
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
//             Padding(
//               padding: EdgeInsets.only(left: 80, top: 4, right: 80, bottom: 30),
//               child: TextField(
//                 controller: emailController,
//                 textInputAction: TextInputAction.done,
//                 cursorColor: Colors.white,
//                 decoration: const InputDecoration(
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
//             Padding(
//               padding: EdgeInsets.only(left: 80, top: 4, right: 80, bottom: 30),
//               child: TextField(
//                 controller: passwordController,
//                 textInputAction: TextInputAction.done,
//                 obscureText: true,
//                 obscuringCharacter: '*',
//                 decoration: const InputDecoration(
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
//               onPressed: signUp,
//               child: const Text('Sign Up!'),
//             ),
//           ],
//         ),
//       );
//   Future signUp() async {
//     await FirebaseAuth.instance.createUserWithEmailAndPassword(
//       email: emailController.text.trim(),
//       password: passwordController.text.trim(),
//     );
//     // ignore: use_build_context_synchronously
//     Navigator.push(context, MaterialPageRoute(builder: ((context) {
//       return const MainPage(isLogin: true);
//     })));
//   }
// }
