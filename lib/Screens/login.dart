import 'package:attendance_app/Functions/authentications.dart';
import 'package:attendance_app/register.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  static const String id = 'login';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
              'Login',
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
                  Authentication.loginUser(
                      emailController.text, passwordController.text, context);
                },
                child: const Text('Sign In'),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(Register.id, (route) => false);
                },
                child: const Text('Dont have an account?, Sign Up'))
          ],
        ),
      ),
    );
  }
}
