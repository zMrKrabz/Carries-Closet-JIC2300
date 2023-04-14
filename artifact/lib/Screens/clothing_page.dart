// import "package:flutter/material.dart";
// import 'package:artifact/Screens/clothing_confirmation_page.dart';
// import 'package:artifact/home_page.dart';

// import 'clothingdata.dart';

// typedef OnDelete();

// class ClothingPageForm extends StatefulWidget {
//   // const ClothingPage({super.key});

//   final ClothingData page;
//   final state = _ClothingPageFormState();
//   final OnDelete onDelete;

//   ClothingPageForm({Key? key, required this.page, required this.onDelete})
//       : super(key: key);
//   @override
//   _ClothingPageFormState createState() => state;

//   bool isValid() => state.validate();
// }

// class _ClothingPageFormState extends State<ClothingPageForm> {
//   final List genders = ["Male", "Female", "Non-binary", "Other"];
//   String? genderValue;

//   final List items = ["Shirt", "Pants", "Jacket"];
//   String? itemValue;

//   final List sizes = ["Small", "Medium", "Large", "X-Large"];
//   String? sizeValue;

//   final List emergency = ["Yes", "No"];
//   String? emergencyValue;

//   final _clothingFormKey = GlobalKey<FormState>();
//   final genderController = TextEditingController();
//   final ageController = TextEditingController();
//   final articleController = TextEditingController();
//   final sizeController = TextEditingController();
//   final addressController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//         body: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Form(
//                 key: _clothingFormKey,
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
//                                 return const HomePage();
//                               })));
//                             },
//                             icon: const Icon(Icons.arrow_back))),
//                   ]),
//                   const Text("Clothing Request",
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 32,
//                           color: Color(0xFF2E2E2E))),
//                   Padding(
//                     padding: EdgeInsets.symmetric(
//                         horizontal: width * 1.0 / 12.0,
//                         vertical: height * 1.0 / 36.0),
//                     child: const Text(
//                       "Please fill out information to request a clothing item. If you chose a teenager size, please the specific size in the “Other Notes” section.",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(color: Color(0xFF2E2E2E)),
//                     ),
//                   ),
//                   SizedBox(height: height * 1.0 / 35.0),
//                   Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
//                       child: Row(
//                         children: <Widget>[
//                           Expanded(
//                               flex: 2,
//                               child: DropdownButtonFormField(
//                                 hint: const Text("Please select a gender"),
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
//                                   filled: true,
//                                   fillColor: const Color(0xFFF1F1F1),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderSide: const BorderSide(
//                                         width: 1, color: Color(0xFFF1F1F1)),
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                 ),
//                               )),
//                           SizedBox(
//                             width: width * 1.0 / 72.0,
//                           ),
//                           Expanded(
//                             child: TextField(
//                               controller: ageController,
//                               textInputAction: TextInputAction.done,
//                               cursorColor: Colors.white,
//                               decoration: InputDecoration(
//                                 filled: true,
//                                 fillColor: const Color(0xFFF1F1F1),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderSide: const BorderSide(
//                                       width: 1, color: Color(0xFFF1F1F1)),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 labelText: 'Age',
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
//                       hint: const Text("Please select a piece of clothing"),
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
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: const Color(0xFFF1F1F1),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide:
//                               const BorderSide(width: 1, color: Color(0xFFF1F1F1)),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: height * 1.0 / 72.0),
//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
//                     child: DropdownButtonFormField(
//                       hint: const Text("Please select a size"),
//                       value: sizeValue,
//                       onChanged: (val) {
//                         setState(() {
//                           sizeValue = val as String;
//                         });
//                       },
//                       validator: (value) {
//                         if (value == null) {
//                           print("please get inside");
//                           return "Value is needed";
//                         } else {
//                           return null;
//                         }
//                       },
//                       items: sizes.map((valueItem) {
//                         return DropdownMenuItem(
//                           value: valueItem,
//                           child: Text(valueItem),
//                         );
//                       }).toList(),
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: const Color(0xFFF1F1F1),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide:
//                               const BorderSide(width: 1, color: Color(0xFFF1F1F1)),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: height * 1.0 / 72.0),
//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
//                     child: DropdownButtonFormField(
//                       hint: const Text("Please select if it's an Emergency"),
//                       value: emergencyValue,
//                       onChanged: (val) {
//                         setState(() {
//                           emergencyValue = val as String;
//                         });
//                       },
//                       validator: (value) {
//                         if (value == null) {
//                           return "Value is required";
//                         }
//                       },
//                       items: emergency.map((valueItem) {
//                         return DropdownMenuItem(
//                           value: valueItem,
//                           child: Text(valueItem),
//                         );
//                       }).toList(),
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: const Color(0xFFF1F1F1),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide:
//                               const BorderSide(width: 1, color: Color(0xFFF1F1F1)),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: height * 1.0 / 72.0),
//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
//                     child: TextField(
//                       controller: addressController,
//                       textInputAction: TextInputAction.done,
//                       cursorColor: Colors.white,
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: const Color(0xFFF1F1F1),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide:
//                               const BorderSide(width: 1, color: Color(0xFFF1F1F1)),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         labelText: 'Address',
//                         hintText: 'Enter the address',
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//               SizedBox(height: height * 1.0 / 72.0),
//               DropdownButtonFormField(
//                 hint: Text("Article of Clothing*"),
//                 value: itemValue,
//                 onChanged: (val) {
//                   setState(() {
//                     itemValue = val as String;
//                   });
//                 },
//                 validator: (value) {
//                   if (value == null) {
//                     return "Piece of clothing is required";
//                   } else {
//                     return null;
//                   }
//                 },
//                 items: items.map((valueItem) {
//                   return DropdownMenuItem(
//                     value: valueItem,
//                     child: Text(valueItem),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(border: OutlineInputBorder()),
//               ),
//               SizedBox(height: height * 1.0 / 72.0),
//               DropdownButtonFormField(
//                 hint: Text("Size*"),
//                 value: sizeValue,
//                 // onSaved: (val) {
//                 //   if (val != null) {
//                 //     widget.page?.itemValue = val.toString();
//                 //   }
//                 // },
//                 onChanged: (val) {
//                   setState(() {
//                     sizeValue = val as String;
//                   });
//                 },
//                 validator: (value) {
//                   if (value == null) return "Please input a size";
//                   return null;
//                 },
//                 items: sizes.map((valueItem) {
//                   return DropdownMenuItem(
//                     value: valueItem,
//                     child: Text(valueItem),
//                   );
//                 }).toList(),
//                 decoration: InputDecoration(border: OutlineInputBorder()),
//               ),
//               SizedBox(height: height * 1.0 / 72.0),
//               SizedBox(
//                 height: height * 1.0 / 6.0,
//                 child: TextField(
//                   maxLines: null,
//                   expands: true,
//                   textInputAction: TextInputAction.done,
//                   cursorColor: Colors.white,
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Other notes',
//                     hintText: 'Please enter any extra information if needed',
//                   ),
//                   SizedBox(height: height * 1.0 / 72.0),
//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
//                     child: TextField(
//                       controller: notesController,
//                       textInputAction: TextInputAction.done,
//                       cursorColor: Colors.white,
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: const Color(0xFFF1F1F1),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide:
//                               const BorderSide(width: 1, color: Color(0xFFF1F1F1)),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         labelText: 'Other notes',
//                         hintText:
//                             'Please enter any extra information if needed',
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: height * 1.0 / 18.0),
//                   TextButton(
//                     style: TextButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       minimumSize: Size(width / 2.25, height * 1.0 / 16),
//                       backgroundColor: const Color(0xFF7EA5F4),
//                       textStyle: const TextStyle(
//                           fontSize: 18, fontWeight: FontWeight.bold),
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
//                     child: const Text(
//                       'Confirm',
//                       style: TextStyle(color: Color(0xFFF9F9F9)),
//                     ),
//                   ),
//                 ]))));
//   }
//   bool validate() {
//   // Validate Form Fields;
//    bool validate = _clothingFormKey.currentState!.validate();
//    if (validate) _clothingFormKey.currentState!.save();
//    return validate;
//   }
// }
