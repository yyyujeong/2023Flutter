import 'package:flutter/material.dart';
import 'package:ch6/Person.dart';
import 'package:ch6/SecondPage.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String resultStr ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Text(resultStr),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              child: Text('next page'),
              onPressed: () async {
                final person = new Person('홍길동', 30);
                final result = await Navigator.pushNamed(
                    context,
                    '/second');
                setState(() {
                  //resultStr = result.name;
                });
              },
          ),
        ],
      ),
      ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}