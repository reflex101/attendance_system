import 'package:flutter/material.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({Key? key}) : super(key: key);

  static const String id = 'timetable';

  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  var courseController = TextEditingController();
  var courseCodeController = TextEditingController();
  late TimeOfDay startTime;
  late TimeOfDay endTime;
  // late List<String> days = [
  //   "Monday",
  //   "Tuesday",
  //   "Wednesday",
  //   "Thursday",
  //   "Friday",
  //   "Saturday",
  //   "Sunday",
  // ];

  // List<Map> usersTable = [
  //   {
  //     "course": "",
  //     "course_code": "",
  //     "start_time": "",
  //     "end_time": "",
  //     "day": ""
  //   }
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          children: [
            const Text(
              'Enter your timetable',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
            ),
            TextField(
              controller: courseController,
              decoration: const InputDecoration(hintText: 'Enter Course name '),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: courseCodeController,
              decoration: const InputDecoration(hintText: 'Enter Course code '),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
