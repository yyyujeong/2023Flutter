import 'package:flutter/material.dart';

class DatePickerTest extends StatefulWidget {
  const DatePickerTest({super.key});

  // This widget is the root of your application.
  @override
  State<DatePickerTest> createState() => _DatePickerTestState();
}


class _DatePickerTestState extends State<DatePickerTest> {
  DateTime? selectedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DatePickerTest"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          ElevatedButton(
            child: Text('Slect Date'),
            onPressed: (){
              Future<DateTime?>selectedDate = showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2018),
                  lastDate: DateTime(2030),
                  builder: (BuildContext, Widget? child){
                    return Theme(
                      data: ThemeData.dark(),
                      child: child!,
                    );
                  },
              );
              selectedDate.then((dateTime){
                setState(() {
                  selectedTime = dateTime;
                });
              }
              );

          },
          ),
          Text('$selectedTime'),
        ],
      )
      ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}
