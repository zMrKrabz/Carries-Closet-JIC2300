// import "package:flutter/material.dart";
// import 'package:artifact/Screens/clothing_confirmation_page.dart';
// import 'package:artifact/home_page.dart';

// class ClothingPageData {
//   String genderValue;
//   String itemValue;

//   ClothingPageData({this.genderValue = "", this.itemValue = ""});
// }

// typedef OnDelete();

// class ClothingPage extends StatefulWidget {
//   // const ClothingPage({super.key});

//   final ClothingPage page;
//   final state = _ClothingPageState();
//   final OnDelete onDelete;

//   ClothingPage({this.page, this.onDelete});
//   @override
//   _ClothingPageState createState() {
//     return _ClothingPageState();
//   }
// }

// class _ClothingPageState extends State<ClothingPage> {
//   final List genders = ["Male", "Female", "Non-binary", "Other"];
//   String? genderValue;

//   final List items = ["Shirt", "Pants", "Jacket"];
//   String? itemValue;

//   final List sizes = ["Small", "Medium", "Large", "X-Large"];
//   String? sizeValue;

//   final List emergency = ["Yes", "No"];
//   String? emergencyValue;

//   final genderController = TextEditingController();
//   final ageController = TextEditingController();
//   final itemController = TextEditingController();
//   final sizeController = TextEditingController();
//   final emergencyController = TextEditingController();
//   final addressController = TextEditingController();
//   final notesController = TextEditingController();

//   final _formKey = GlobalKey<FormState>();
//   bool _autovalidate = false;

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return Scaffold(
//         body: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Form(
//                 key: _formKey,
//                 child: Column(children: [
//                   SizedBox(height: height * 1.0 / 18.0),
//                   Stack(alignment: Alignment.topLeft, children: [
//                     Align(
//                         alignment: Alignment.topLeft,
//                         child: IconButton(
//                             iconSize: width * 1.0 / 18.0,
//                             onPressed: () {
//                               Navigator.push(context,
//                                   MaterialPageRoute(builder: ((context) {
//                                 return HomePage();
//                               })));
//                             },
//                             icon: const Icon(Icons.arrow_back))),
//                   ]),
//                   const Text("Clothing Request",
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: width * 1.0 / 12.0,
//                         vertical: height * 1.0 / 36.0),
//                     child: const Text(
//                         "Please fill out information to request a clothing item. If you chose a teenager size, please the specific size in the “Other Notes” section.",
//                         textAlign: TextAlign.center),
//                   ),
//                   SizedBox(height: height * 1.0 / 25.0),
//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "Item 1",
//                         textAlign: TextAlign.left,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
//                       child: Row(
//                         children: <Widget>[
//                           Expanded(
//                               flex: 2,
//                               child: DropdownButtonFormField(
//                                 hint: Text("Gender*"),
//                                 value: genderValue,
//                                 onChanged: (val) {
//                                   setState(() {
//                                     genderValue = val as String;
//                                   });
//                                 },
//                                 validator: (value) {
//                                   if (value == null) {
//                                     return "Gender is required";
//                                   }
//                                 },
//                                 items: genders.map((valueItem) {
//                                   return DropdownMenuItem(
//                                     value: valueItem,
//                                     child: Text(valueItem),
//                                   );
//                                 }).toList(),
//                                 decoration: InputDecoration(
//                                     border: OutlineInputBorder()),
//                               )),
//                           SizedBox(
//                             width: width * 1.0 / 72.0,
//                           ),
//                           Expanded(
//                             child: TextField(
//                               controller: ageController,
//                               textInputAction: TextInputAction.done,
//                               cursorColor: Colors.white,
//                               decoration: const InputDecoration(
//                                 border: OutlineInputBorder(),
//                                 labelText: 'Age*',
//                                 hintText: 'Enter the age',
//                               ),
//                             ),
//                           )
//                         ],
//                       )),
//                   SizedBox(height: height * 1.0 / 72.0),
//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
//                     child: DropdownButtonFormField(
//                       hint: Text("Article of Clothing*"),
//                       value: itemValue,
//                       onChanged: (val) {
//                         setState(() {
//                           itemValue = val as String;
//                         });
//                       },
//                       validator: (value) {
//                         if (value == null) {
//                           return "Piece of clothing is required";
//                         }
//                       },
//                       items: items.map((valueItem) {
//                         return DropdownMenuItem(
//                           value: valueItem,
//                           child: Text(valueItem),
//                         );
//                       }).toList(),
//                       decoration: InputDecoration(border: OutlineInputBorder()),
//                     ),
//                   ),
//                   SizedBox(height: height * 1.0 / 72.0),
//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
//                     child: DropdownButtonFormField(
//                       hint: Text("Size*"),
//                       value: sizeValue,
//                       onChanged: (val) {
//                         setState(() {
//                           sizeValue = val as String;
//                         });
//                       },
//                       validator: (value) {
//                         if (value == null) {
//                           return "Size is required";
//                         }
//                       },
//                       items: sizes.map((valueItem) {
//                         return DropdownMenuItem(
//                           value: valueItem,
//                           child: Text(valueItem),
//                         );
//                       }).toList(),
//                       decoration: InputDecoration(border: OutlineInputBorder()),
//                     ),
//                   ),
//                   SizedBox(height: height * 1.0 / 72.0),
//                   Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
//                       child: SizedBox(
//                         height: height * 1.0 / 6.0,
//                         child: TextField(
//                           maxLines: null,
//                           expands: true,
//                           controller: notesController,
//                           textInputAction: TextInputAction.done,
//                           cursorColor: Colors.white,
//                           decoration: const InputDecoration(
//                             border: OutlineInputBorder(),
//                             labelText: 'Other notes',
//                             hintText:
//                                 'Please enter any extra information if needed',
//                           ),
//                         ),
//                       )),
//                   SizedBox(height: height * 1.0 / 18.0),
//                   TextButton(
//                     style: TextButton.styleFrom(
//                       minimumSize: Size(width * 1.0 / 2.0, height * 1.0 / 13.5),
//                       foregroundColor: Colors.black,
//                       backgroundColor: Color.fromARGB(255, 200, 200, 200),
//                       textStyle: const TextStyle(
//                           fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         _formKey.currentState!.save();
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: ((context) {
//                           return ClothingConfirmationPage(
//                             gender: genderValue.toString(),
//                             age: ageController.text,
//                             item: itemValue.toString(),
//                             size: sizeValue.toString(),
//                             emergency: emergencyValue.toString(),
//                             address: addressController.text,
//                             notes: notesController.text,
//                           );
//                         })));
//                       } else {
//                         setState(() {
//                           _autovalidate = true;
//                         });
//                       }
//                     },
//                     child: const Text('Confirm'),
//                   ),
//                 ]))));
//   }
// }
