import 'package:artifact/Screens/clothing_page_original.dart';
import 'package:collection/collection.dart';
import "package:flutter/material.dart";
import 'package:artifact/Screens/clothing_confirmation_page.dart';
import 'package:artifact/home_page.dart';
import 'package:artifact/Screens/clothing_page.dart';
import 'clothingdata.dart';

class ClothingMultiPage extends StatefulWidget {
  // const ClothingPage({super.key});
  @override
  _ClothingMultiPageState createState() => _ClothingMultiPageState();
}

class _ClothingMultiPageState extends State<ClothingMultiPage> {
  List<ClothingData> forms = [];
  List<ClothingPageForm> requests = [];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    requests.clear();
    // forms.add(ClothingPageData());
    for (int i = 0; i < forms.length; i++) {
      requests.add(ClothingPageForm(
        page: forms[i],
        onDelete: () => onDelete(i),
      ));
    }
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          // appBar: AppBar(actions: [Actions(actions: <Widget>[]>, child: child)]),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(height: height * 1.0 / 18.0),
            Stack(alignment: Alignment.topLeft, children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      iconSize: width * 1.0 / 18.0,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return HomePage();
                        })));
                      },
                      icon: const Icon(Icons.arrow_back))),
            ]),
            const Text("Clothing Request",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 1.0 / 12.0,
                  vertical: height * 1.0 / 36.0),
              child: const Text(
                  "Please fill out information to request a clothing item. If you chose a teenager size, please the specific size in the “Other Notes” section.",
                  textAlign: TextAlign.center),
            ),
            Flexible(
              child: forms.isEmpty
                  ? const Center(child: Text("Add items below"))
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: forms.length,
                      // itemBuilder: (_, i) => requests,
                      itemBuilder: ((_, i) => ClothingPageForm(
                            key: GlobalKey(),
                            page: forms[i],
                            onDelete: () => onDelete(i),
                          )),
                    ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(width * 1.0 / 2.0, height * 1.0 / 13.5),
                foregroundColor: Colors.black,
                backgroundColor: Color.fromARGB(255, 200, 200, 200),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: onSave,
              child: const Text('Confirm'),
            )
          ])),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: onAddForm,
      ),
    );
  }

  // void onDelete(ClothingData data) {
  //   setState(() {
  //     var find = requests.firstWhereOrNull(
  //       (it) => it.page == data,
  //     );
  //     if (find != null) requests.removeAt(requests.indexOf(find));
  //   });
  // }

  void onDelete(int i) {
    setState(() {
      forms.removeAt(i);
    });
  }

  // void onAddForm() {
  //   setState(() {
  //     var _form = ClothingData();
  //     print("got inside on add form");
  //     requests.add(ClothingPageForm(
  //       page: _form,
  //       onDelete: () => onDelete(_form),
  //     ));
  //   });
  // }

  void onAddForm() {
    setState(() {
      forms.add(ClothingData());
    });
  }

  void onSave() {
    requests.forEach((request) => request.isValid());
    print('HI"');
    requests.forEach((request) => print(request.isValid()));
  }
}
