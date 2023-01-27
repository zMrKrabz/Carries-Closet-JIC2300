import "package:flutter/material.dart";

const AlignmentGeometry topcenter = Alignment.topCenter;
const AlignmentGeometry topleft = Alignment.topLeft;

class OpenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset("assets/123.png",
            height: 200, width: 200, alignment: topcenter),
        Column(children: [
          OutlinedButton(onPressed: () {}, child: Text("Login")),
          ElevatedButton(onPressed: () {}, child: Text("Signup")),
        ])
      ],
    )));
  }
}
