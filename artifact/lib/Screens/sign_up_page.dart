import 'package:artifact/Screens/open_page.dart';
import 'package:artifact/Screens/profile_page.dart';
import 'package:email_validator/email_validator.dart';
import "package:flutter/material.dart";


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final reEnterController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
        children: [
          SizedBox(height: height * 1.0 / 18.0),
          Stack(alignment: Alignment.topLeft, children: [
            Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    iconSize: width * 1.0 / 18.0,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return const OpenPage();
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
          SizedBox(height: height * 1.0 / 13.5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (email) =>
                email != null && !EmailValidator.validate(email)
                  ? 'Please enter a valid email'
                  : null,
              controller: emailController,
              textInputAction: TextInputAction.done,
              cursorColor: Colors.white,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
                hintText: 'Enter your username',
              ),
            ),
          ),
          SizedBox(height: height * 1.0 / 18.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (password) => 
                password != null && (password.length < 6)
                  ? 'Passwords must be at least 6 characters'
                  : null,
              controller: passwordController,
              // textInputAction: TextInputAction.done,
              obscureText: true,
              obscuringCharacter: '*',
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                hintText: 'Enter your password',
              ),
            ),
          ),
          SizedBox(height: height * 1.0 / 18.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 1.0 / 12.0),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (reEnter) => 
                reEnter != null && !(reEnter == passwordController.text.trim())
                  ? 'Passwords must match'
                  : null,
              controller: reEnterController,
              // textInputAction: TextInputAction.done,
              obscureText: true,
              obscuringCharacter: '*',
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Re-Enter Password',
                hintText: 'Re-enter your password',
              ),
            ),
          ),
          SizedBox(height: height * 1.0 / 13.5),
          TextButton(
            style: TextButton.styleFrom(
              minimumSize: Size(width * 1.0 / 2.0, height * 1.0 / 13.5),
              foregroundColor: Colors.black,
              backgroundColor: const Color.fromARGB(255, 200, 200, 200),
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            onPressed: goToProfilePage,
            child: const Text('Signup'),
          ),
        ],
      )
      ),
    ),
    );
  }
  void goToProfilePage() {
    final isValidForm = _formKey.currentState!.validate();
    print('going to profile page');
    if (isValidForm) {
      String emailString = emailController.text.trim();
      String passwordString = passwordController.text.trim();
      Navigator.push(context, 
      MaterialPageRoute(builder: (context) => ProfileForm(email: emailString, password: passwordString)));
    }
    // dispose();
  }
}
