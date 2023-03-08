//import 'dart:html';

import 'package:artifact/Screens/open_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import "package:artifact/main.dart";
import 'package:firebase_core/firebase_core.dart';

import 'package:artifact/home_page.dart';

class ViewUsersPage extends StatefulWidget {
  const ViewUsersPage({super.key});

  @override
  _ViewUsersPageState createState() {
    return _ViewUsersPageState();
  }
}

class _ViewUsersPageState extends State<ViewUsersPage> {
  
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                        Navigator.push(context, MaterialPageRoute(builder: ((context) { 
                          return HomePage();
                        })));
                      },
                      icon: const Icon(Icons.arrow_back)
                    )
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset("assets/dsdf1.png",
                      height: height * 1.0 / 6.75,
                      width: height * 1.0 / 6.75,
                      alignment: Alignment.center
                    )
                  )
                ]
              ),
              ViewUsers(),
            ]
          ),
        )
      )
    );
  }
}

class ViewUsers extends StatefulWidget {
  const ViewUsers({super.key});

  @override
  _ViewUsersState createState() {
    return _ViewUsersState();
  }
}

class _ViewUsersState extends State<ViewUsers> {
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          child: ListTile(
            title: Text("George Orwell"),
            subtitle: Text("georgewell@gmail.com"),
            trailing: Icon(Icons.more_vert),
            onTap: () {
              Navigator.push(context,
                MaterialPageRoute(builder: ((context) {
                  return IndividualUserPage(context);
              })));
            }
          ),
        ),
        Card(
          child: ListTile(
            title: Text("Mary Shelley"),
            subtitle: Text("mshelley@gmail.com"),
            trailing: Icon(Icons.more_vert),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return IndividualUserPage(context);
              })));
            }
          ),
        )
      ],
    );
  }

  Widget IndividualUserPage(BuildContext build) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
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
                    )
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset("assets/dsdf1.png",
                      height: width * 1.0 / 2.0,
                      width: width * 1.0 / 2.0,
                      alignment: Alignment.center
                    )
                  )
                ]
              ),
              SizedBox(height: height * 1.0 / 24.0),
              Row(
                children: [
                  SizedBox(width: width * 1.0 / 20.0),
                  Text(
                    'Name:  ',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(width: width * 1.0 / 10.0),
                  Text(
                    '*insert name here*',
                    style: TextStyle(fontSize: 15)
                  )
                ],
              ),
              SizedBox(height: height * 1.0 / 36.0),
              Row(
                children: [
                  SizedBox(width: width * 1.0 / 20.0),
                  Text(
                    'Email Address:  ',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(width: width * 1.0 / 10.0),
                  Text(
                    '*insert EA here*',
                    style: TextStyle(fontSize: 15)
                  )
                ],
              ),
              SizedBox(height: height * 1.0 / 36.0),
              Row(
                children: [
                  SizedBox(width: width * 1.0 / 20.0),
                  Text(
                    'Phone Number:  ',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
                  ),
                ]
              ),
              Row(
                children: [
                  SizedBox(width: width * 1.0 / 10.0),
                  Text(
                    '*insert # here*',
                    style: TextStyle(fontSize: 15)
                  )
                ],
              ),
              SizedBox(height: height * 1.0 / 36.0),
              Row(
                children: [
                  SizedBox(width: width * 1.0 / 20.0),
                  Text(
                    'County Serving:  ',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(width: width * 1.0 / 10.0),
                  Text(
                    '*insert county here*',
                    style: TextStyle(fontSize: 15)
                  )
                ],
              ),
              SizedBox(height: height * 1.0 / 36.0),
              Row(
                children: [
                  SizedBox(width: width * 1.0 / 20.0),
                  Text(
                    'Delivery Address:  ',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(width: width * 1.0 / 10.0),
                  Text(
                    '*insert address here*',
                    style: TextStyle(fontSize: 15)
                  )
                ],
              ),
              SizedBox(height: height * 1.0 / 36.0),
              Row(
                children: [
                  SizedBox(width: width * 1.0 / 20.0),
                  Text(
                    'City:  ',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(width: width * 1.0 / 10.0),
                  Text(
                    '*insert city here*',
                    style: TextStyle(fontSize: 15)
                  )
                ],
              ),
              SizedBox(height: height * 1.0 / 36.0),
              Row(
                children: [
                  SizedBox(width: width * 1.0 / 20.0),
                  Text(
                    'Zip Code:  ',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)
                  )
                ],
              ),
              Row(
                children: [
                  SizedBox(width: width * 1.0 / 10.0),
                  Text(
                    '*insert ZC here*',
                    style: TextStyle(fontSize: 15)
                  )
                ],
              ),
            ]
          )
        )
      )
    );
  }
}
