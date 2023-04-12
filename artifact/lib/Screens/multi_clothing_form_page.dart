import 'package:artifact/Screens/clothing_form_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:artifact/Screens/clothing_form_2.dart';


// New page by Eph

class MultiClothingFormWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MultiClothingFormWidgetState();
  }
}

class _MultiClothingFormWidgetState extends State<MultiClothingFormWidget> {
  List<ClothingFormWidget> clothingForms = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Multi Contacts"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CupertinoButton(
          color: Theme.of(context).primaryColor,
          onPressed: () {
            onSave();
          },
          child: Text("Save"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
        onPressed: () {
          onAdd();
        },
      ),
      body: clothingForms.isNotEmpty
          ? ListView.builder(
              itemCount: clothingForms.length,
              itemBuilder: (_, index) {
                return clothingForms[index];
              })
          : Center(child: Text("Tap on + to Add Contact")),
    );
  }

  //Validate all forms and submit
  onSave() {
    bool allValid = true;

    //If any form validation function returns false means all forms are not valid
    clothingForms
        .forEach((element) => allValid = (allValid && element.isValidated()));

    if (allValid) {
      for (int i = 0; i < clothingForms.length; i++) {
        ClothingFormWidget item = clothingForms[i];
        debugPrint("Age: ${item.clothingFormInfo.ageValue}");
        debugPrint("Notes: ${item.clothingFormInfo.notesValue}");
      }
      //Submit Form Here
    } else {
      debugPrint("Form is Not Valid");
    }
  }

  //Delete specific form
  onRemove(ClothingFormInfo form) {
    setState(() {
      int index = clothingForms
          .indexWhere((element) => element.clothingFormInfo.id == form.id);
      if (clothingForms != null) clothingForms.removeAt(index);
    });
  }

  //Add New Form
  onAdd() {
    setState(() {
      ClothingFormInfo clothingForm = ClothingFormInfo(id: clothingForms.length);
      clothingForms.add(ClothingFormWidget(
        index: clothingForms.length,
        clothingFormInfo: clothingForm,
        onRemove: () => onRemove(clothingForm),
      ));
    });
  }
}