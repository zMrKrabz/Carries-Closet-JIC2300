import "package:flutter/material.dart";
import 'package:artifact/Screens/clothing_confirmation_page.dart';
import 'package:artifact/home_page.dart';

import 'clothingdata.dart';

typedef OnDelete();

class ClothingPageForm extends StatefulWidget {
  // const ClothingPage({super.key});

  final ClothingData page;
  final state = _ClothingPageFormState();
  final OnDelete onDelete;

  ClothingPageForm({Key? key, required this.page, required this.onDelete})
      : super(key: key);
  @override
  _ClothingPageFormState createState() => state;

  bool isValid() => state.validate();
}

class _ClothingPageFormState extends State<ClothingPageForm> {
  final List genders = ["Male", "Female", "Non-binary", "Other"];
  String? genderValue;

  final List items = ["Shirt", "Pants", "Jacket"];
  String? itemValue;

  final List sizes = ["Small", "Medium", "Large", "X-Large"];
  String? sizeValue;

  final List emergency = ["Yes", "No"];
  String? emergencyValue;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
      child: Card(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                leading: Icon(Icons.people),
                title: Text("Item"),
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                      onPressed: widget.onDelete, icon: Icon(Icons.delete))
                ],
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      flex: 2,
                      child: DropdownButtonFormField(
                        hint: Text("Gender*"),
                        value: genderValue,
                        onChanged: (value) {
                          setState(() {
                            genderValue = value as String;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            "Gender is required";
                          } else {
                            null;
                          }
                        },
                        items: genders.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                        decoration:
                            InputDecoration(border: OutlineInputBorder()),
                      )),
                  SizedBox(
                    width: width * 1.0 / 72.0,
                  ),
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value != null) {
                          print("please get inside");
                          return "Value is needed";
                        } else {
                          return null;
                        }
                      },
                      textInputAction: TextInputAction.done,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Age*',
                        hintText: 'Enter the age',
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: height * 1.0 / 72.0),
              DropdownButtonFormField(
                hint: Text("Article of Clothing*"),
                value: itemValue,
                onChanged: (val) {
                  setState(() {
                    itemValue = val as String;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return "Piece of clothing is required";
                  } else {
                    return null;
                  }
                },
                items: items.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList(),
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(height: height * 1.0 / 72.0),
              DropdownButtonFormField(
                hint: Text("Size*"),
                value: sizeValue,
                // onSaved: (val) {
                //   if (val != null) {
                //     widget.page?.itemValue = val.toString();
                //   }
                // },
                onChanged: (val) {
                  setState(() {
                    sizeValue = val as String;
                  });
                },
                validator: (value) {},
                items: sizes.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                  );
                }).toList(),
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              SizedBox(height: height * 1.0 / 72.0),
              SizedBox(
                height: height * 1.0 / 6.0,
                child: TextField(
                  maxLines: null,
                  expands: true,
                  textInputAction: TextInputAction.done,
                  cursorColor: Colors.white,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Other notes',
                    hintText: 'Please enter any extra information if needed',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool validate() {
    var valid = _formKey.currentState!.validate();
    if (valid != null) {
      _formKey.currentState?.save();
      print("form is finally valid");
    }
    print("validate inside clothing_page");
    print(valid);
    if (valid == null) {
      return false;
    } else {
      return true;
    }
  }
  // bool validate() {
  //Validate Form Fields
  //  bool validate = _formKey.currentState.validate();
  //  if (validate) _formKey.currentState.save();
  //  return validate;
  // }
}
