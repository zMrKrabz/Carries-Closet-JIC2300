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
            SizedBox(height: height * 1.0 / 18.0),
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
                  child: Image.asset("assets/dsdf1.png",
                      height: height * 1.0 / 6.75,
                      width: height * 1.0 / 6.75,
                      alignment: Alignment.center))
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
            // children = <Widget>[
            //   const Icon(
            //     Icons.check_circle_outline,
            //     color: Colors.green,
            //     size: 60,
            //   ),
            //   Padding(
            //     padding: const EdgeInsets.only(top: 16),
            //     child: Text('Result: ${snapshot.data}'),
            //   ),
            // ];

            List<dynamic> decode = json.decode(snapshot.data.toString());
            return ListView.builder(
                shrinkWrap: true,
                itemCount: decode.length,
                itemBuilder: (context, index) {
                  return ListTile(
                      title: Text(decode[index]['id']),
                      subtitle: Text(decode[index]['email']),
                      trailing: Icon(Icons.more_vert));
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
}
