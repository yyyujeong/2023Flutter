import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();

}

class _MyCustomFormState extends State<MyCustomForm> {
  String inputmassage='hello';
  final myController = TextEditingController();
  initState(){
    super.initState();
    myController.addListener(_printLatestValue);
  }
  _printLatestValue(){
    setState(() {
      inputmassage = myController.text;
    });
  }
  @override
  void dispose(){
    myController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyCustomForm Test'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('$inputmassage'),
            TextField( onChanged: (text){
              setState(() {
                inputmassage=text;
              });
            }),
            SizedBox(height: 20,),
            TextField(
              controller: myController,
            ),
          ],
        ),
      ),
    );
  }

}