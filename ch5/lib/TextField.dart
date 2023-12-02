import 'package:flutter/material.dart';

class TextField extends StatefulWidget{
  const TextField({super.key});

  @override
  State<TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<TextField>{
  String inputText = 'input contents';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(('Text Field')),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Text('$inputText',
          style: TextStyle(
            fontSize: 35
          ),
          ),
          SizedBox(
            height: 45,
          ),
          TextField(
            onChanged: (text){
              setState(() {
                inputText = text;
              });
            },
          ),
          SizedBox(
            height: 45,
          ),
          TextField(
            onChanged: (text){
              setState(() {
                inputText = text;
              });
            },
            decoration : InputDecoration(
              labelText: '여기에 입력하세요'
            ),
          ),
          SizedBox(
            height: 45,
          ),
          TextField(
            onChanged: (text){
              setState(() {inputText = text;});
            },
            decoration: InputDecoration(
              labelText: '여기에 입력하세요.'
            ),
          ),
        ],
      ),
    );
  }
}