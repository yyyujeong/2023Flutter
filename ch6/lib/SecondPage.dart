import 'package:flutter/material.dart';
import 'package:ch6/Person.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Text('HELLO'),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
            child: Text('prev page'),
            onPressed: (){
              final person = Person('김둘리', 35);
              Navigator.pop(context, person);
            },
          ),
        ],
      ),
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}