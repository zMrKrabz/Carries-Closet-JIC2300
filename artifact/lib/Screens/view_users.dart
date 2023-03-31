//import 'dart:html';

import 'dart:ffi';

import 'package:artifact/Screens/open_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import "package:artifact/main.dart";
import 'package:firebase_core/firebase_core.dart';

import 'package:artifact/home_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
          child: Column(children: [
            SizedBox(height: height * 1.0 / 13.5),
            Stack(alignment: Alignment.topLeft, children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      iconSize: width * 1.0 / 18.0,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return HomePage();
                        })));
                      },
                      icon: const Icon(Icons.arrow_back))),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(children: [
                    SizedBox(height: height * 1.0 / 100.0),
                    const Text('Users',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold))
                  ])
                  // alignment: Alignment.bottomCenter,
                  // child: Image.asset("assets/dsdf1.png",
                  //     height: height * 1.0 / 6.75,
                  //     width: height * 1.0 / 6.75,
                  //     alignment: Alignment.center)
                  )
            ]),
            ViewUsers(),
          ]),
        )));
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

    return DefaultTextStyle(
      style: Theme.of(context).textTheme.displayMedium!,
      textAlign: TextAlign.center,
      child: FutureBuilder<String>(
        future: parseUsers(), // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            List<dynamic> decode = json.decode(snapshot.data.toString());
            return ListView.builder(
                padding: EdgeInsets.all(20.0),
                shrinkWrap: true,
                itemCount: decode.length,
                itemBuilder: (context, index) {
                  return Card(
                      elevation: 0,
                      child: ListTile(
                          title: Text(decode[index]['id']),
                          subtitle: Text(decode[index]['email']),
                          visualDensity:
                              VisualDensity(vertical: 1.0, horizontal: 0.25),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  bottomLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                  bottomRight: Radius.circular(16))),
                          tileColor: Color.fromRGBO(238, 224, 255, 1.0),
                          trailing: Icon(Icons.more_vert),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: ((context) {
                              return IndividualUserPage(context, decode, index);
                            })));
                          }));
                });
          } else if (snapshot.hasError) {
            children = <Widget>[
              const Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text('Error: ${snapshot.error}'),
              ),
            ];
          } else {
            children = const <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text('Awaiting result...'),
              ),
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }

  Widget IndividualUserPage(
      BuildContext context, List<dynamic> decode, int index) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    //String user = decode[index];

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Container(
                alignment: Alignment.center,
                child: Column(children: [
                  SizedBox(height: height * 1.0 / 18.0),
                  Stack(alignment: Alignment.topLeft, children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            iconSize: width * 1.0 / 18.0,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back))),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset("assets/dsdf1.png",
                            height: width * 1.0 / 2.0,
                            width: width * 1.0 / 2.0,
                            alignment: Alignment.center))
                  ]),
                  SizedBox(height: height * 1.0 / 24.0),
                  Row(
                    children: [
                      SizedBox(width: width * 1.0 / 20.0),
                      const Text('Name: ',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: width * 1.0 / 10.0),
                      Text(decode[index]['id'], style: TextStyle(fontSize: 15))
                    ],
                  ),
                  SizedBox(height: height * 1.0 / 36.0),
                  Row(
                    children: [
                      SizedBox(width: width * 1.0 / 20.0),
                      const Text('Email Address:  ',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: width * 1.0 / 10.0),
                      Text(decode[index]['email'],
                          style: TextStyle(fontSize: 15))
                    ],
                  ),
                  SizedBox(height: height * 1.0 / 36.0),
                  Row(children: [
                    SizedBox(width: width * 1.0 / 20.0),
                    Text('Phone Number:  ',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  ]),
                  Row(
                    children: [
                      SizedBox(width: width * 1.0 / 10.0),
                      Text('*insert # here*', style: TextStyle(fontSize: 15))
                    ],
                  ),
                  SizedBox(height: height * 1.0 / 36.0),
                  Row(
                    children: [
                      SizedBox(width: width * 1.0 / 20.0),
                      Text('County Serving:  ',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: width * 1.0 / 10.0),
                      Text('*insert county here*',
                          style: TextStyle(fontSize: 15))
                    ],
                  ),
                  SizedBox(height: height * 1.0 / 36.0),
                  Row(
                    children: [
                      SizedBox(width: width * 1.0 / 20.0),
                      Text('Delivery Address:  ',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: width * 1.0 / 10.0),
                      Text('*insert address here*',
                          style: TextStyle(fontSize: 15))
                    ],
                  ),
                  SizedBox(height: height * 1.0 / 36.0),
                  Row(
                    children: [
                      SizedBox(width: width * 1.0 / 20.0),
                      Text('City:  ',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: width * 1.0 / 10.0),
                      Text('*insert city here*', style: TextStyle(fontSize: 15))
                    ],
                  ),
                  SizedBox(height: height * 1.0 / 36.0),
                  Row(
                    children: [
                      SizedBox(width: width * 1.0 / 20.0),
                      Text('Zip Code:  ',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: width * 1.0 / 10.0),
                      Text('*insert ZC here*', style: TextStyle(fontSize: 15))
                    ],
                  ),
                  // SizedBox(height: height * 1.0 / 18.0),
                  // TextButton(
                  //   style: TextButton.styleFrom(
                  //     // minimumSize: Size(width * 1.0 / 2.0, height * 1.0 / 13.5),
                  //     foregroundColor: Colors.black,
                  //     backgroundColor: Color.fromARGB(255, 200, 200, 200),
                  //     textStyle: const TextStyle(
                  //         fontSize: 20, fontWeight: FontWeight.bold),
                  //   ),
                  //   onPressed: () {
                  //   },
                  //   child: const Text('Delete'),
                  // ),

                  // IconButton(
                  //     iconSize: width * 1.0 / 18.0,
                  //     onPressed: () {
                  //       Navigator.push(context,
                  //           MaterialPageRoute(builder: ((context) {
                  //         // return AdminHomePage();
                  //       })));
                  //     },
                  //     icon: const Icon(Icons.arrow_back)),

                  SizedBox(height: height * 1.0 / 36.0),
                  Row(
                    children: [
                      SizedBox(width: width * 1.0 / 20.0),
                      const Text('permissions:  ',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold))
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: width * 1.0 / 10.0),
                      Text(decode[index]['permissions'],
                          style: TextStyle(fontSize: 15))
                    ],
                  ),

                  SizedBox(height: height * 1.0 / 18.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            makeAdmin(decode[index]['id']);
                            Navigator.pop(context);
                          },
                          child: const Text('Make administrator'),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {
                            deleteUser(decode[index]['id']);
                            Navigator.pop(context);
                          },
                          child: Text('Delete'),
                        ),
                        const SizedBox(width: 8),
                      ])
                ]))));
  }

  Future<String> parseUsers() async {
    print('parse users called');
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    var url = isIOS
        ? Uri.parse('http://127.0.0.1:8080/users/list')
        : Uri.parse('http://10.0.2.2:8080/users/list');

    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response.body;
  }

  void makeAdmin(String id) async {
    //need to implement logic of make admin button greyed out if they're alrdy admin
    print('make admin called');
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    var url = isIOS
        ? Uri.parse('http://127.0.0.1:8080/users/update?id=' + id)
        : Uri.parse('http://10.0.2.2:8080/users/update?id=' + id);

    var response = await http.put(url, body: {'permissions': 'true'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  void deleteUser(String id) async {
    print('delete user called');
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    var url = isIOS
        ? Uri.parse('http://127.0.0.1:8080/users/remove?id=' + id)
        : Uri.parse('http://10.0.2.2:8080/users/remove?id=' + id);

    var response = await http.delete(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
