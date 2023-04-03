// import 'dart:html';
import 'package:artifact/home_page.dart';
import 'package:artifact/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../admin_home_page.dart';
import '../app_user.dart';

class ProfileForm extends StatefulWidget {
  final String email;
  final String password;
  const ProfileForm({super.key, required this.email, required this.password});

  @override
  ProfileFormState createState() {
    return ProfileFormState();
  }
}

class ProfileFormState extends State<ProfileForm> {
  static final _formKey = GlobalKey<FormState>();
  static final firstNameController = TextEditingController();
  static final lastNameController = TextEditingController();
  static final emailController = TextEditingController();
  static final phoneController = TextEditingController();
  static final countryController = TextEditingController();
  static final addressController = TextEditingController();
  static final cityController = TextEditingController();
  static final stateController = TextEditingController();
  static final zipController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    countryController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        key: _formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          Column(
            children: [
              SizedBox(height: height * 1.0 / 18.0),
              Stack(alignment: Alignment.topLeft, children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        iconSize: width * 1.0 / 18.0,
                        onPressed: () {
                          if (AppUser.isAdmin) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: ((context) {
                              return const AdminHomePage();
                            })));
                          } else {
                            Navigator.push(context,
                                MaterialPageRoute(builder: ((context) {
                              return const HomePage();
                            })));
                          }
                        },
                        icon: const Icon(Icons.arrow_back))),
              ]),
              //Names
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
              //   child: Row(
              //     children: [
              //       SizedBox(
              //           height: 50, width: 150, child: firstNameTextField()),
              //       SizedBox(
              //         width: 50,
              //       ),
              //       SizedBox(
              //         height: 50,
              //         width: 150,
              //         child: lastNameTextField(),
              //       )
              //     ],
              //   ),
              // ),
              SizedBox(height: height * 1.0 / 32.0),
              const Text("User Information",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 1.0 / 12.0,
                    vertical: height * 1.0 / 36.0),
                child: const Text(
                    "Please fill out information to edit the account",
                    textAlign: TextAlign.center),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                child: fullNameTextField(),
              ),

              SizedBox(height: height * 1.0 / 52.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                child: emailAddressTextField(),
              ),
              SizedBox(height: height * 1.0 / 52.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                child: phoneNumTextField(),
              ),
              SizedBox(height: height * 1.0 / 52.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                child: countyTextField(),
              ),
              SizedBox(height: height * 1.0 / 52.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                child: addressTextField(),
              ),
              SizedBox(height: height * 1.0 / 52.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                child: Row(
                  children: [
                    SizedBox(
                      // height: height *,
                      width: width * 1.0 / 2.0,
                      child: cityTextField(),
                    ),
                    SizedBox(width: width * 1.0 / 7.5),
                    SizedBox(
                      width: width * 1.0 / 5.0,
                      child: stateTextField(),
                    )
                  ],
                ),
              ), //City / State info

              SizedBox(height: height * 1.0 / 52.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
                child: Row(
                  children: [
                    SizedBox(
                      // height: height *,
                      width: width * 1.0 / 2.0,
                      child: zipTextField(),
                    ),
                    SizedBox(width: width * 1.0 / 20.0),
                  ],
                ),
              ), //City / State info

              SizedBox(height: height * 1.0 / 20.0),
              TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size(width / 2, height * 1.0 / 16),
                    backgroundColor: const Color(0xFF7EA5F4),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      bool isIOS =
                          Theme.of(context).platform == TargetPlatform.iOS;
                      update_user_info(isIOS, context);
                    }
                  },
                  child: const Text(
                    'Save',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFF9F9F9)),
                  )),
            ],
          )
        ]),
      ),
    ));
  }

  Future signUp() async {
    print('signing up...');

    var credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: widget.email,
      password: widget.password,
    );
    print(credential.user!.uid);
    bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
    Uri url = isIOS
        ? Uri.parse('http://127.0.0.1:8080/users/create')
        : Uri.parse('http://10.0.2.2:8080/users/create');

    if (credential.user == null) {
      print("Failed.");
      return;
    }

    var response = await http.post(url, body: {
      'id': credential.user!.uid,
      'email': credential.user!.email,
      'permissions': 'false'
    });
    print("posted response");
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  // TO DO:
  // make sure sign up is followed up by creating post request via flask server
  Future update_user_info(bool isIOS, var context) async {
    if (FirebaseAuth.instance.currentUser == null) {
      signUp();
    }
    var uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null || uid == "") {
      print("failed: no current user");
      return;
    }

    Uri url = isIOS
        ? Uri.parse('http://127.0.0.1:8080/users/update?id=$uid')
        : Uri.parse('http://10.0.2.2:8080/users/update?id=$uid');

    var response = await http.patch(url, body: {
      'firstName': ProfileFormState.firstNameController.text,
      'lastName': ProfileFormState.lastNameController.text,
      //email would require special handling to change the firebase auth email, so ignoring for now
      'phone': ProfileFormState.phoneController.text,
      'country': ProfileFormState.countryController.text,
      'address': ProfileFormState.addressController.text,
      'city': ProfileFormState.cityController.text,
      'state': ProfileFormState.stateController.text,
      'zip': ProfileFormState.zipController.text
    });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (AppUser.isAdmin) {
      Navigator.push(context, MaterialPageRoute(builder: ((context) {
        return const AdminHomePage();
      })));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: ((context) {
        return const HomePage();
      })));
    }
  }
}

Widget fullNameTextField() {
  return TextFormField(
    controller: ProfileFormState.firstNameController,
    decoration: InputDecoration(
      filled: true,
      fillColor: Color(0xFFF1F1F1),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Color(0xFFF1F1F1)),
        borderRadius: BorderRadius.circular(10),
      ),
      labelText: "Full Name",
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Name is Required";
      }
      return null;
    },
  );
}

Widget emailAddressTextField() {
  return TextFormField(
    controller: ProfileFormState.emailController,
    decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF1F1F1),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color(0xFFF1F1F1)),
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: "Email Address",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        )),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Last Name is Required";
      }
      return null;
    },
  );
}

Widget phoneNumTextField() {
  return TextFormField(
    controller: ProfileFormState.phoneController,
    decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF1F1F1),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color(0xFFF1F1F1)),
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: "Phone Number",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        )),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Phone Number is Required";
      }
      return null;
    },
  );
}

Widget countyTextField() {
  return TextFormField(
    controller: ProfileFormState.countryController,
    decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF1F1F1),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color(0xFFF1F1F1)),
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: "County Serving",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        )),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "County is Required";
      }
      return null;
    },
  );
}

Widget addressTextField() {
  return TextFormField(
    controller: ProfileFormState.addressController,
    decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF1F1F1),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color(0xFFF1F1F1)),
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: "Delivery Address",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        )),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Address is Required";
      }
      return null;
    },
  );
}

Widget cityTextField() {
  return TextFormField(
    controller: ProfileFormState.cityController,
    decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF1F1F1),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color(0xFFF1F1F1)),
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: "City",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        )),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "City is Required";
      }
      return null;
    },
  );
}

Widget stateTextField() {
  return TextFormField(
    controller: ProfileFormState.stateController,
    decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF1F1F1),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color(0xFFF1F1F1)),
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: "State",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        )),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "State is Required";
      }
      return null;
    },
  );
}

Widget zipTextField() {
  return TextFormField(
    controller: ProfileFormState.zipController,
    decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF1F1F1),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Color(0xFFF1F1F1)),
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: "Zip Code",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        )),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Zip Code is Required";
      }
      return null;
    },
  );
}
