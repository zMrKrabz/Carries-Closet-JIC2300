import 'package:artifact/Screens/open_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import "package:artifact/main.dart";

import "package:artifact/home_page.dart";

class LoginPage extends StatelessWidget {
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
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
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset("assets/dsdf1.png",
                      height: height * 1.0 / 6.75, 
                      width: height * 1.0 / 6.75, 
                      alignment: Alignment.center
                    ),
                  )
                ]
              ),
              // Row(
              //   children: [
              //     SizedBox(width: width * 1.0 / 24.0),
              //     
              //     Column()
              //     
              //   ],
              // ),
              SizedBox(height: height * 1.0 / 18.0),
              const Text(
                "User Login",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center
              ),
              SizedBox(height: height * 1.0 / 9.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Enter your username'
                  )
                )
              ),
              SizedBox(height: height * 1.0 / 18.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                child: TextField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your password'
                  )
                )
              ),
              SizedBox(height: height * 1.0 / 9.0),
              TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(width * 1.0 / 2.0, height * 1.0 / 13.5),
                  foregroundColor: Colors.black,
                  backgroundColor: Color.fromARGB(255, 200, 200, 200),
                  textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: ((context) {
                    return HomePage();
                  })));
                },
                child: const Text('Login'),
              ),
            ]
          ),
        )
      )
    );
  }
}

//     return MaterialApp(
//       home: Scaffold(
//         body: ListView(
//           children: [
//             Row(
//               children: [
//                 SizedBox(width: width * 1.0 / 24.0),
//                 IconButton(
//                   iconSize: width * 1.0 / 18.0,
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: const Icon(Icons.arrow_back)
//                 ),
//               ],
//             ),
//             Image.asset("assets/dsdf1.png",
//               height: width * 1.0 / 3.0, 
//               width: width * 1.0 / 3.0, 
//               alignment: Alignment.topCenter
//             ),
//             SizedBox(height: height * 1.0 / 18.0),
//             const Text(
//               "User Login",
//               style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center
//             ),
//             SizedBox(height: height * 1.0 / 18.0),
//             Container(alignment: Alignment.center,
//             width: )
//             Column(
//               children: const [
//                 Padding(
//                   padding: EdgeInsets.only(left: 0, top: 0, right: 190, bottom: 0),
//                   child: Text(
//                     'Username',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 80, top: 4, right: 80, bottom: 30),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'Enter your username',
//                     ),
//                   ),
//                 ),
//               ]
//             ),
//             Column(
//               children: const[
//                 Padding(
//                   padding: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 0),
//                   child: Text(
//                     'Password',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 80, top: 4, right: 80, bottom: 30),
//                   child: TextField(
//                     obscureText: true,
//                     obscuringCharacter: '*',
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       hintText: 'Enter your password',
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               alignment: Alignment.center,
//               width: width * 1.0 / 6.0,
//               height: height * 1.0 / 9.0,
//               child: TextButton(
//                 style: TextButton.styleFrom(
//                   foregroundColor: Colors.black,
//                   backgroundColor: Color.fromARGB(255, 200, 200, 200),
//                   textStyle: TextStyle(fontSize: 16),
//                 ),
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: ((context) {
//                     return HomePage();
//                   })));
//               },
//                 child: const Text('Login'))
//             )
//           ]
//         )
//       )
//     );
//   }
// }
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
