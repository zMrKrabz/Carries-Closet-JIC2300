import 'package:artifact/Screens/admin_request_page.dart';
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;
import 'dart:convert';

class FullRequestPage extends StatefulWidget {
  const FullRequestPage({super.key});

  @override
  _FullRequestPageState createState() {
    return _FullRequestPageState();
  }
}

class _FullRequestPageState extends State<FullRequestPage> {
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
                  SizedBox(height: height * 1.0 / 12.0),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: IconButton(
                            color: const Color(0xFF2E2E2E),
                            iconSize: width * 1.0 / 18.0,
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: ((context) {
                                return const AdminRequestPage();
                              })));
                            },
                            icon: const Icon(Icons.arrow_back)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Request #1",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF2E2E2E))),
                          Row(
                            children: [
                              const Text(
                                "Date Created: 3/31/23",
                                style: TextStyle(
                                    fontSize: 18, color: Color(0xFF2E2E2E)),
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(width: width * 2.0 / 7.0, height: 1),
                              const TextButton(
                                  onPressed: null,
                                  child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "Deny",
                                        style: TextStyle(
                                            color: Color(0xFFC36551),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      )))
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 1.0 / 17.0,
                          vertical: height * 1.0 / 55.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.person_outline,
                                color: Color(0xFF808080),
                              ),
                              Text("Contact Information",
                                  style: TextStyle(
                                      color: Color(0xFF808080),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 1.0 / 16,
                                top: height * 1.0 / 90.0),
                            child: const Text("Name",
                                style: TextStyle(
                                    color: Color(0xFF2E2E2E), fontSize: 14)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 1.0 / 16,
                                top: height * 1.0 / 130.0),
                            child: const Text("(123)-456-7890",
                                style: TextStyle(
                                    color: Color(0xFF2E2E2E), fontSize: 14)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 1.0 / 16,
                                top: height * 1.0 / 130.0),
                            child: const Text("Nname@gmail.com",
                                style: TextStyle(
                                    color: Color(0xFF2E2E2E), fontSize: 14)),
                          ),
                        ],
                      )),
                  const Divider(thickness: 1, color: Color(0xFFD5D5D5)),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 1.0 / 17.0,
                          vertical: height * 1.0 / 55.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.location_pin,
                                color: Color(0xFF808080),
                              ),
                              Text("Address",
                                  style: TextStyle(
                                      color: Color(0xFF808080),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 1.0 / 16,
                                top: height * 1.0 / 90.0),
                            child: const Text("7292 Dictum Av.",
                                style: TextStyle(
                                    color: Color(0xFF2E2E2E), fontSize: 14)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 1.0 / 16,
                                top: height * 1.0 / 130.0),
                            child: const Text("San Antonio, MI 47096",
                                style: TextStyle(
                                    color: Color(0xFF2E2E2E), fontSize: 14)),
                          ),
                        ],
                      )),
                  const Divider(thickness: 1, color: Color(0xFFD5D5D5)),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * 1.0 / 17.0,
                          vertical: height * 1.0 / 55.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.shopping_cart_outlined,
                                color: Color(0xFF808080),
                              ),
                              Text("Items",
                                  style: TextStyle(
                                      color: Color(0xFF808080),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: width * 1.0 / 40,
                                  top: height * 1.0 / 130.0),
                              child: const ItemWidget()),
                        ],
                      )),
                  SizedBox(height: height / 20.0),
                  ElevatedButton(
                      onPressed: null,
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        minimumSize:
                            Size(width * 11.0 / 42.0, height * 1.0 / 25.0),
                        backgroundColor: const Color(0xFF7EA5F4),
                      ),
                      child: const Text(
                        "Complete Request",
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFFF9F9F9)),
                      ))
                ]))));
  }
}

class ItemWidget extends StatefulWidget {
  const ItemWidget({super.key});

  @override
  _ItemWidgetState createState() {
    return _ItemWidgetState();
  }
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Card(
        color: const Color(0xFFF9F9F9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
            padding: EdgeInsets.only(
                left: width * 1.0 / 35.0,
                top: height * 1.0 / 75.0,
                bottom: height * 1.0 / 75.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Item Name",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2E2E2E))),
                    Padding(
                      padding: EdgeInsets.only(top: height * 1.0 / 130.0),
                      child: const Text("gender",
                          style: TextStyle(
                              color: Color(0xFF2E2E2E), fontSize: 14)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 1.0 / 130.0),
                      child: const Text("size",
                          style: TextStyle(
                              color: Color(0xFF2E2E2E), fontSize: 14)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 1.0 / 130.0),
                      child: const Text("other notes",
                          style: TextStyle(
                              color: Color(0xFF2E2E2E), fontSize: 14)),
                    ),
                  ],
                ),
                const SizedBox(height: 1, width: 1),
              ],
            )));
  }
}
