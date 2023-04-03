import "package:flutter/material.dart";
import 'package:artifact/Screens/hygiene_confirmation_page.dart';
import 'package:artifact/home_page.dart';

class HygienePage extends StatefulWidget {
  const HygienePage({super.key});

  @override
  _HygienePageState createState() {
    return _HygienePageState();
  }
}

class _HygienePageState extends State<HygienePage> {
  final genderController = TextEditingController();
  final ageController = TextEditingController();
  final itemController = TextEditingController();
  final sizeController = TextEditingController();
  final emergencyController = TextEditingController();
  final addressController = TextEditingController();
  final notesController = TextEditingController();

  final List genders = ["Male", "Female", "Non-binary", "Other"];
  String? genderValue;

  final List items = ["Toothpaste", "Toothbrush", "Deodorant", "Other"];
  String? itemValue;

  final List sizes = ["Small", "Medium", "Large", "X-Large"];
  String? sizeValue;

  final List emergency = ["Yes", "No"];
  String? emergencyValue;

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
                                return const HomePage();
                              })));
                            },
                            icon: const Icon(Icons.arrow_back))),
                  ]),
                  const Text("Hygiene Request",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                          color: Color(0xFF2E2E2E))),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 1.0 / 12.0,
                        vertical: height * 1.0 / 36.0),
                    child: const Text(
                      "Please fill out information to request a hygiene item.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF2E2E2E)),
                    ),
                  ),
                  SizedBox(height: height * 1.0 / 35.0),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                    child: DropdownButtonFormField(
                      hint: const Text("Please select a gender"),
                      value: genderValue,
                      onChanged: (val) {
                        setState(() {
                          genderValue = val as String;
                        });
                      },
                      items: genders.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF1F1F1),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xFFF1F1F1)),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 1.0 / 72.0),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                    child: TextField(
                      controller: ageController,
                      textInputAction: TextInputAction.done,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF1F1F1),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xFFF1F1F1)),
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Age',
                        hintText: 'Enter the age',
                      ),
                    ),
                  ),
                  SizedBox(height: height * 1.0 / 72.0),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                    child: DropdownButtonFormField(
                      hint: const Text("Please select a hygiene item"),
                      value: itemValue,
                      onChanged: (val) {
                        setState(() {
                          itemValue = val as String;
                        });
                      },
                      items: items.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF1F1F1),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xFFF1F1F1)),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 1.0 / 72.0),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                    child: DropdownButtonFormField(
                      hint: const Text("Please select a size (if needed)"),
                      value: sizeValue,
                      onChanged: (val) {
                        setState(() {
                          sizeValue = val as String;
                        });
                      },
                      items: sizes.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF1F1F1),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xFFF1F1F1)),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 1.0 / 72.0),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                    child: DropdownButtonFormField(
                      hint: const Text("Please select if it's an Emergency"),
                      value: emergencyValue,
                      onChanged: (val) {
                        setState(() {
                          emergencyValue = val as String;
                        });
                      },
                      items: emergency.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF1F1F1),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xFFF1F1F1)),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 1.0 / 72.0),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                    child: TextField(
                      controller: addressController,
                      textInputAction: TextInputAction.done,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF1F1F1),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xFFF1F1F1)),
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Address',
                        hintText: 'Enter the address',
                      ),
                    ),
                  ),
                  SizedBox(height: height * 1.0 / 72.0),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                    child: TextField(
                      controller: notesController,
                      textInputAction: TextInputAction.done,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF1F1F1),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Color(0xFFF1F1F1)),
                            borderRadius: BorderRadius.circular(10)),
                        labelText: 'Other notes',
                        hintText:
                            'Please enter any extra information if needed',
                      ),
                    ),
                  ),
                  SizedBox(height: height * 1.0 / 18.0),
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minimumSize: Size(width / 2.25, height * 1.0 / 16),
                      backgroundColor: const Color(0xFF7EA5F4),
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      // if (genderValue.toString().compareTo("null") == 0) {
                      //   genderValue = "N/A";
                      // }
                      // if (itemValue.toString().compareTo("null") == 0) {
                      //   itemValue = "N/A";
                      // }
                      // if (sizeValue.toString().compareTo("null") == 0) {
                      //   sizeValue = "N/A";
                      // }
                      // if (emergencyValue.toString().compareTo("null") == 0) {
                      //   emergencyValue = "N/A";
                      // }
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return HygieneConfirmationPage(
                          gender: genderValue.toString(),
                          age: ageController.text,
                          item: itemValue.toString(),
                          size: sizeValue.toString(),
                          emergency: emergencyValue.toString(),
                          address: addressController.text,
                          notes: notesController.text,
                        );
                      })));
                    },
                    child: const Text('Confirm',
                        style: TextStyle(color: Color(0xFFF9F9F9))),
                  ),
                ]))));
  }
}
