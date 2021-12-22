import 'package:attendance_app/Screens/home.dart';
import 'package:attendance_app/Screens/login.dart';
import 'package:attendance_app/Screens/timetable.dart';
import 'package:attendance_app/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      
      initialRoute: SignIn.id,
      routes: {
        TimeTable.id: (context) => const TimeTable(),
        SignIn.id: (context) => const SignIn(),
        Homepage.id: (context) =>const Homepage(),
        Register.id:(context) => const Register()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
