import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:artifact/Screens/open_page.dart';
import 'package:artifact/Screens/login_page.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    return MaterialApp (
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(height: height * 1.0 / 13.5),
            Row(
              textDirection: TextDirection.rtl,
              children: [
                SizedBox(width: width * 1.0 /12.0),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(width * 1.0 / 6.0, height * 1.0 / 27.0),
                    foregroundColor: Colors.black,
                    backgroundColor: Color.fromARGB(255, 200, 200, 200),
                    textStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: ((context) {
                      return LoginPage();
                    })));
                  },
                  child: const Text('Logout')
                )
              ]
            ),
            Image.asset("assets/dsdf1.png",
              alignment: Alignment.topCenter,
              width: width * 2.0 / 3.0,
              height: width * 2.0 / 3.0
            ),
            const Text(
              'Welcome!',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: height * 1.0 / 15.0),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: Size(width * 3.0 / 4.0, height * 1.0 / 10.0),
                foregroundColor: Colors.black,
                backgroundColor: Color.fromARGB(255, 200, 200, 200),
                textStyle: const TextStyle(fontSize: 24)),
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: ((context) {
                  return HomePage();
                 })));
              },
              child: const Text('Create a Request')
            ),
            SizedBox(height: height * 1.0 / 40.0),
            Row(
              children: [
                SizedBox(width: width * 1.0 / 8.0),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(width * 11.0 / 32.0, height * 1.0 / 10.0),
                    foregroundColor: Colors.black,
                    backgroundColor: const Color.fromARGB(255, 200, 200, 200),
                    textStyle: const TextStyle(fontSize: 24)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) {
                      return HomePage();
                    })));
                  },
                  child: const Text ('History')
                ),
                SizedBox(width: width * 1.0 / 16.0),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(width * 11.0 / 32.0, height * 1.0 / 10.0),
                    foregroundColor: Colors.black,
                    backgroundColor: const Color.fromARGB(255, 200, 200, 200),
                    textStyle: const TextStyle(fontSize: 24)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: ((context) {
                      return HomePage();
                    })));
                  },
                  child: const Text ('Profile')
                ),
              ]
            )
          ],
        )
      )
    );
  }
}
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // final user = FirebaseAuth.instance.currentUser!; 
//     // above line causing issues, can not figure out

//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Home'),
//       // ),
//       body: Padding(
//         padding: EdgeInsets.all(32),
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: 32),
//             Row(children: [
//               IconButton(
//                   onPressed: () {
//                     FirebaseAuth.instance.signOut();
//                     Navigator.push(context, MaterialPageRoute(builder: ((context) {
//                       return OpenPage();
//                     })));
//                   },
//                   icon: const Icon(Icons.arrow_back)),
//               SizedBox(width: 40),
//               Text(
//                 'Welcome!',
//                 style: TextStyle(fontSize: 32),
//               ),
              
//               // ElevatedButton.icon(
//               //   style: ElevatedButton.styleFrom(
//               //     minimumSize: Size.fromHeight(50),
//               //   ),
//               //   icon: Icon(Icons.arrow_back, size: 32),
//               //   label: Text(
//               //     'Sign Out',
//               //     style: TextStyle(fontSize: 24),
//               //   ),
//               //   onPressed: () {
//               //     FirebaseAuth.instance.signOut();
//               //     Navigator.push(context, MaterialPageRoute(builder: ((context) {
//               //       return OpenPage();
//               //     })));
//               //   } 
//               // ),
//             ],),
//             SizedBox(height: 120),
//             TextButton(
//               style: TextButton.styleFrom(
//                 foregroundColor: Colors.black,
//                 backgroundColor: Color.fromARGB(255, 200, 200, 200),
//                 textStyle: TextStyle(fontSize: 16),
//               ),
//               child: const Text('Make Request'),
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: ((context) {
//                       return HomePage();
//                     })));
//               }
//             )
//             // SizedBox(height: 8),
//             // Text(
//             //   'new user',
//             //   // user.email!,
//             //   style: TextStyle(fontSize: 20),
//             // ),
//             // SizedBox(height: 40)
//           ],
//         ),
//       ),
//     );
//   }
// }