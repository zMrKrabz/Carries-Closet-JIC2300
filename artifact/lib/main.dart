import 'dart:convert';

// import 'package:artifact/Screens/SignUp_Page.dart';
import 'package:artifact/Screens/sign_up_page.dart';
import 'package:artifact/Screens/login_page.dart';
import 'package:artifact/admin_home_page.dart';
import 'package:artifact/admin_login.dart';
import 'package:artifact/home_page.dart';
import 'package:artifact/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:artifact/Screens/open_page.dart';
import 'package:http/http.dart' as http;

const AlignmentGeometry topcenter = Alignment.topCenter;
const AlignmentGeometry topleft = Alignment.topLeft;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OpenPage(),
  ));
}

class MainPage extends StatelessWidget {
  final bool isLogin;
  const MainPage({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            String uid = FirebaseAuth.instance.currentUser?.uid ?? "";
            AppUser user = AppUser();
            if (snapshot.hasData) {
              return FutureBuilder(
                future: checkPermissions(context, uid),
                builder: (context, snapshot) {
                  if (snapshot.data == true) {
                    user.setAdminStatus(true);
                    return AdminHomePage();
                  } else if (snapshot.data == false) {
                    return HomePage();
                  } else {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                }
              );
              // To do:
              // get request to the python backend for user id
              // access the permissions flag
              // create var that is global/static? can be accessed
              // or make it a var that is passed between pages (more clunky but easier)

            } else if (isLogin) {
              return LoginPage();
            } else {
              return SignUpPage();
            }
            // if (snapshot.hasData) {
            //   return AdminHomePage();
            // } else if (isLogin) {
            //   return AdminHomePage();
            // } else {
            //   return AdminHomePage();
            // }
          },
        ),
      );
    Future<bool> checkPermissions(BuildContext context, String uid) async {
      bool isIOS = Theme.of(context).platform == TargetPlatform.iOS;
      var url = isIOS
        ? Uri.parse('http://127.0.0.1:8080/users?id=$uid')
        : Uri.parse('http://10.0.2.2:8080/users?id=$uid');
      var response = await http.get(url);
      var data = jsonDecode(response.body);
      try {
        return data['permissions'] == 'true'
          ? true
          : false;
      } catch (e) {
        return false;
      }
  }
}
