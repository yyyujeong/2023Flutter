import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:collection';

void main() {
  runApp(const MyApp());
}

class Event {
  final DateTime date;
  Event({required this.date});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter uj project',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'uj calendar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key:key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _now = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime? _selectedDay;
  List<String> days = ['_', 'Sun','Mon', 'Tue', 'Wen', 'Thu', 'Fri', 'Sat'];

  final _events = LinkedHashMap(
    equals: isSameDay,
  )..addAll({
    DateTime(2023,12,25) : Event(date : (2023,12,25))
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: TableCalendar(
          firstDay: DateTime.utc(2018, 1, 1),
          lastDay: DateTime.utc(2024, 1, 1),
          focusedDay: _now,
          headerVisible: true,
          calendarFormat: _calendarFormat,
          calendarStyle: CalendarStyle(
              defaultTextStyle: TextStyle(color: Colors.black54),
              weekendTextStyle: TextStyle(color: Colors.red),
              todayDecoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.indigo,width: 2.5)
              ),
              todayTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.indigo
              )
          ),
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            if(!isSameDay(_selectedDay, selectedDay)) {
              setState(() {
                _selectedDay = selectedDay;
                _now = focusedDay;
              });
            }
          },
          onFormatChanged: (format){
            if(_calendarFormat != format){
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay){
            _now = focusedDay;
          },
          calendarBuilders: CalendarBuilders(
            dowBuilder: (context, day){
              return Center(child: Text(days[day.weekday])) ;
            },
            markerBuilder: (context, date, events) {
              DateTime _date = DateTime(date.year, date.month, date.day);
              if(isSameDay(_date, _events[_date])) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.11,
                  padding: const EdgeInsets.only(bottom:5),
                  decoration: const BoxDecoration(
                    color: Colors.lightBlue,
                    shape: BoxShape.circle,
                  ),
                );
              }
            },
          ),

          headerStyle: HeaderStyle(
            titleCentered: true,
            formatButtonVisible: false,
            titleTextStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            rightChevronIcon: const Icon(
              Icons.arrow_right,
              size: 30.0,
            ),
          ),
        ),
      ),
    );
  }
}