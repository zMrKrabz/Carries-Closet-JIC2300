import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:artifact/Screens/open_page.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser!; 
    // above line causing issues, can not figure out

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home'),
      // ),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 32),
            Row(children: [
              IconButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.push(context, MaterialPageRoute(builder: ((context) {
                      return OpenPage();
                    })));
                  },
                  icon: const Icon(Icons.arrow_back)),
              SizedBox(width: 40),
              Text(
                'Welcome!',
                style: TextStyle(fontSize: 32),
              ),
              
              // ElevatedButton.icon(
              //   style: ElevatedButton.styleFrom(
              //     minimumSize: Size.fromHeight(50),
              //   ),
              //   icon: Icon(Icons.arrow_back, size: 32),
              //   label: Text(
              //     'Sign Out',
              //     style: TextStyle(fontSize: 24),
              //   ),
              //   onPressed: () {
              //     FirebaseAuth.instance.signOut();
              //     Navigator.push(context, MaterialPageRoute(builder: ((context) {
              //       return OpenPage();
              //     })));
              //   } 
              // ),
            ],),
            SizedBox(height: 120),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Color.fromARGB(255, 200, 200, 200),
                textStyle: TextStyle(fontSize: 16),
              ),
              child: const Text('Make Request'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                      return HomePage();
                    })));
              }
            )
            // SizedBox(height: 8),
            // Text(
            //   'new user',
            //   // user.email!,
            //   style: TextStyle(fontSize: 20),
            // ),
            // SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}