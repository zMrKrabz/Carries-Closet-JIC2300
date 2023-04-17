import 'package:artifact/admin_home_page.dart';
import 'package:artifact/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:artifact/home_page.dart";

import 'package:http/http.dart' as http;

class ClothingConfirmationPage extends StatefulWidget {
  final List<dynamic> genders, ages, items, sizes, emergencies, notes;
  const ClothingConfirmationPage(
      {super.key,
      required this.genders,
      required this.ages,
      required this.items,
      required this.sizes,
      required this.emergencies,
      required this.notes});
  @override
  _ClothingConfirmationPageState createState() {
    return _ClothingConfirmationPageState();
  }
}

class _ClothingConfirmationPageState extends State<ClothingConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            top: height * 1.0 / 32.0,
            left: width * 1.0 / 5.0,
            right: width * 1.0 / 5.0,
            bottom: height * 1.0 / 32.0),
        child: SizedBox(
          child: CupertinoButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              submitDB();
            },
            child: const Text("Save"),
          ),
        )),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 1.0 / 12.0
              ),
              child: Card(
                elevation: 0,
                color: Color(0xFFF9F9F9),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xFFD9D9D9)),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16)
                  )
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 1.0 / 55.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Item # $index',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0x00000000),                          
                                ),
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(width: width * 11.0 / 42.0)
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 1.0 / 12.0,
                          vertical: height * 1.0 / 55.0
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Gender: ${widget.genders[index]}',
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text('Item: ${widget.items[index]}',
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text('Size: ${widget.sizes[index]}',
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text('Emergency?: ${widget.emergencies[index]}',
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text('Age: ${widget.ages[index]}',
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text('Other Notes: ${widget.notes[index]}',
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      )
                    ],
                  ),
                  )
                ),
              );
        }
      ),
    );


    // return MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: Scaffold(
    //         body: SingleChildScrollView(
    //             scrollDirection: Axis.vertical,
    //             child: Column(children: [
    //               SizedBox(height: height * 1.0 / 18.0),
    //               Stack(alignment: Alignment.topLeft, children: [
    //                 Align(
    //                     alignment: Alignment.topLeft,
    //                     child: IconButton(
    //                         iconSize: width * 1.0 / 18.0,
    //                         onPressed: () {
    //                           Navigator.pop(context);
    //                         },
    //                         icon: const Icon(Icons.arrow_back))),
    //                 Align(
    //                     alignment: Alignment.bottomCenter,
    //                     child: Image.asset("assets/dsdf1.png",
    //                         height: height * 1.0 / 6.75,
    //                         width: height * 1.0 / 6.75,
    //                         alignment: Alignment.center))
    //               ]),
    //               SizedBox(height: height * 1.0 / 18.0),
    //               Padding(
    //                 padding:
    //                     EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
    //                 child: TextFormField(
    //                   enabled: false,
    //                   initialValue: widget.genders[0],
    //                   textInputAction: TextInputAction.done,
    //                   cursorColor: Colors.white,
    //                   decoration: const InputDecoration(
    //                     border: OutlineInputBorder(),
    //                     labelText: 'Gender',
    //                     hintText: 'Enter the gender',
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(height: height * 1.0 / 72.0),
    //               Padding(
    //                 padding:
    //                     EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
    //                 child: TextFormField(
    //                   enabled: false,
    //                   initialValue: widget.ages[0],
    //                   textInputAction: TextInputAction.done,
    //                   cursorColor: Colors.white,
    //                   decoration: const InputDecoration(
    //                     border: OutlineInputBorder(),
    //                     labelText: 'Age',
    //                     hintText: 'Enter the age',
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(height: height * 1.0 / 72.0),
    //               Padding(
    //                 padding:
    //                     EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
    //                 child: TextFormField(
    //                   enabled: false,
    //                   initialValue: widget.items[0],
    //                   textInputAction: TextInputAction.done,
    //                   cursorColor: Colors.white,
    //                   decoration: const InputDecoration(
    //                     border: OutlineInputBorder(),
    //                     labelText: 'Article of Clothing',
    //                     hintText: 'Enter the item',
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(height: height * 1.0 / 72.0),
    //               Padding(
    //                 padding:
    //                     EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
    //                 child: TextFormField(
    //                   enabled: false,
    //                   initialValue: widget.sizes[0],
    //                   textInputAction: TextInputAction.done,
    //                   cursorColor: Colors.white,
    //                   decoration: const InputDecoration(
    //                     border: OutlineInputBorder(),
    //                     labelText: 'Size (if needed)',
    //                     hintText: 'Enter the size or N/A if not needed',
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(height: height * 1.0 / 72.0),
    //               Padding(
    //                 padding:
    //                     EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
    //                 child: TextFormField(
    //                   enabled: false,
    //                   initialValue: widget.emergencies[0],
    //                   textInputAction: TextInputAction.done,
    //                   cursorColor: Colors.white,
    //                   decoration: const InputDecoration(
    //                     border: OutlineInputBorder(),
    //                     labelText: 'Emergency',
    //                     hintText: 'Yes or No',
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(height: height * 1.0 / 72.0),
    //               Padding(
    //                 padding:
    //                     EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
    //                 child: TextFormField(
    //                   enabled: false,
    //                   initialValue: widget.notes[0],
    //                   textInputAction: TextInputAction.done,
    //                   cursorColor: Colors.white,
    //                   decoration: const InputDecoration(
    //                     border: OutlineInputBorder(),
    //                     labelText: 'Other notes',
    //                     hintText:
    //                         'Please enter any extra information if needed',
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(height: height * 1.0 / 36.0),
    //               TextButton(
    //                 style: TextButton.styleFrom(
    //                   minimumSize: Size(width * 1.0 / 2.0, height * 1.0 / 13.5),
    //                   foregroundColor: Colors.black,
    //                   backgroundColor: const Color.fromARGB(255, 200, 200, 200),
    //                   textStyle: const TextStyle(
    //                       fontSize: 20, fontWeight: FontWeight.bold),
    //                 ),
    //                 onPressed: () => Navigator.of(context).pop(),
    //                 child: const Text('Cancel'),
    //               ),
    //               SizedBox(height: height * 1.0 / 72.0),
    //               TextButton(
    //                 style: TextButton.styleFrom(
    //                   minimumSize: Size(width * 1.0 / 2.0, height * 1.0 / 13.5),
    //                   foregroundColor: Colors.black,
    //                   backgroundColor: const Color.fromARGB(255, 200, 200, 200),
    //                   textStyle: const TextStyle(
    //                       fontSize: 20, fontWeight: FontWeight.bold),
    //                 ),
    //                 onPressed: () {
    //                   submitDB();
    //                   Navigator.push(context,
    //                       MaterialPageRoute(builder: ((context) {
    //                     return const HomePage();
    //                   })));
    //                 },
    //                 child: const Text('Submit Request'),
    //               ),
    //             ]))));
  }

  Future submitDB() async {
    //print('submit clothing called');
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    var uid = FirebaseAuth.instance.currentUser!.uid;
    var url = isIOS
        ? Uri.parse(
            'http://127.0.0.1:8080/requests/clothing/create?requester=$uid')
        : Uri.parse(
            'http://10.0.2.2:8080/requests/clothing/create?requester=$uid');

    var id_url = isIOS
        ? Uri.parse('http://127.0.0.1:8080/requestno?requester=$uid')
        : Uri.parse('http://10.0.2.2:8080/requestno?requester=$uid');

    if (uid == null || uid == "") {
      //print("failed: no current user");
      return;
    }

    await http.get(id_url).then((value) async {
      //var a = json.decode(value.toString());
      //print(a);
      //print(value.body.toString());
      var request_number = value.body.toString().substring(
          value.body.toString().indexOf(':') + 1,
          value.body.toString().indexOf('}'));
      var postBody = <String, dynamic>{};
      for (var i = 0; i < widget.items.length; i++) {
        postBody.addEntries(
          [
            MapEntry('gender${widget.genders[i]}', widget.genders[i]),
            MapEntry('age$i', widget.ages[i]),
            MapEntry('item$i', widget.items[i]),
            MapEntry('size$i', widget.sizes[i]),
            MapEntry('emergency$i', widget.emergencies[i]),
            MapEntry('notes$i', widget.notes[i]),
          ]
        );
      }
      postBody.addEntries(
        [
          MapEntry('uid', uid),
          MapEntry('requestno', request_number),
        ]
      );
      var response = await http.post(url, body: postBody);
      debugPrint('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');
    });
  }
}
