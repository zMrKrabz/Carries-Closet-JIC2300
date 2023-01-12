// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

const AlignmentGeometry topcenter = Alignment.topCenter;
const AlignmentGeometry topleft = Alignment.topLeft;
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
          // body: const Center(
          //   child: Text('Hello World'),
          // body: Center(
          //   child: Text(wordPair.asPascalCase),
          // body: const Center(
          //   child: RandomWords(),
          // ),
          body: Column(
        children: [
          // RandomWords(),

          // IconButton(
          //   icon: Image.asset('assets/images/back.png'),
          //   iconSize: 100,
          //   onPressed: () {},
          // )

          // child: const FlatButton(
          //   onPressed: null,
          //   padding: EdgeInsets.all(0.0),
          //   child: Image.asset('assets/images/back.png')
          // ),

          // const Padding(
          //   padding: EdgeInsets.only(left: 0, top: 0, right: 190, bottom: 0),
          //   // Image.asset('assets/images/back.png', height: 50, width: 50, alignment: topleft),
          //   child: Text(
          //   'Back',
          //   style: TextStyle(fontWeight: FontWeight.bold),
          //   ),
          // ),
          SizedBox(height: 100),
          // Image.asset('assets/images/back.png',
          //     height: 50, width: 50, alignment: topleft),

          Image.asset('assets/images/logo.png',
              height: 200, width: 200, alignment: topcenter),

          const Padding(
            padding: EdgeInsets.only(left: 0, top: 0, right: 190, bottom: 0),
            child: Text(
              'Username',
              // textAlign: TextAlign.left,
              // overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          const Padding(
            // padding: EdgeInsets.symmetric(horizontal: 80, vertical: 4),
            // padding: EdgeInsets.fromLTRB(80, 4, 80, 100),
            padding: EdgeInsets.only(left: 80, top: 4, right: 80, bottom: 30),
            child: TextField(
              decoration: InputDecoration(
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

          const Padding(
            padding: EdgeInsets.only(left: 80, top: 4, right: 80, bottom: 30),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your password',
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 50, top: 0, right: 180, bottom: 0),
            child: Text(
              'Re-enter Password',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 80, top: 4, right: 80, bottom: 30),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Re-enter your password',
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 80, top: 100, right: 80, bottom: 30),
            // child: TextButton(
            //   style: TextButton.styleFrom(
            //     foregroundColor: Colors.black,
            //     backgroundColor: Colors.grey,
            //     textStyle: const TextStyle(fontSize: 20),
            //   ),
            //   onPressed: () {},
            //   child: const Text('Signup'),
            // ),
          ),

          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Color.fromARGB(255, 200, 200, 200),
              textStyle: TextStyle(fontSize: 16),
            ),
            onPressed: () {},
            child: const Text('Signup'),
          ),
          // new Container(
          //     child: ElevatedButton(
          //   child: Text("Signup",
          //       style: TextStyle(color: Colors.black, fontSize: 16)),
          //   onPressed: null,
          // ))
        ],
      )),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}
