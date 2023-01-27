import 'package:artifact/Screens/open_page.dart';
import 'package:flutter/material.dart';

const AlignmentGeometry topcenter = Alignment.topCenter;
const AlignmentGeometry topleft = Alignment.topLeft;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OpenPage(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        children: [
          SizedBox(height: 35),
          Row(children: [
            SizedBox(width: 10),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
          ]),
          SizedBox(height: 65),
          Image.asset("assets/dsdf1.png",
              height: 200, width: 200, alignment: topcenter),

          const Padding(
            padding: EdgeInsets.only(left: 0, top: 0, right: 190, bottom: 0),
            child: Text(
              'Username',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          const Padding(
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
              obscureText: true,
              obscuringCharacter: '*',
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
              obscureText: true,
              obscuringCharacter: '*',
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
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return HomeScreen();
              })));
            },
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
