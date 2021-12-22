import 'package:attendance_app/Functions/authentications.dart';
import 'package:attendance_app/Screens/login.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  static const String id = 'Register';

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sign Up',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 40.0,
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Enter email '),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: 'Enter password '),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Container(
              width: double.infinity,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  Authentication.signUpUser(
                      emailController.text, passwordController.text, context);
                },
                child: const Text('Sign Up'),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(SignIn.id, (route) => false);
                },
                child: const Text('Already have an account?, Sign In'))
          ],
        ),
      ),
    );
  }
}
