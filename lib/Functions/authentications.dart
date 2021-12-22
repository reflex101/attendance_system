import 'package:attendance_app/Screens/home.dart';
import 'package:attendance_app/Screens/login.dart';
import 'package:attendance_app/Screens/timetable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Authentication {
  //sign up
  static Future<void> signUpUser(String email, password, context) async {
    showDialog(
        context: context,
        builder: (BuildContext ctx) => const LinearProgressIndicator(
              minHeight: 20.0,
            ));

    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .catchError((e) {
      PlatformException thisEx = e;
    });

    if (userCredential != false) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (BuildContext ctx) {
        return const TimeTable();
      }), (route) => false);
    }
  }

  //sign in

  static Future<void> loginUser(
      String email, password, BuildContext context) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext ctx) => const LinearProgressIndicator(
              minHeight: 2,
            ));

    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .catchError((ex) {
      Navigator.pop(context);
      PlatformException thisError = ex;
      print(
        thisError.toString(),
      );
    });

    DatabaseReference userRef = FirebaseDatabase.instance
        .reference()
        .child('users/${userCredential.user!.uid}');

    userRef.once().then((DataSnapshot snapshot) {
      if (snapshot.value != null) {
        Navigator.pushNamedAndRemoveUntil(
            context, TimeTable.id, (route) => false);
      }
    });
  }

  static Future<void> updateUserTimeTable(String course, code, start, end, day) async {
    var currentUser = FirebaseAuth.instance.currentUser;
    DatabaseReference databaseReference = FirebaseDatabase.instance
        .reference()
        .child('users/${currentUser!.uid}');

    Map timeTable = {
      'course_name': course,
      'course_code': code,
      'start_time': start,
      'end_time': end,
      'day':day
    };

    databaseReference.set(timeTable);
  }
}
