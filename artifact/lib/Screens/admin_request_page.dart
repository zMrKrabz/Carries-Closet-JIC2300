import "package:flutter/material.dart";
import "package:artifact/home_page.dart";
import "package:artifact/admin_home_page.dart";

import 'package:http/http.dart' as http;
import 'dart:convert';

class AdminRequestPage extends StatefulWidget {
  const AdminRequestPage({super.key});

  @override
  _AdminRequestPageState createState() {
    return _AdminRequestPageState();
  }
}

class _AdminRequestPageState extends State<AdminRequestPage> {
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
                  SizedBox(height: height * 1.0 / 13.5),
                  Stack(alignment: Alignment.topLeft, children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            iconSize: width * 1.0 / 18.0,
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: ((context) {
                                return AdminHomePage();
                              })));
                            },
                            icon: const Icon(Icons.arrow_back))),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          children: [
                            SizedBox(height: height * 1.0 / 100.0),
                            const Text(
                              'Orders',
                              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)
                            )
                          ],)
                    )
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

class _RequestWidgetState extends State<RequestWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return DefaultTextStyle(
      style: TextStyle(fontSize: 14),
      child: FutureBuilder<String>(
          future: parseRequests(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              List<dynamic> decode = json.decode(snapshot.data.toString());
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: decode.length,
                  itemBuilder: (context, index) { 
                    int reqNum = index + 1;

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: height * 1.0 / 55.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Request #$reqNum',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF2E2E2E)
                                        ),
                                        textAlign: TextAlign.left
                                      ),
                                      Text(
                                        '${decode[index]['date']}',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontStyle: FontStyle.italic,
                                          color: Color(0xFF2E2E2E)
                                        ),
                                        textAlign: TextAlign.start,
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(width: width * 11.0 / 42.0)
                                    ]
                                  )
                                ]
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: width * 1.0 / 12.0,
                                  vertical: height * 1.0 / 55.0
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Item #: ${decode[index]['item']}',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF2E2E2E)
                                      ),
                                      textAlign: TextAlign.left
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              'Size: ',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF808080)
                                              ),
                                              textAlign: TextAlign.left
                                            ),
                                            Text(
                                              'Gender: ',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF808080),
                                              ),
                                              textAlign: TextAlign.left
                                            )
                                          ]
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              decode[index]['size'],
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF2E2E2E)
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                            Text(
                                              decode[index]['gender'],
                                              style: const TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF2E2E2E)
                                              ),
                                              textAlign: TextAlign.right,
                                            )
                                          ],
                                        )
                                      ]
                                    )
                                  ]
                                )
                              ),
                              TextButton(
                                onPressed: null,
                                style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFFC4DBFE))
                                ),
                                child: Text(
                                  'View Full Request',
                                  style: TextStyle(
                                    color: Color(0xFF2E2E2E)
                                  ))
                              )
                            ]
                          )
                        ),
                      )
                    );
                  }
              );
            }
            else if (snapshot.hasError) {
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

  Future<String> parseRequests() async {
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

// return Card(
                    //   color: Color.fromRGBO(220,220,220,1.0),
                    //   shape: const RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.only(
                    //       topLeft: Radius.circular(16),
                    //       bottomLeft: Radius.circular(16),
                    //       topRight: Radius.circular(16), 
                    //       bottomRight: Radius.circular(16))
                    //   ),
                    //   child: Column(
                    //     mainAxisSize: MainAxisSize.min,
                    //     children: [
                    //     ListTile(
                    //       title: Text(
                    //         'Request #$reqNum',
                    //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    //       subtitle: Text(
                    //         '${decode[index]['date']}',
                    //         style: const TextStyle(
                    //           fontSize: 14, 
                    //           fontStyle: FontStyle.italic, 
                    //           color: Color(0xFF2E2E2E)
                    //         )
                    //       ),
                    //       // trailing: Icon(Icons.clean_hands_rounded)
                    //       // trailing: Icon(Icons.local_laundry_service_rounded)
                    //     ),
                    //     Padding(
                    //       padding: EdgeInsets.symmetric(
                    //         horizontal: width * 1.0 / 12.0,
                    //         vertical: height * 1.0 / 55.0),
                    //       child: Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         const Text(
                    //           'Item #1',
                    //           style: TextStyle(
                    //             fontSize: 16,
                    //             fontWeight: FontWeight.bold,
                    //             color: Color(0xFF2E2E2E)
                    //           )
                    //         ),
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: const [
                    //                 Text(
                    //                   'Size:',
                    //                   textAlign: TextAlign.left,
                    //                   style: TextStyle(fontSize: 14, color: Color(0xFF808080))
                    //                 ),
                    //                 Text(
                    //                   'Gender:',
                    //                   textAlign: TextAlign.left,
                    //                   style: TextStyle(fontSize: 14, color: Color(0xFF808080))
                    //                 )
                    //               ]
                    //             )
                    //           ]
                    //         )
                    //       ]
                    //     )
                    //   )
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     SizedBox(width: width * 1.0 / 24.0),
                        //     Text(
                        //       'Item #1: ${decode[index]['item']}',
                        //       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                        //     )
                        //   ]
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     SizedBox(width: width * 1.0 / 24.0),
                        //     Text(
                        //       'Size:   ${decode[index]['size']}',
                        //     )
                        //   ]
                        // ),
                        // Row(
                        //   children: [
                        //     SizedBox(height: height * 1.0 / 40.0)
                        //   ]
                        // )
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     Text()
                        //   ]
                        // )
                      //   ListTile(
                      //     title: Text("Request #$reqNum"),
                      //     subtitle: Text("${decode[index]['date']}"),
                      //     trailing: Icon(Icons.more_vert),
                      //   ),
                      //   Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       Text("Item: ${decode[index]['item']}"),
                      //       Text("Size: ${decode[index]['size']}")
                      //     ],
                      //   ),
                      //   Text("Gender: ${decode[index]['gender']}"),
                      //   Text("Address: ${decode[index]['address']}"),
                      //   Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: <Widget>[
                      //         ElevatedButton(
                      //           onPressed: null,
                      //           child: const Text('Complete'),
                      //         ),
                      //         const SizedBox(width: 8),
                      //         ElevatedButton(
                      //           onPressed: null,
                      //           child: Text('Deny'),
                      //         ),
                      //         const SizedBox(width: 8),
                      //       ])
                      // ],
                  //   )
                  //   );
                  // });