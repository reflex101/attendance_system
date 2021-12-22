import 'package:flutter/material.dart';

class TableModel {
  DateTime? dayOfTheWeek;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  String? courseCode;
  String? courseName;

  TableModel({
    this.dayOfTheWeek,
    this.startTime,
    this.endTime,
    this.courseCode,
    this.courseName,
  });
}
