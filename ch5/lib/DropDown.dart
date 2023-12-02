import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  final valueList = {'First Item', 'Second Item', 'Third Item'};
  String selectedItem = 'First Item';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DropDown Test"),
        backgroundColor: Colors.blueGrey,
      ),
      body: DropdownButton(
        value: selectedItem,
        items: valueList.map(
            (value){
              return DropdownMenuItem(
                  value: value,
                  child: Text(value),
              );
            }
        ).toList(),
        onChanged: (String? value){
          setState(() {
            selectedItem = value!;
          });
        },
      )
      ); // This trailing comma makes auto-formatting nicer for build methods.

  }
}


