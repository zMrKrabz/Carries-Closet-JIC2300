import "package:flutter/material.dart";
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
                  SizedBox(height: height * 1.0 / 18.0),
                  Stack(alignment: Alignment.topLeft, children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                            iconSize: width * 1.0 / 18.0,
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: ((context) {
                                return const AdminHomePage();
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
    return Card(
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
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: const Text("Request #1"),
                          subtitle: Text("${decode[index]['date']}"),
                          trailing: const Icon(Icons.more_vert),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Item: ${decode[index]['item']}"),
                            Text("Size: ${decode[index]['size']}")
                          ],
                        ),
                        Text("Gender: ${decode[index]['gender']}"),
                        Text("Address: ${decode[index]['address']}"),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              ElevatedButton(
                                onPressed: null,
                                child: Text('Complete'),
                              ),
                              SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: null,
                                child: Text('Deny'),
                              ),
                              SizedBox(width: 8),
                            ])
                      ],
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

  void updateRequest(String id) async {
    print('update request called');
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    var url = isIOS
        ? Uri.parse('http://127.0.0.1:8080/requests/update?id=' + id)
        : Uri.parse('http://10.0.2.2:8080/requests/update?id=' + id);

    var response = await http.put(url, body: {'permissions': 'true'});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  void deleteRequest(String id) async {
    print('delete request called');
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    var url = isIOS
        ? Uri.parse('http://127.0.0.1:8080/requests/remove?id=' +
            '6KEpYXHpb2rJEBRco35D')
        : Uri.parse('http://10.0.2.2:8080/requests/remove?id=' + id);

    var response = await http.delete(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
