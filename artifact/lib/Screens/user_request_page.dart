import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import "package:artifact/home_page.dart";

import 'package:http/http.dart' as http;
import 'dart:convert';

class UserRequestsPage extends StatefulWidget {
  const UserRequestsPage({super.key});

  @override
  _UserRequestsPageState createState() {
    return _UserRequestsPageState();
  }
}

class _UserRequestsPageState extends State<UserRequestsPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  SizedBox(height: height * 1.0 / 13.0),
                  Stack(alignment: Alignment.centerLeft, children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            iconSize: width * 1.0 / 18.0,
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: ((context) {
                                return const HomePage();
                              })));
                            },
                            icon: const Icon(Icons.arrow_back))),
                    const Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Requests",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.bold),
                        ))
                  ]),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: height * 1.0 / 55.0),
                    child: const Text(
                        "Please contact mamie@carriesclosetofga.org if you want to edit or cancel your requests.",
                        style: TextStyle(
                            fontSize: 13.5, color: Color(0xFF2E2E2E))),
                  ),
                  SizedBox(height: height * 1.0 / 55.0),
                  const RequestWidget(),
                ]))));
  }
}

class RequestWidget extends StatefulWidget {
  const RequestWidget({super.key});

  @override
  _RequestWidgetState createState() {
    return _RequestWidgetState();
  }
}

class _RequestWidgetState extends State<RequestWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String uid = FirebaseAuth.instance.currentUser?.uid ?? "";

    return Card(
      child: FutureBuilder<String>(
          future: parseRequests(uid),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              List<dynamic> decode = json.decode(snapshot.data.toString());
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: decode.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                      child: Card(
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: height * 1.0 / 55.0),
                            child: Column(children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Request #" +
                                              decode[index]['requestno'],
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF2E2E2E)),
                                          textAlign: TextAlign.left,
                                        ),
                                        Text(
                                          decode[index]['date'],
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontStyle: FontStyle.italic,
                                              color: Color(0xFF2E2E2E)),
                                          textAlign: TextAlign.start,
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: null,
                                          style: TextButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                            minimumSize: Size(
                                                width * 11.0 / 42.0,
                                                height * 1.0 / 25.0),
                                            backgroundColor:
                                                const Color(0xFFFFF3C8),
                                          ),
                                          child: Text(decode[index]['status'],
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFFDCB631))),
                                        ),
                                      ],
                                    )
                                  ]),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 1.0 / 12.0,
                                      vertical: height * 1.0 / 55.0),
                                  child: Column(
                                    //single item
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Item #: " + decode[index]['item'],
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF2E2E2E)),
                                        textAlign: TextAlign.left,
                                      ),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Text(
                                                  "Size: ",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xFF808080)),
                                                ),
                                                Text(
                                                  "Gender: ",
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xFF808080)),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  decode[index]['size'],
                                                  textAlign: TextAlign.right,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xFF2E2E2E)),
                                                ),
                                                Text(
                                                  decode[index]['gender'],
                                                  textAlign: TextAlign.right,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xFF2E2E2E)),
                                                ),
                                              ],
                                            ),
                                          ]),
                                    ],
                                  )),
                              Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: height * 1.0 / 50.0),
                                  child: Column(children: [
                                    Text(
                                      "Address: " + decode[index]['address'],
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF2E2E2E)),
                                    ),
                                  ])),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: ((context) {
                                    return const UserRequestsPage();
                                  })));
                                },
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7)),
                                  minimumSize: Size(
                                      width * 11.0 / 42.0, height * 1.0 / 25.0),
                                  backgroundColor: const Color(0xFFC4DBFE),
                                ),
                                child: const Text(
                                  'Delete Request',
                                  style: TextStyle(
                                      fontSize: 12, color: Color(0xFF2E2E2E)),
                                ),
                              ),
                            ])),
                      ),
                    );
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
          }),
    );
  }

  Future<String> parseRequests(String uid) async {
    print('parse requests called');
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    var url = isIOS
        ? Uri.parse('http://127.0.0.1:8080/requests/list')
        : Uri.parse('http://10.0.2.2:8080/requests/list');

    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response.body;
  }
}