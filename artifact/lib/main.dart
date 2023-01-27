import 'package:artifact/Screens/open_page.dart';
import 'package:flutter/material.dart';

const AlignmentGeometry topcenter = Alignment.topCenter;
const AlignmentGeometry topleft = Alignment.topLeft;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OpenPage(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        children: [
          SizedBox(height: 35),
          Row(children: [
            SizedBox(width: 10),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
          ]),
          SizedBox(height: 65),
          Image.asset("assets/dsdf1.png",
              height: 200, width: 200, alignment: topcenter),

          const Padding(
            padding: EdgeInsets.only(left: 0, top: 0, right: 190, bottom: 0),
            child: Text(
              'Username',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 80, top: 4, right: 80, bottom: 30),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your username',
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 0, top: 0, right: 200, bottom: 0),
            child: Text(
              'Password',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 80, top: 4, right: 80, bottom: 30),
            child: TextField(
              obscureText: true,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your password',
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 50, top: 0, right: 180, bottom: 0),
            child: Text(
              'Re-enter Password',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 80, top: 4, right: 80, bottom: 30),
            child: TextField(
              obscureText: true,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Re-enter your password',
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(left: 80, top: 100, right: 80, bottom: 30),
            // child: TextButton(
            //   style: TextButton.styleFrom(
            //     foregroundColor: Colors.black,
            //     backgroundColor: Colors.grey,
            //     textStyle: const TextStyle(fontSize: 20),
            //   ),
            //   onPressed: () {},
            //   child: const Text('Signup'),
            // ),
          ),

          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Color.fromARGB(255, 200, 200, 200),
              textStyle: TextStyle(fontSize: 16),
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return HomeScreen();
              })));
            },
            child: const Text('Signup'),
          ),
          // new Container(
          //     child: ElevatedButton(
          //   child: Text("Signup",
          //       style: TextStyle(color: Colors.black, fontSize: 16)),
          //   onPressed: null,
          // ))
        ],
      )),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  // String firstName;
  // String lastName;
  // String email;
  // String phoneNumber;
  // String county;
  // String address;
  // String city;
  // String state;
  // String zipCode;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget firstNameTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "First Name"),
      // validator: (String value) {
      //   if(value.isEmpty) {
      //     return "Name is Required";
      //   }
      // },
    );
  }

  Widget lastNameTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Last Name"),
    );
  }

  Widget emailAddressTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Email Address"),
    );
  }

  Widget phoneNumTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Phone Number"),
    );
  }

  Widget countyTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "County Serving"),
    );
  }

  Widget addressTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Delivery Address"),
    );
  }

  Widget cityTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "City"),
    );
  }

  Widget stateTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "State"),
    );
  }

  Widget zipTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Zip Code"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(children: [
              SizedBox(width: 10),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back)),
            ]),
            SizedBox(
                child: Image(image: AssetImage("assets/dsdf1.png")),
                height: 250,
                width: 250),
            //Names
            Row(
              children: [
                SizedBox(child: firstNameTextField(), height: 50, width: 150),
                SizedBox(
                  width: 50,
                ),
                SizedBox(child: lastNameTextField(), height: 50, width: 150)
              ],
            ),
            emailAddressTextField(),
            phoneNumTextField(),
            countyTextField(),
            addressTextField(),

            //City / State info
            Row(
              children: [
                SizedBox(
                  child: cityTextField(),
                  height: 50,
                  width: 150,
                ),
                SizedBox(width: 50),
                SizedBox(
                  child: stateTextField(),
                  height: 50,
                  width: 60,
                )
              ],
            ),

            zipTextField(),

            // SizedBox(
            //   child: zipTextField(),
            //   height: 100,
            //   width: 150,
            // ),

            SizedBox(height: 100),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Color.fromARGB(255, 200, 200, 200),
                textStyle: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return OpenPage();
                })));
              },
              child: const Text('Save'),
            ),
          ],
        )),
      ),
    );
  }
}
