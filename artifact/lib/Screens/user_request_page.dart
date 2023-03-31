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
                  RequestWidget(),
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

// class _RequestWidgetState extends State<RequestWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: FutureBuilder<String>(
//           future: parseRequests(),
//           builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
//             List<Widget> children;
//             if (snapshot.hasData) {
//               List<dynamic> decode = json.decode(snapshot.data.toString());
//               return ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: decode.length,
//                   itemBuilder: (context, index) {
//                     return Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Row(children: [
//                           ListTile(
//                             title: Text("Request #1"),
//                             //subtitle: Text("${decode[index]['date']}"),
//                             subtitle: Text("date"),
//                           ),
//                           //ADD CONDITIONS BASED ON STATUS FROM DATABASE
//                           ElevatedButton(
//                             onPressed: null,
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Color(0xFFFFF3C8),
//                               foregroundColor: Color(0xFFDCB631),
//                             ),
//                             child: const Text("PROCESSED"),
//                           )
//                         ]),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             // Text("Item: ${decode[index]['item']}"),
//                             // Text("Size: ${decode[index]['size']}")
//                             Text("Item: "),
//                             Text("Size: ")
//                           ],
//                         ),
//                         // Text("Gender: ${decode[index]['gender']}"),
//                         // Text("Address: ${decode[index]['address']}"),
//                         Text("Gender:"),
//                         Text("Address: "),
//                         //ADD PADDING AND ALIGNMENT
//                         ElevatedButton(
//                           onPressed: null,
//                           child: Text('Delete Request'),
//                         ),
//                       ],
//                     );
//                   });
//             } else if (snapshot.hasError) {
//               children = <Widget>[
//                 const Icon(
//                   Icons.error_outline,
//                   color: Colors.red,
//                   size: 60,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 16),
//                   child: Text('Error: ${snapshot.error}'),
//                 ),
//               ];
//             } else {
//               children = const <Widget>[
//                 SizedBox(
//                   width: 60,
//                   height: 60,
//                   child: CircularProgressIndicator(),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 16),
//                   child: Text('Awaiting result...'),
//                 ),
//               ];
//             }
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: children,
//               ),
//             );
//           }),
//     );
//   }

class _RequestWidgetState extends State<RequestWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
      child: Card(
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 1.0 / 11.0, vertical: height * 1.0 / 55.0),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Request #1",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E2E2E)),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "3/31/23",
                      style: TextStyle(
                          fontSize: 14,
                          fontStyle: FontStyle.italic,
                          color: Color(0xFF2E2E2E)),
                      textAlign: TextAlign.start,
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: null,
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7)),
                        minimumSize:
                            Size(width * 11.0 / 42.0, height * 1.0 / 25.0),
                        backgroundColor: const Color(0xFFFFF3C8),
                      ),
                      child: const Text("PROCESSED",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFDCB631))),
                    ),
                  ],
                )
              ]),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 1.0 / 55.0),
                  child: Column(
                    //single item
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Item #: ",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E2E2E)),
                        textAlign: TextAlign.left,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Text(
                                  "Size: ",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF808080)),
                                ),
                                Text(
                                  "Gender: ",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF808080)),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  "*insert size*",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF2E2E2E)),
                                ),
                                Text(
                                  "*insert gender*",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: 14, color: Color(0xFF2E2E2E)),
                                ),
                              ],
                            ),
                          ]),
                    ],
                  )),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 1.0 / 50.0),
                  child: Column(children: [
                    Text(
                      "Address ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2E2E2E)),
                    ),
                  ])),
              TextButton(
                onPressed: null,
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  minimumSize: Size(width * 11.0 / 42.0, height * 1.0 / 25.0),
                  backgroundColor: const Color(0xFFC4DBFE),
                ),
                child: const Text(
                  'Delete Request',
                  style: TextStyle(fontSize: 12, color: Color(0xFF2E2E2E)),
                ),
              ),
            ])),
      ),
    );
  }

  // Future<String> parseRequests() async {
  //   print('parse requests called');
  //   bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
  //   var url = isIOS
  //       ? Uri.parse('http://127.0.0.1:8080/requests/list')
  //       : Uri.parse('http://10.0.2.2:8080/requests/list');

  //   var response = await http.get(url);
  //   print('Response status: ${response.statusCode}');
  //   print('Response body: ${response.body}');
  //   return response.body;
  // }
}
